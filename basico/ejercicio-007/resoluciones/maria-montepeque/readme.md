# Ejercicio 007 (basico) - maria-montepeque

Tematica: liga de futbol. Tabla `equipos_liga_futbol` con la tabla de posiciones de una liga (partidos, victorias, empates, derrotas, goles y puntos).

## Decisiones tecnicas

- `equipo` es `UNIQUE` porque cada equipo aparece una sola vez en la tabla de posiciones.
- `puntos`, `goles_favor` y `goles_contra` se guardan como columnas independientes (no derivadas) para practicar ordenamientos directos y con expresiones.
- `estado` es `ENUM` para marcar equipos sancionados sin borrar su historial.
- `CONSTRAINT chk_partidos_liga_futbol CHECK (victorias + empates + derrotas <= partidos_jugados)` evita resultados imposibles.
  El nombre del constraint es unico dentro de la base de datos para no chocar con los `CHECK` de otros ejercicios.
- Las consultas cubren distintas formas de `ORDER BY` (objetivo del ejercicio): columna simple ASC/DESC, multiples columnas como criterio de desempate, y ordenar por una expresion calculada (diferencia de goles).

## Archivos

- `ddl/schema.sql` — tabla + `UNIQUE` en equipo + `CHECK` de partidos jugados.
- `dml/inserts.sql` — 10 equipos de practica en 4 ciudades.
- `dql/consultas.sql` — 6 consultas (tabla de posiciones con desempate, orden alfabetico, top 3 ataques, peores defensas, victorias/derrotas, ciudad y equipo).
- `evidencias/resultados_consultas.txt` — salida real de las 6 consultas ejecutadas contra MySQL en Docker.

## Ejecutar

```bash
docker exec -i campuslands-mysql-db mysql -u campus -pcampus123 campuslands_mysql < ddl/schema.sql
docker exec -i campuslands-mysql-db mysql -u campus -pcampus123 campuslands_mysql < dml/inserts.sql
docker exec -i campuslands-mysql-db mysql -u campus -pcampus123 campuslands_mysql < dql/consultas.sql
```
