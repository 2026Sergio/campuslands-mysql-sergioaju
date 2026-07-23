# Ejercicio 009 - DELETE controlado para kickboxing

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se creó la tabla `combates_kickboxing` para administrar información de luchadores.
- Se agregaron restricciones `PRIMARY KEY`, `NOT NULL`, `DEFAULT`, `ENUM` y `CHECK`.
- Se insertaron ocho registros con diferentes estados deportivos.
- Las consultas fueron diseñadas para practicar `DELETE` con condiciones controladas.
- Se utilizaron filtros específicos para evitar eliminaciones masivas accidentales.
- La consulta final permite comprobar qué registros permanecen después de ejecutar los DELETE.