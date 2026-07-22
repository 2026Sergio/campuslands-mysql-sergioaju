# Ejercicio 001 - INNER JOIN

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`, respetando la plantilla del ejercicio.
- Se modelaron dos tablas: `equipos` y `jugadores`.
- La relación entre ambas es de uno a muchos mediante la clave foránea `equipo_id`.
- Se aplicaron restricciones `PRIMARY KEY`, `FOREIGN KEY`, `UNIQUE`, `NOT NULL`, `CHECK` y `DEFAULT`.
- Todas las consultas utilizan `INNER JOIN` para obtener información relacionada entre jugadores y equipos.