# Ejercicio 008 (basico) - maria-montepeque

Tematica: futbol sala. Tabla `jugadores_futbol_sala` que arranca con estadisticas en cero y se actualiza con eventos de una jornada (goles, tarjetas, lesiones y recuperaciones).

## Decisiones tecnicas

- `nombre` es `UNIQUE` porque identifica al jugador dentro del torneo.
- `estado` es `ENUM` para reflejar disponibilidad (activo, lesionado, suspendido).
- `CONSTRAINT chk_goles_futbol_sala CHECK (goles >= 0)` evita datos imposibles.
  El nombre del constraint es unico dentro de la base de datos para no chocar con los `CHECK` de otros ejercicios.
- El objetivo del ejercicio es `UPDATE`, por eso `dml/inserts.sql` primero inserta a los 10 jugadores en su estado inicial y luego aplica 6 sentencias `UPDATE` que simulan lo ocurrido en el partido:
  1. Gol doble de un jugador.
  2. Gol + tarjeta amarilla de otro jugador.
  3. Doble amarilla que se convierte en roja y deja al jugador suspendido.
  4. Lesion de un jugador durante el partido.
  5. Regla general por `WHERE tarjetas_rojas >= 1` para suspender a cualquier expulsado.
  6. Recuperacion de la lesion antes de la siguiente jornada.

## Archivos

- `ddl/schema.sql` — tabla + `UNIQUE` en nombre + `CHECK` de goles.
- `dml/inserts.sql` — 10 jugadores en 2 equipos, con estado inicial en cero y 6 `UPDATE` de eventos de la jornada.
- `dql/consultas.sql` — 6 consultas (estado final de todos, goleadores, suspendidos, disponibles para la proxima jornada, totales por equipo, conteo por estado).
- `evidencias/resultados_consultas.txt` — salida real de las 6 consultas ejecutadas contra MySQL en Docker, que confirma que los `UPDATE` se aplicaron correctamente.

## Ejecutar

```bash
docker exec -i campuslands-mysql-db mysql -u campus -pcampus123 campuslands_mysql < ddl/schema.sql
docker exec -i campuslands-mysql-db mysql -u campus -pcampus123 campuslands_mysql < dml/inserts.sql
docker exec -i campuslands-mysql-db mysql -u campus -pcampus123 campuslands_mysql < dql/consultas.sql
```
