# Ejercicio 002 (avanzado) - maria-montepeque

Tematica: ranking battle royale. Dos tablas (`escuadras_battle_royale_sp`, `partidas_battle_royale_sp`) y tres procedimientos almacenados que encapsulan la carga y los reportes.

## Decisiones tecnicas

El objetivo del ejercicio es procedimientos almacenados, por eso se crearon 3 con proposito distinto:

1. **`sp_registrar_partida_br`** — recibe el nombre de la escuadra (no su id) y resuelve el `escuadra_id` internamente antes de insertar. `dml/inserts.sql` carga las 10 partidas llamando a este procedimiento 10 veces, en vez de usar `INSERT` directo.
2. **`sp_resumen_escuadra_br`** — devuelve un resumen (total de partidas, puntos totales, mejor posicion) para una escuadra. Usa `LEFT JOIN` + `COALESCE` para que tambien funcione correctamente con escuadras sin ninguna partida jugada (se probo explicitamente con `Vortice Digital`).
3. **`sp_top_escuadras_br`** — recibe la cantidad de escuadras a mostrar como parametro y usa SQL dinamico (`PREPARE` / `EXECUTE ... USING`) porque `LIMIT` necesita resolverse en tiempo de ejecucion del statement preparado; no admite un parametro de procedimiento directamente en todas las versiones de forma simple, asi que se arma como un statement preparado con `LIMIT ?`.

- `partidas_battle_royale_sp.escuadra_id` es `FOREIGN KEY` hacia `escuadras_battle_royale_sp.id`.
- `CONSTRAINT chk_posicion_partidas_sp CHECK (posicion_final > 0)` y `CONSTRAINT chk_eliminaciones_partidas_sp CHECK (eliminaciones >= 0)` evitan datos imposibles.

## Archivos

- `ddl/schema.sql` — dos tablas + `FOREIGN KEY` + dos `CHECK` + tres `CREATE PROCEDURE`.
- `dml/inserts.sql` — 6 escuadras (2 sin partidas a proposito) cargadas con `INSERT`, y 10 partidas cargadas con `CALL sp_registrar_partida_br(...)`.
- `dql/consultas.sql` — 6 consultas: `CALL` a `sp_resumen_escuadra_br` con y sin partidas, `CALL` a `sp_top_escuadras_br` con distintos limites, mas dos `SELECT` directos de verificacion.
- `evidencias/resultados_consultas.txt` — salida real de las 6 consultas ejecutadas contra MySQL en Docker.

## Ejecutar

```bash
docker exec -i campuslands-mysql-db mysql -u campus -pcampus123 campuslands_mysql < ddl/schema.sql
docker exec -i campuslands-mysql-db mysql -u campus -pcampus123 campuslands_mysql < dml/inserts.sql
docker exec -i campuslands-mysql-db mysql -u campus -pcampus123 campuslands_mysql < dql/consultas.sql
```
