# Ejercicio 004 - Triggers

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se crearon las tablas `motos` e `historial_ingresos`.
- Se implementó el trigger `trg_registrar_moto`.
- Cada vez que se inserta una moto, el trigger registra automáticamente el evento en la tabla de historial.
- Se añadieron restricciones `PRIMARY KEY`, `FOREIGN KEY`, `NOT NULL`, `DEFAULT` y `CHECK` para garantizar la integridad de los datos.