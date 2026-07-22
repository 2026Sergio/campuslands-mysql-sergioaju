# Ejercicio 012 (basico) - maria-montepeque

Tematica: playlist musical. Tabla `canciones_playlist_musical` con las canciones de una playlist (artista, album, genero, duracion y estadisticas de reproduccion).

## Decisiones tecnicas

El objetivo del ejercicio es el modelado de entidad, por eso se penso primero en los atributos reales de una cancion antes de escribir el `CREATE TABLE`:

- No existe una clave natural de una sola columna (el titulo se repite entre artistas), por eso se modelo `CONSTRAINT uq_titulo_artista_playlist UNIQUE (titulo, artista)` como clave compuesta de negocio.
- `genero` es `ENUM` para limitar los valores a categorias musicales reales.
- `favorita` es `BOOLEAN` para marcar preferencias del usuario de la playlist.
- `anio_lanzamiento` usa `YEAR` porque solo interesa el ano de lanzamiento.
- `CONSTRAINT chk_duracion_playlist CHECK (duracion_segundos > 0)` y `CONSTRAINT chk_reproducciones_playlist CHECK (reproducciones >= 0)` evitan datos imposibles.
  Ambos nombres de `CHECK` son unicos dentro de la base de datos para no chocar con los `CHECK` de otros ejercicios.

## Archivos

- `ddl/schema.sql` — tabla + `UNIQUE` compuesto (titulo, artista) + dos `CHECK`.
- `dml/inserts.sql` — 10 canciones de practica, 5 artistas y 5 generos.
- `dql/consultas.sql` — 6 consultas (top 5 mas reproducidas, favoritas, duracion promedio por genero, reproducciones por artista, canciones activas, lanzadas desde 2022).
- `evidencias/resultados_consultas.txt` — salida real de las 6 consultas ejecutadas contra MySQL en Docker.

## Ejecutar

```bash
docker exec -i campuslands-mysql-db mysql -u campus -pcampus123 campuslands_mysql < ddl/schema.sql
docker exec -i campuslands-mysql-db mysql -u campus -pcampus123 campuslands_mysql < dml/inserts.sql
docker exec -i campuslands-mysql-db mysql -u campus -pcampus123 campuslands_mysql < dql/consultas.sql
```
