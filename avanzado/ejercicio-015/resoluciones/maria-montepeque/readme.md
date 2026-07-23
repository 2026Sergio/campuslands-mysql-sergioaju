# Ejercicio 015 (avanzado) - maria-montepeque

Tematica: biblioteca gamer. Dos tablas (`desarrolladoras_biblioteca_opt` con 40 filas, `juegos_biblioteca_opt` con 4000 filas generadas con un procedimiento temporal) usadas para comparar 3 pares de consultas "antes/despues" con `EXPLAIN ANALYZE` (que ejecuta la consulta de verdad y mide tiempos reales, no estimados).

## Resultado real de los 3 pares (los numeros importan mas que la teoria)

### Par A — subconsulta correlacionada vs JOIN + GROUP BY

Se esperaba que el `JOIN` fuera mas rapido (evitar el "problema N+1"). El resultado real fue el **contrario**: la subconsulta correlacionada tardo ~0.77ms en total, mientras que el `JOIN` + `GROUP BY` tardo entre 1.6ms y 4ms.

**Por que**: la penalizacion de una subconsulta correlacionada crece con la cantidad de filas de la tabla externa (aqui, 40 desarrolladoras). Con solo 40 iteraciones y un indice eficiente para cada lookup, el costo extra es minimo. El clasico problema N+1 se vuelve grave con miles o millones de filas externas, no con 40. Leccion real: el consejo "evita subconsultas correlacionadas" depende de la cardinalidad, no es una regla absoluta.

### Par B — `NOT IN` vs `NOT EXISTS`

Ambas consultas produjeron **el mismo plan exacto** (`Nested loop antijoin`, mismo costo, mismo tiempo real ~0.2ms).

**Por que**: el optimizador de MySQL 8 reescribe automaticamente un `NOT IN (subconsulta)` como un antijoin equivalente a `NOT EXISTS` cuando la columna (`desarrolladora_id`) es `NOT NULL` (no hay ambiguedad de `NULL` que resolver). Leccion real: la advertencia clasica sobre `NOT IN` es mas relevante en motores mas antiguos o con columnas nullable; en MySQL 8 moderno, con datos `NOT NULL`, el optimizador ya lo resuelve por si solo.

### Par C — `ORDER BY` sin indice vs con indice

Aqui si hubo una mejora real, pero **no automatica**:

| Variante | Plan | Costo estimado | Tiempo real |
| --- | --- | --- | --- |
| Sin indice | Table scan + Sort (filesort) | 404 | ~3.47ms |
| Con indice creado, SIN forzarlo (incluso despues de `ANALYZE TABLE`) | Table scan + Sort (identico al anterior) | 404 | ~3.03ms |
| Con indice, usando `FORCE INDEX` | Index scan en reversa, sin sort | **5.01** | **~0.11ms** |

El optimizador **no eligio el indice por si solo** aunque existia y `ANALYZE TABLE` habia actualizado las estadisticas. Solo forzandolo con `FORCE INDEX` aparecio el plan optimo real: un recorrido del indice en reversa que evita ordenar las 4000 filas y solo lee las 20 que hacen falta. Con el indice forzado, el tiempo real bajo de ~3ms a ~0.11ms (unas 30 veces mas rapido). Leccion real: crear el indice correcto no siempre basta; a veces hace falta el criterio de un DBA (`FORCE INDEX`) para que el optimizador use el plan realmente optimo, y entender por que el optimizador eligio distinto es tan importante como saber crear el indice.

## Decisiones tecnicas

- `desarrolladoras_biblioteca_opt` se genera con un `INSERT ... WITH RECURSIVE` (40 filas) en vez de escribirlas a mano.
- `juegos_biblioteca_opt` se llena con un procedimiento temporal (`sp_generar_juegos_opt`, eliminado despues de usarse) que genera 4000 filas, asignando juegos solo a las desarrolladoras 1-35 (las 36-40 quedan sin juegos a proposito, para el par B).
- `CONSTRAINT chk_precio_juegos_opt CHECK (precio >= 0)` evita datos imposibles.

## Archivos

- `ddl/schema.sql` — dos tablas + `FOREIGN KEY` + `CHECK` (los indices de optimizacion se crean en `dql/consultas.sql`, junto a las consultas que los usan).
- `dml/inserts.sql` — 40 desarrolladoras (CTE recursivo) + 4000 juegos (procedimiento temporal).
- `dql/consultas.sql` — 3 pares antes/despues con `EXPLAIN ANALYZE` (7 sentencias en total: subconsulta vs JOIN, NOT IN vs NOT EXISTS, ORDER BY sin indice vs con indice sin forzar vs con indice forzado).
- `evidencias/resultados_consultas.txt` — salida real y completa de `EXPLAIN ANALYZE` para los 3 pares, con los tiempos reales que sustentan las conclusiones de arriba.

## Ejecutar

```bash
docker exec -i campuslands-mysql-db mysql -u campus -pcampus123 campuslands_mysql < ddl/schema.sql
docker exec -i campuslands-mysql-db mysql -u campus -pcampus123 campuslands_mysql < dml/inserts.sql   # ~25s por el volumen de datos
docker exec -i campuslands-mysql-db mysql -u campus -pcampus123 campuslands_mysql < dql/consultas.sql
```
