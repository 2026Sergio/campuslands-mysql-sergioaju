# Ejercicio 007 (intermedio) - maria-montepeque

Tematica: liga de futbol. Tres tablas: `jugadores_liga_futbol`, `partidos_liga_futbol` y `goles_partido_liga` (tabla de hechos que registra cada gol).

## Decisiones tecnicas

El objetivo del ejercicio es normalizacion 2FN, por eso `ddl/schema.sql` documenta en un comentario el diseno que **no** se debia usar: una sola tabla `registros_goles_liga` con clave primaria compuesta `(partido_id, jugador_id, minuto)`, donde `jugador_nombre`/`jugador_equipo` dependen solo de `jugador_id` y `partido_fecha`/`partido_estadio` dependen solo de `partido_id`. Eso es una **dependencia parcial** sobre una parte de la clave compuesta: viola la 2FN y obliga a repetir el nombre del jugador y los datos del partido en cada gol registrado.

La solucion en 2FN separa las entidades con identidad propia (jugador, partido) de la tabla de hechos (gol):

- `jugadores_liga_futbol` guarda los atributos que dependen unicamente del jugador.
- `partidos_liga_futbol` guarda los atributos que dependen unicamente del partido.
- `goles_partido_liga` usa una clave primaria surrogada (`id`) en vez de una compuesta, y sus dos `FOREIGN KEY` (`partido_id`, `jugador_id`) mas `minuto`/`tipo_gol` dependen del gol completo, no de una parte de una clave compuesta.
- `CONSTRAINT chk_minuto_goles_liga CHECK (minuto BETWEEN 1 AND 120)` evita minutos invalidos.

## Archivos

- `ddl/schema.sql` — tres tablas + dos `FOREIGN KEY` + `CHECK` (con el comentario del diseno no normalizado que se evito).
- `dml/inserts.sql` — 6 jugadores, 4 partidos y 12 goles.
- `dql/consultas.sql` — 6 consultas (goles con jugador y partido, ranking de goleadores, partidos con mas de 2 goles, goles despues del minuto 80, jugadores que anotaron en mas de un partido, goles por tipo).
- `evidencias/resultados_consultas.txt` — salida real de las 6 consultas ejecutadas contra MySQL en Docker.

## Ejecutar

```bash
docker exec -i campuslands-mysql-db mysql -u campus -pcampus123 campuslands_mysql < ddl/schema.sql
docker exec -i campuslands-mysql-db mysql -u campus -pcampus123 campuslands_mysql < dml/inserts.sql
docker exec -i campuslands-mysql-db mysql -u campus -pcampus123 campuslands_mysql < dql/consultas.sql
```
