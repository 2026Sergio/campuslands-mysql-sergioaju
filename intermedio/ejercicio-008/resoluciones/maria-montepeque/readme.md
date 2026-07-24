# Ejercicio 008 (intermedio) - maria-montepeque

Tematica: futbol sala. Dos tablas: `equipos_futbol_sala` (equipos) y `jugadores_futbol_sala` (jugadores, cada uno asociado a un equipo).

## Decisiones tecnicas

El objetivo del ejercicio es normalizacion 3FN, por eso `ddl/schema.sql` documenta en un comentario el diseno que **no** se debia usar: una sola tabla `jugadores_futbol_sala` con columnas `equipo_nombre` y `equipo_ciudad` ademas de `equipo_id`. Esas dos columnas no dependen de la clave primaria del jugador (`id`), sino de otro atributo no clave (`equipo_id`): es una **dependencia transitiva** (`id -> equipo_id -> equipo_nombre/equipo_ciudad`) que viola la 3FN. Si un equipo cambiara de ciudad, habria que actualizar esa ciudad en cada fila de cada uno de sus jugadores, con riesgo de dejar datos inconsistentes.

La solucion en 3FN separa los datos del equipo en su propia tabla:

- `jugadores_futbol_sala.equipo_id` es `FOREIGN KEY` hacia `equipos_futbol_sala.id`; el jugador solo guarda la referencia, no los datos del equipo.
- `CONSTRAINT chk_goles_futbol_sala_3fn CHECK (goles >= 0)` evita datos imposibles.
- La consulta 2 demuestra en la practica el beneficio de la 3FN: al agrupar por equipo, `ciudades_distintas_en_el_equipo` siempre da `1`, porque la ciudad vive una sola vez en `equipos_futbol_sala` y no puede quedar inconsistente entre jugadores del mismo equipo.

## Archivos

- `ddl/schema.sql` — dos tablas + `FOREIGN KEY` + `CHECK` (con el comentario del diseno no normalizado que se evito).
- `dml/inserts.sql` — 4 equipos y 10 jugadores.
- `dql/consultas.sql` — 6 consultas (jugadores con equipo y ciudad, verificacion de consistencia de ciudad por equipo, goles totales por equipo, equipos con mas de 2 activos, maximo goleador por equipo, jugadores suspendidos).
- `evidencias/resultados_consultas.txt` — salida real de las 6 consultas ejecutadas contra MySQL en Docker.

## Ejecutar

```bash
docker exec -i campuslands-mysql-db mysql -u campus -pcampus123 campuslands_mysql < ddl/schema.sql
docker exec -i campuslands-mysql-db mysql -u campus -pcampus123 campuslands_mysql < dml/inserts.sql
docker exec -i campuslands-mysql-db mysql -u campus -pcampus123 campuslands_mysql < dql/consultas.sql
```
