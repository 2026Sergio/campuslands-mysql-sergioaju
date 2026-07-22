# Ejercicio 005 - Subconsultas para taller mecánico de motos

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se creó la tabla `motos` como entidad principal del taller.
- Se creó la tabla `servicios` para almacenar los mantenimientos realizados.
- Se relacionaron ambas tablas mediante una clave foránea.
- Se agregaron restricciones `PRIMARY KEY`, `FOREIGN KEY`, `NOT NULL`, `DEFAULT`, `UNIQUE` y `CHECK`.
- Las consultas fueron construidas utilizando subconsultas para resolver preguntas de negocio.
- Se utilizaron comparaciones contra promedios, valores máximos, acumulados y existencia de registros relacionados.
- Los datos permiten validar escenarios normales y casos donde una moto posee varios servicios.