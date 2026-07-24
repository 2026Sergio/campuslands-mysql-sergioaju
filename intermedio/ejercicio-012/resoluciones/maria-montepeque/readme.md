# Ejercicio 012 (intermedio) - maria-montepeque

Tematica: playlist musical. Dos tablas: `artistas_playlist_reportes` y `canciones_playlist_reportes`, pensadas para generar reportes tipo dashboard (rankings, clasificaciones y resumenes).

## Decisiones tecnicas

El objetivo del ejercicio es "consultas de reportes", por eso las 6 consultas no son filtros simples: combinan `JOIN`, `GROUP BY`, subconsultas escalares y `CASE` para producir salidas con forma de reporte de negocio (porcentajes, clasificaciones, resumenes de una sola fila).

- `canciones_playlist_reportes.artista_id` es `FOREIGN KEY` hacia `artistas_playlist_reportes.id`.
- `CONSTRAINT uq_titulo_artista_reportes UNIQUE (titulo, artista_id)` evita cargar la misma cancion dos veces para el mismo artista.
- `CONSTRAINT chk_duracion_playlist_reportes CHECK (duracion_segundos > 0)` y `CONSTRAINT chk_reproducciones_playlist_reportes CHECK (reproducciones >= 0)` evitan datos imposibles.
- La consulta 1 usa una subconsulta escalar para calcular el porcentaje que cada cancion representa sobre el total de reproducciones.
- La consulta 2 usa `CASE` para clasificar artistas en "Popular", "En crecimiento" o "Emergente" segun sus reproducciones totales.
- La consulta 5 es un reporte resumen de una sola fila con los indicadores clave de toda la playlist (KPIs).

## Archivos

- `ddl/schema.sql` — dos tablas + `FOREIGN KEY` + `UNIQUE` compuesto + dos `CHECK`.
- `dml/inserts.sql` — 6 artistas y 13 canciones.
- `dql/consultas.sql` — 6 reportes (top 5 con % del total, clasificacion de artistas con CASE, duracion por genero, canciones por ano, resumen general, artista con mas canciones).
- `evidencias/resultados_consultas.txt` — salida real de los 6 reportes ejecutados contra MySQL en Docker.

## Ejecutar

```bash
docker exec -i campuslands-mysql-db mysql -u campus -pcampus123 campuslands_mysql < ddl/schema.sql
docker exec -i campuslands-mysql-db mysql -u campus -pcampus123 campuslands_mysql < dml/inserts.sql
docker exec -i campuslands-mysql-db mysql -u campus -pcampus123 campuslands_mysql < dql/consultas.sql
```
