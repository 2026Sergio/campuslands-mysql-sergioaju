# Ejercicio 013 (basico) - maria-montepeque

Tematica: catalogo de peliculas de miedo. Tabla `catalogo_peliculas_miedo` con peliculas en distintos estados de publicacion (disponible, proximamente, retirado, en revision).

## Decisiones tecnicas

- `titulo` es `UNIQUE` porque identifica a la pelicula dentro del catalogo.
- `estado` es `ENUM` con 4 valores que reflejan el ciclo de vida real de una pelicula en el catalogo.
- `calificacion` es `DECIMAL(3,1)` para permitir un decimal (ej. 8.9) sin errores de redondeo.
- `CONSTRAINT chk_duracion_peliculas_miedo CHECK (duracion_minutos > 0)` y `CONSTRAINT chk_calificacion_peliculas_miedo CHECK (calificacion BETWEEN 0 AND 10)` evitan datos imposibles.
  Ambos nombres de `CHECK` son unicos dentro de la base de datos para no chocar con los `CHECK` de otros ejercicios.
- Las consultas practican filtros por estado (objetivo del ejercicio): filtro simple, filtro combinado con `AND`, y filtro con `IN` para varios estados a la vez.

## Archivos

- `ddl/schema.sql` — tabla + `UNIQUE` en titulo + dos `CHECK`.
- `dml/inserts.sql` — 10 peliculas de practica en 4 directores y 4 estados distintos.
- `dql/consultas.sql` — 6 consultas (disponibles por calificacion, proximamente, conteo por estado, disponibles con calificacion > 8, retiradas, en_revision/proximamente con IN).
- `evidencias/resultados_consultas.txt` — salida real de las 6 consultas ejecutadas contra MySQL en Docker.

## Ejecutar

```bash
docker exec -i campuslands-mysql-db mysql -u campus -pcampus123 campuslands_mysql < ddl/schema.sql
docker exec -i campuslands-mysql-db mysql -u campus -pcampus123 campuslands_mysql < dml/inserts.sql
docker exec -i campuslands-mysql-db mysql -u campus -pcampus123 campuslands_mysql < dql/consultas.sql
```
