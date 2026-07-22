# Ejercicio 002 (basico) - maria-montepeque

Tematica: ranking battle royale. Tabla `jugadores_ranking_battle_royale` con estadisticas de jugadores (partidas, victorias, eliminaciones, puntaje de temporada, plataforma y estado).

## Decisiones tecnicas

- `nickname` es `UNIQUE` porque identifica al jugador de forma natural.
- `plataforma` y `estado` son `ENUM` para limitar valores validos y evitar texto libre inconsistente.
- `puntaje_temporada` es `DECIMAL(8,2)` para precision exacta en el ranking.
- `fecha_ultima_partida` es `DATE` porque solo importa el dia, no la hora.
- `CONSTRAINT chk_victorias_ranking_br CHECK (victorias <= partidas_jugadas)` evita datos imposibles.
  Nota: el nombre del constraint tuvo que ser distinto al usado en el ejercicio-001 (`chk_victorias`)
  porque en MySQL los nombres de `CHECK` deben ser unicos por base de datos, no por tabla.

## Archivos

- `ddl/schema.sql` — tabla + `UNIQUE` en nickname + `CHECK` victorias <= partidas_jugadas.
- `dml/inserts.sql` — 10 jugadores de practica en 3 plataformas y 3 estados distintos.
- `dql/consultas.sql` — 6 consultas (ranking por puntaje, %victorias, eliminaciones promedio por plataforma, top fragger, conteo por estado, activos con mas de 80 partidas).
- `evidencias/resultados_consultas.txt` — salida real de las 6 consultas ejecutadas contra MySQL en Docker.

## Ejecutar

```bash
docker exec -i campuslands-mysql-db mysql -u campus -pcampus123 campuslands_mysql < ddl/schema.sql
docker exec -i campuslands-mysql-db mysql -u campus -pcampus123 campuslands_mysql < dml/inserts.sql
docker exec -i campuslands-mysql-db mysql -u campus -pcampus123 campuslands_mysql < dql/consultas.sql
```
