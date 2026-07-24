# Ejercicio 002 (intermedio) - maria-montepeque

Tematica: ranking battle royale. Dos tablas relacionadas: `escuadras_battle_royale` (equipos) y `partidas_battle_royale` (partidas disputadas, cada una asociada a una escuadra).

## Decisiones tecnicas

El objetivo del ejercicio es `LEFT JOIN`, por eso los datos se disenaron a proposito para que **2 de las 6 escuadras no tengan ninguna partida registrada** (`Vortice Digital` y `Eclipse Squad`, creadas recientemente). Esto permite comprobar que un `LEFT JOIN` conserva esas escuadras con valores `NULL` en vez de excluirlas, a diferencia de un `INNER JOIN`.

- `partidas_battle_royale.escuadra_id` es `FOREIGN KEY` hacia `escuadras_battle_royale.id`.
- El `DROP TABLE` respeta el orden inverso a las dependencias.
- Los `INSERT` de partidas usan una subconsulta (`SELECT id FROM escuadras_battle_royale WHERE nombre = ...`) en vez de IDs escritos a mano.
- `nombre` (escuadra) es `UNIQUE`.
- `CONSTRAINT chk_posicion_partidas_br CHECK (posicion_final > 0)` y `CONSTRAINT chk_eliminaciones_partidas_br CHECK (eliminaciones >= 0)` evitan datos imposibles.
  Ambos nombres de `CHECK` son unicos dentro de la base de datos para no chocar con los `CHECK` de otros ejercicios.
- Las consultas de agregacion usan `COUNT(p.id)` (no `COUNT(*)`) y `COALESCE(SUM(...), 0)` para que las escuadras sin partidas muestren `0` en vez de perderse del resultado.

## Archivos

- `ddl/schema.sql` — dos tablas + `FOREIGN KEY` + dos `CHECK`.
- `dml/inserts.sql` — 6 escuadras (2 sin partidas a proposito) y 10 partidas.
- `dql/consultas.sql` — 6 consultas con `LEFT JOIN` (todas las escuadras con sus partidas, escuadras sin partidas, conteo de partidas, puntos totales, mejor posicion, ultima partida).
- `evidencias/resultados_consultas.txt` — salida real de las 6 consultas ejecutadas contra MySQL en Docker, que confirma el comportamiento del LEFT JOIN con las escuadras sin partidas.

## Ejecutar

```bash
docker exec -i campuslands-mysql-db mysql -u campus -pcampus123 campuslands_mysql < ddl/schema.sql
docker exec -i campuslands-mysql-db mysql -u campus -pcampus123 campuslands_mysql < dml/inserts.sql
docker exec -i campuslands-mysql-db mysql -u campus -pcampus123 campuslands_mysql < dql/consultas.sql
```
