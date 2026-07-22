# Ejercicio 010 (intermedio) - maria-montepeque

Tematica: carreras urbanas. Tabla `pilotos_carreras_urbanas` disenada para practicar distintos niveles de `UNIQUE`: simple y compuesto.

## Decisiones tecnicas

- `nombre` **no** es `UNIQUE` a proposito: pueden existir dos pilotos reales distintos con el mismo nombre (homonimos). Por eso se insertaron dos filas con `nombre = 'Kairo Vega'`, cada una con su propio `alias` y `licencia_piloto`.
- `alias` y `licencia_piloto` son `UNIQUE` de forma independiente: son los identificadores que realmente distinguen a cada piloto sin ambiguedad.
- `CONSTRAINT uq_nombre_vehiculo_carreras UNIQUE (nombre, vehiculo)` es un `UNIQUE` compuesto: evita cargar dos veces la misma combinacion de piloto+vehiculo por error, sin impedir los homonimos (que tienen vehiculos distintos).
- `CONSTRAINT chk_puntos_carreras_urbanas CHECK (puntos_temporada >= 0)` evita datos imposibles.

### Verificacion manual de las restricciones UNIQUE

Antes de generar la evidencia final, probe (fuera del script entregable, directamente contra el contenedor Docker) que las restricciones realmente bloquean duplicados:

- Insertar un piloto con `alias = 'K-Vega'` (ya usado) fallo con `ERROR 1062 (Duplicate entry 'K-Vega' for key ... alias)`.
- Insertar la misma combinacion `nombre = 'Kairo Vega'` + `vehiculo = 'Nissan Silvia S15'` fallo con `ERROR 1062` por el `UNIQUE` compuesto.

Ambos intentos fallaron sin llegar a insertar nada, asi que los datos no se modificaron y no fue necesario restaurar el estado antes de generar la evidencia.

## Archivos

- `ddl/schema.sql` — tabla + `UNIQUE` simple (alias, licencia_piloto) + `UNIQUE` compuesto (nombre, vehiculo) + `CHECK`.
- `dml/inserts.sql` — 10 pilotos, incluyendo dos homonimos con distinto alias/licencia/vehiculo.
- `dql/consultas.sql` — 6 consultas (listado completo, prueba de unicidad de alias, top 5 por puntos, activos por circuito, busqueda exacta por alias, homonimos por nombre).
- `evidencias/resultados_consultas.txt` — salida real de las 6 consultas ejecutadas contra MySQL en Docker.

## Ejecutar

```bash
docker exec -i campuslands-mysql-db mysql -u campus -pcampus123 campuslands_mysql < ddl/schema.sql
docker exec -i campuslands-mysql-db mysql -u campus -pcampus123 campuslands_mysql < dml/inserts.sql
docker exec -i campuslands-mysql-db mysql -u campus -pcampus123 campuslands_mysql < dql/consultas.sql
```
