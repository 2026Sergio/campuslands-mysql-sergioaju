# Ejercicio 001 - Transacciones

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.
4. Ejecutar la transacción de ejemplo.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se modelaron tres tablas: `equipos`, `jugadores` e `historial_fichajes`.
- Se empleó una transacción para representar el fichaje de un jugador entre equipos.
- La operación actualiza presupuestos, cambia el equipo del jugador y registra el movimiento en el historial. Si alguna instrucción falla, la transacción puede revertirse mediante `ROLLBACK`, garantizando la integridad de los datos.