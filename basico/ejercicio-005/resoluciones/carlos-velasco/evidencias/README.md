# Ejercicio 005 - SELECT para taller mecánico de motos

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se creó la tabla principal `motos` para almacenar información de los vehículos.
- Se creó la tabla `reparaciones` para registrar los servicios realizados en el taller.
- Se implementó una relación mediante clave foránea entre motos y reparaciones.
- Se agregaron restricciones `PRIMARY KEY`, `FOREIGN KEY`, `NOT NULL`, `DEFAULT`, `UNIQUE` y `CHECK`.
- Los datos permiten validar consultas con filtros, ordenamientos, agregaciones y reportes.
- Las consultas fueron diseñadas para responder preguntas de negocio del taller mecánico.