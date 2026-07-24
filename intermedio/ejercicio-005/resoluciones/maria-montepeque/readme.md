# Ejercicio 005 (intermedio) - maria-montepeque

Tematica: taller mecanico de motos. Tabla `servicios_taller_motos` con 12 ordenes de servicio, pensada para practicar distintos tipos de subconsultas.

## Decisiones tecnicas

- El cliente `Mateo Cruz` tiene una sola orden a proposito (todos los demas clientes tienen 2 o mas), para poder distinguirlo claramente en la consulta de subconsulta con `IN`/`HAVING COUNT(*) > 1`.
- `numero_orden` es `UNIQUE` como clave de negocio de cada orden.
- `CONSTRAINT chk_costo_servicios_taller_intermedio CHECK (costo >= 0)` evita costos invalidos.
  El nombre del constraint es unico dentro de la base de datos para no chocar con los `CHECK` de otros ejercicios.
- Las consultas cubren los tipos de subconsulta mas comunes (objetivo del ejercicio):
  1. Subconsulta escalar en `WHERE` (comparar contra un promedio general).
  2. Subconsulta escalar con `MAX`.
  3. Subconsulta con `IN` alimentada por un `GROUP BY ... HAVING`.
  4. Subconsulta correlacionada (compara cada fila contra el promedio de su propio grupo).
  5. Subconsulta con `NOT IN`.
  6. Subconsulta en el `FROM` (tabla derivada) combinada con otra subconsulta escalar.

## Archivos

- `ddl/schema.sql` — tabla + `UNIQUE` en numero_orden + `CHECK` de costo.
- `dml/inserts.sql` — 12 ordenes de 6 clientes y 3 mecanicos.
- `dql/consultas.sql` — 6 consultas con subconsultas (costo mayor al promedio general, orden mas cara, clientes con mas de una orden, costo mayor al promedio de su tipo de servicio, clientes sin reparaciones, mecanico con mayor total facturado).
- `evidencias/resultados_consultas.txt` — salida real de las 6 consultas ejecutadas contra MySQL en Docker.

## Ejecutar

```bash
docker exec -i campuslands-mysql-db mysql -u campus -pcampus123 campuslands_mysql < ddl/schema.sql
docker exec -i campuslands-mysql-db mysql -u campus -pcampus123 campuslands_mysql < dml/inserts.sql
docker exec -i campuslands-mysql-db mysql -u campus -pcampus123 campuslands_mysql < dql/consultas.sql
```
