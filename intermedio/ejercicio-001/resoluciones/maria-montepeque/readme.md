# Ejercicio 001 (intermedio) - maria-montepeque

Tematica: torneo esports MOBA. Dos tablas relacionadas: `escuadras_torneo_moba` (equipos) y `jugadores_escuadra_moba` (jugadores, cada uno asociado a una escuadra).

## Decisiones tecnicas

El objetivo del ejercicio es `INNER JOIN`, por eso el modelo separa equipos y jugadores en dos tablas en vez de repetir el nombre del equipo en cada jugador (como en el ejercicio basico equivalente):

- `jugadores_escuadra_moba.escuadra_id` es `FOREIGN KEY` hacia `escuadras_torneo_moba.id`.
- El `DROP TABLE` respeta el orden inverso a las dependencias (primero `jugadores_escuadra_moba`, luego `escuadras_torneo_moba`).
- Los `INSERT` de jugadores usan una subconsulta (`SELECT id FROM escuadras_torneo_moba WHERE nombre = ...`) en vez de IDs escritos a mano.
- `nombre` (escuadra) y `gamer_tag` (jugador) son `UNIQUE` en sus respectivas tablas.
- `CONSTRAINT chk_victorias_escuadra_moba CHECK (victorias <= partidas_jugadas)` y `CONSTRAINT chk_kda_escuadra_moba CHECK (kda >= 0)` evitan datos imposibles.
  Ambos nombres de `CHECK` son unicos dentro de la base de datos para no chocar con los `CHECK` de otros ejercicios.
- Todas las consultas usan `INNER JOIN` explicito (no `WHERE` implicito) para dejar clara la relacion entre ambas tablas.

## Archivos

- `ddl/schema.sql` — dos tablas + `FOREIGN KEY` + dos `CHECK`.
- `dml/inserts.sql` — 5 escuadras y 10 jugadores (2 por escuadra).
- `dql/consultas.sql` — 6 consultas con `INNER JOIN` (jugadores con su escuadra, jugadores de rol medio, KDA promedio por escuadra, top 5 victorias, activos por escuadra, jugadores de escuadras fundadas antes de 2021).
- `evidencias/resultados_consultas.txt` — salida real de las 6 consultas ejecutadas contra MySQL en Docker.

## Ejecutar

```bash
docker exec -i campuslands-mysql-db mysql -u campus -pcampus123 campuslands_mysql < ddl/schema.sql
docker exec -i campuslands-mysql-db mysql -u campus -pcampus123 campuslands_mysql < dml/inserts.sql
docker exec -i campuslands-mysql-db mysql -u campus -pcampus123 campuslands_mysql < dql/consultas.sql
```
