# Ejercicio 001 (basico) - maria-montepeque

Tematica: torneo esports MOBA. Tabla `jugadores_torneo_moba` con estadisticas de jugadores (partidas, victorias, MVPs, KDA, rol y estado).

## Archivos

- `ddl/schema.sql` — tabla + `UNIQUE` en gamer_tag + `CHECK` victorias <= partidas.
- `dml/inserts.sql` — 10 jugadores de practica.
- `dql/consultas.sql` — 6 consultas (ranking KDA, top MVP, promedio por rol, %victorias, equipo lider, conteo por estado).

## Ejecutar

```bash
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < ddl/schema.sql
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < dml/inserts.sql
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < dql/consultas.sql
```
