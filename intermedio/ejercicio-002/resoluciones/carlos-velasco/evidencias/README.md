# Ejercicio 002 - LEFT JOIN

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se modelaron dos tablas: `clanes` y `jugadores`.
- La relación es de uno a muchos mediante la clave foránea `clan_id`.
- Se dejó un clan sin jugadores y un jugador sin clan para demostrar el funcionamiento de `LEFT JOIN`.
- Las consultas muestran cómo recuperar registros aunque no exista una coincidencia en la tabla relacionada.