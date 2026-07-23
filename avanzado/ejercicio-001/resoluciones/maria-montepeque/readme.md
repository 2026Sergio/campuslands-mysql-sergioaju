# Ejercicio 001 (avanzado) - maria-montepeque

Tematica: torneo esports MOBA. Dos tablas: `jugadores_saldo_moba` (saldo de creditos de cada jugador) y `inscripciones_torneo_moba` (inscripciones pagadas a un torneo).

## Decisiones tecnicas

El objetivo del ejercicio es transacciones, por eso el caso de uso central es una compra de inscripcion: **restar el saldo del jugador** y **registrar la inscripcion** deben ocurrir como una sola unidad atomica (todo o nada). `dml/inserts.sql` incluye dos transacciones completas para demostrar ambos desenlaces:

1. **`COMMIT` (compra exitosa)**: `FerNova` (saldo 500) compra su inscripcion a "Copa Verano MOBA" (costo 100). Se resta el saldo y se inserta la inscripcion dentro de un `START TRANSACTION ... COMMIT`. Al confirmar, ambos cambios quedan permanentes.
2. **`ROLLBACK` (compra cancelada)**: `ValStorm` (saldo 600, de sobra) inicia la misma compra, pero el proceso se cancela antes de confirmar. El `ROLLBACK` deshace **ambas** operaciones (la resta de saldo y el registro de inscripcion) como si nunca hubieran ocurrido.

Las consultas 1, 2 y 3 de `dql/consultas.sql` verifican explicitamente el resultado de ambas transacciones: el saldo de `FerNova` queda en 400.00, el de `ValStorm` sigue en 600.00, y `ValStorm` no tiene ninguna inscripcion a "Copa Verano MOBA" (0 filas). El total de creditos en circulacion tambien confirma la aritmetica (1595.00 = 1695.00 iniciales - 100.00 de la unica compra confirmada).

- `jugadores_saldo_moba.saldo_creditos` tiene `CONSTRAINT chk_saldo_no_negativo_moba CHECK (saldo_creditos >= 0)`: protege contra saldos negativos incluso si una futura transaccion olvidara verificar el saldo antes de descontar.
- `inscripciones_torneo_moba.jugador_id` es `FOREIGN KEY` hacia `jugadores_saldo_moba.id`.

## Archivos

- `ddl/schema.sql` — dos tablas + `FOREIGN KEY` + dos `CHECK`.
- `dml/inserts.sql` — carga inicial de 6 jugadores y 2 inscripciones historicas, mas dos transacciones completas (una con `COMMIT`, otra con `ROLLBACK`).
- `dql/consultas.sql` — 6 consultas que verifican el resultado de las transacciones (saldos, inscripciones confirmadas, prueba de que el rollback no dejo rastro, historial completo, total en circulacion, jugadores con saldo suficiente para otra compra).
- `evidencias/resultados_consultas.txt` — salida real de las 6 consultas ejecutadas contra MySQL en Docker.

## Ejecutar

```bash
docker exec -i campuslands-mysql-db mysql -u campus -pcampus123 campuslands_mysql < ddl/schema.sql
docker exec -i campuslands-mysql-db mysql -u campus -pcampus123 campuslands_mysql < dml/inserts.sql
docker exec -i campuslands-mysql-db mysql -u campus -pcampus123 campuslands_mysql < dql/consultas.sql
```
