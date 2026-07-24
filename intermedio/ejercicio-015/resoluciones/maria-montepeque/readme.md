# Ejercicio 015 (intermedio) - maria-montepeque

Tematica: biblioteca gamer. Tres tablas: `desarrolladoras_biblioteca_gamer_carga`, `juegos_biblioteca_gamer_carga` y `resumen_carga_biblioteca` (esta ultima llenada con una carga derivada).

## Decisiones tecnicas

El objetivo del ejercicio es carga de datos, por eso `dml/inserts.sql` demuestra tres tecnicas distintas, no solo el `INSERT` multivalor basico:

1. **Carga masiva inicial**: `INSERT` de varias filas en un solo statement para desarrolladoras y juegos.
2. **Carga derivada (`INSERT ... SELECT`)**: `resumen_carga_biblioteca` no se llena a mano; se calcula con un `SELECT` agregado (`COUNT`, `SUM`) sobre las dos tablas ya cargadas y ese resultado se inserta directamente.
3. **Recarga idempotente (`INSERT ... ON DUPLICATE KEY UPDATE`)**: se simula que el proceso de carga se ejecuta de nuevo con un dato que ya existe (`Nova Interactive`). En vez de fallar por el `UNIQUE` en `nombre` o duplicar la fila, la actualiza. La consulta 1 verifica explicitamente que sigue habiendo una sola fila para ese desarrollador.

- `juegos_biblioteca_gamer_carga.desarrolladora_id` es `FOREIGN KEY`.
- `CONSTRAINT chk_precio_juegos_biblioteca_carga CHECK (precio >= 0)` y `CONSTRAINT chk_horas_juegos_biblioteca_carga CHECK (horas_jugadas >= 0)` evitan datos imposibles.

## Archivos

- `ddl/schema.sql` — tres tablas + `FOREIGN KEY` + dos `CHECK`.
- `dml/inserts.sql` — carga masiva (5 desarrolladoras, 10 juegos), carga derivada del resumen y recarga idempotente.
- `dql/consultas.sql` — 6 consultas (verificacion de no duplicados, totales cargados, resumen derivado, comparacion resumen vs calculo directo, mayor gasto, juegos con su desarrolladora).
- `evidencias/resultados_consultas.txt` — salida real de las 6 consultas ejecutadas contra MySQL en Docker.

## Ejecutar

```bash
docker exec -i campuslands-mysql-db mysql -u campus -pcampus123 campuslands_mysql < ddl/schema.sql
docker exec -i campuslands-mysql-db mysql -u campus -pcampus123 campuslands_mysql < dml/inserts.sql
docker exec -i campuslands-mysql-db mysql -u campus -pcampus123 campuslands_mysql < dql/consultas.sql
```
