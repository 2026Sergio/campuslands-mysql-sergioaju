# ejercicio 005 - taller mecanico de motos

solucion del ejercicio 005 enfocado en la ejecucion de consultas SELECT de analisis para un taller mecanico.

## decisiones tecnicas
- la tabla registra las ordenes de trabajo de motocicletas con sus costos asociados.
- se aplico `enum` para controlar el estado del mantenimiento (`pendiente`, `en_proceso`, `completado`).
- las consultas incluyen calculos de suma (`SUM`), promedios (`AVG`), conteos (`COUNT`) y filtros combinados.

## archivos
- `ddl/schema.sql`: estructura de la tabla del taller mecanico.
- `dml/inserts.sql`: 9 registros de servicios y ordenes de trabajo.
- `dql/consultas.sql`: 5 consultas con filtros y reportes de negocio.

## orden de ejecucion
1. ejecutar `ddl/schema.sql`
2. ejecutar `dml/inserts.sql`
3. ejecutar `dql/consultas.sql`