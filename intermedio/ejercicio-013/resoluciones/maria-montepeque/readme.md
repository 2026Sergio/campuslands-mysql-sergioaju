# Ejercicio 013 (intermedio) - maria-montepeque

Tematica: catalogo de peliculas de miedo. Tres tablas: `peliculas_miedo_puente`, `actores_miedo` y `reparto_pelicula_miedo` (la tabla puente que conecta a ambas).

## Decisiones tecnicas

El objetivo del ejercicio es tablas puente: una pelicula tiene varios actores y un actor puede aparecer en varias peliculas, una relacion **muchos a muchos** que no se puede modelar con una sola `FOREIGN KEY` en ninguna de las dos tablas principales. Por eso se agrega una tercera tabla, `reparto_pelicula_miedo`, con dos `FOREIGN KEY` (una hacia cada lado de la relacion) y un dato propio de la relacion (`personaje`) que no pertenece ni a la pelicula ni al actor por separado.

- `CONSTRAINT uq_pelicula_actor UNIQUE (pelicula_id, actor_id)` evita registrar dos veces al mismo actor en la misma pelicula.
- `CONSTRAINT chk_duracion_peliculas_puente CHECK (duracion_minutos > 0)` y `CONSTRAINT chk_calificacion_peliculas_puente CHECK (calificacion BETWEEN 0 AND 10)` evitan datos imposibles.
- La consulta 5 hace un **self-join** sobre la propia tabla puente para encontrar pares de peliculas que comparten al menos un actor, una consulta clasica que solo es posible gracias al diseno con tabla puente.

## Archivos

- `ddl/schema.sql` — tres tablas (dos entidades + una tabla puente) + dos `FOREIGN KEY` + `UNIQUE` compuesto + dos `CHECK`.
- `dml/inserts.sql` — 5 peliculas, 7 actores y 14 filas de reparto (algunos actores en varias peliculas).
- `dql/consultas.sql` — 6 consultas (reparto de una pelicula, peliculas de un actor, actores en mas de una pelicula, actores por pelicula, peliculas que comparten actor, actor con mas apariciones).
- `evidencias/resultados_consultas.txt` — salida real de las 6 consultas ejecutadas contra MySQL en Docker.

## Ejecutar

```bash
docker exec -i campuslands-mysql-db mysql -u campus -pcampus123 campuslands_mysql < ddl/schema.sql
docker exec -i campuslands-mysql-db mysql -u campus -pcampus123 campuslands_mysql < dml/inserts.sql
docker exec -i campuslands-mysql-db mysql -u campus -pcampus123 campuslands_mysql < dql/consultas.sql
```
