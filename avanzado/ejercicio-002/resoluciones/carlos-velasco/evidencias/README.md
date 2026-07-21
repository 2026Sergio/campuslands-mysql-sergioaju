# Ejercicio 002 - Procedimientos Almacenados

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se modelaron las tablas `clanes` y `jugadores`.
- Se creó el procedimiento almacenado `registrar_jugador` para centralizar el registro de nuevos jugadores.
- Las inserciones de jugadores se realizan mediante `CALL`, evitando repetir sentencias `INSERT` y facilitando el mantenimiento del código.