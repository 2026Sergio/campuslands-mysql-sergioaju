# Ejercicio 014 (basico) - maria-montepeque

Tematica: saga de ciencia ficcion. Tabla `peliculas_saga_ciencia_ficcion` con las entregas de 3 sagas, algunas ya estrenadas, otras en produccion y una cancelada.

## Decisiones tecnicas

- `titulo` es `UNIQUE` porque cada pelicula aparece una sola vez en el catalogo.
- `fecha_estreno` es `DATE` (objetivo del ejercicio: fechas basicas), usada en todas las consultas con funciones como `YEAR()`, `TIMESTAMPDIFF()`, `DATEDIFF()` y comparaciones directas con `CURDATE()`.
- `CONSTRAINT chk_duracion_saga_ciencia_ficcion CHECK (duracion_minutos > 0)` y `CONSTRAINT chk_episodio_saga_ciencia_ficcion CHECK (episodio > 0)` evitan datos imposibles.
  Ambos nombres de `CHECK` son unicos dentro de la base de datos para no chocar con los `CHECK` de otros ejercicios.
- Se incluyen peliculas con `fecha_estreno` futura (estado `en_produccion`) para poder practicar consultas de "proximos estrenos" con `CURDATE()`.

## Archivos

- `ddl/schema.sql` — tabla + `UNIQUE` en titulo + dos `CHECK`.
- `dml/inserts.sql` — 10 peliculas de 3 sagas, con fechas desde 1999 hasta 2027.
- `dql/consultas.sql` — 6 consultas (orden cronologico, conteo por ano con YEAR, antiguedad con TIMESTAMPDIFF, peliculas mas antiguas primero, rango de fechas con BETWEEN, proximos estrenos con DATEDIFF).
- `evidencias/resultados_consultas.txt` — salida real de las 6 consultas ejecutadas contra MySQL en Docker (fecha de referencia: 2026-07-22).

## Ejecutar

```bash
docker exec -i campuslands-mysql-db mysql -u campus -pcampus123 campuslands_mysql < ddl/schema.sql
docker exec -i campuslands-mysql-db mysql -u campus -pcampus123 campuslands_mysql < dml/inserts.sql
docker exec -i campuslands-mysql-db mysql -u campus -pcampus123 campuslands_mysql < dql/consultas.sql
```
