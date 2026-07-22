# Ejercicio 003 - PRIMARY KEY

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se creó una única tabla llamada `inventario_skins`.
- La clave primaria se implementó mediante la columna `id` con `AUTO_INCREMENT`.
- Se añadieron restricciones `NOT NULL`, `DEFAULT`, `CHECK` y `PRIMARY KEY` para garantizar la integridad de los datos.