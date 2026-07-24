# Ejercicio 005 (avanzado) - maria-montepeque

Tematica: taller mecanico de motos. Tabla `servicios_taller_motos_idx` con 3000 ordenes de servicio, usada para comparar con `EXPLAIN` el rendimiento de una consulta **antes** y **despues** de crear un indice.

## Decisiones tecnicas

- La tabla se crea a proposito **sin** indices de rendimiento (solo `PRIMARY KEY` y el `UNIQUE` de `numero_orden`). Los indices se agregan mas adelante en `dql/consultas.sql`, justo antes de repetir la misma consulta, para que el "antes" y el "despues" queden documentados en el mismo archivo.
- Se necesitaba un volumen de datos realista para que la diferencia fuera visible (con pocas filas, MySQL escanea la tabla completa igual de rapido que usando un indice). Por eso `dml/inserts.sql` crea un procedimiento temporal (`sp_generar_servicios_taller_idx`) que genera 3000 filas con datos variados (15 clientes, 4 mecanicos, 4 estados, costos y fechas aleatorias) usando un `WHILE`, y se elimina apenas termina de usarse: es una herramienta de carga, no parte del esquema final.
- `CONSTRAINT chk_costo_taller_idx CHECK (costo >= 0)` evita costos invalidos.

### Resultado de la comparacion con EXPLAIN

| Consulta | Antes del indice | Despues del indice |
| --- | --- | --- |
| `WHERE cliente = 'Carlos Reyes'` | `type = ALL`, `rows = 3000` (recorre toda la tabla) | `type = ref`, `key = idx_cliente_taller`, `rows = 192` |
| `WHERE mecanico = 'Julio Sanchez' AND estado = 'finalizada'` | `type = ALL`, `rows = 3000` | `type = ref`, `key = idx_mecanico_estado_taller`, `rows = 189` |

`SHOW INDEX` (consulta 6) confirma los 4 indices activos al final: `PRIMARY`, el `UNIQUE` de `numero_orden`, `idx_cliente_taller` (simple) e `idx_mecanico_estado_taller` (compuesto, sobre 2 columnas).

## Archivos

- `ddl/schema.sql` — tabla + `UNIQUE` + `CHECK`, sin indices de rendimiento.
- `dml/inserts.sql` — procedimiento temporal para generar 3000 filas, `CALL` y `DROP PROCEDURE`.
- `dql/consultas.sql` — 6 consultas: `EXPLAIN` antes de indexar por cliente, `CREATE INDEX` + `EXPLAIN` despues, `EXPLAIN` antes de indexar por mecanico+estado, `CREATE INDEX` compuesto + `EXPLAIN` despues, un reporte de negocio (top 5 clientes) y `SHOW INDEX` final.
- `evidencias/resultados_consultas.txt` — salida real de las 6 consultas ejecutadas contra MySQL en Docker, con los planes de `EXPLAIN` antes y despues de cada indice.

## Ejecutar

```bash
docker exec -i campuslands-mysql-db mysql -u campus -pcampus123 campuslands_mysql < ddl/schema.sql
docker exec -i campuslands-mysql-db mysql -u campus -pcampus123 campuslands_mysql < dml/inserts.sql
docker exec -i campuslands-mysql-db mysql -u campus -pcampus123 campuslands_mysql < dql/consultas.sql
```
