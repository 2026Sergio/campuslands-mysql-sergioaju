# Ejercicio 007 - ORDER BY para liga de fútbol

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se creó la tabla `equipos_futbol` para almacenar estadísticas de equipos deportivos.
- Se agregaron restricciones `PRIMARY KEY`, `NOT NULL`, `DEFAULT`, `ENUM` y `CHECK` para garantizar datos válidos.
- Se registraron ocho equipos con información coherente de rendimiento deportivo.
- Las consultas fueron diseñadas para practicar `ORDER BY` con orden ascendente, descendente y ordenamiento múltiple.
- Se utilizó `LIMIT` para generar rankings y reportes de los mejores equipos.