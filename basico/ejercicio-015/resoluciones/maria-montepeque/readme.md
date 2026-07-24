# Ejercicio 015 (basico) - maria-montepeque

Tematica: biblioteca gamer. Dos tablas relacionadas: `desarrolladoras_biblioteca_gamer` (estudios) y `juegos_biblioteca_gamer` (juegos de la biblioteca, cada uno asociado a una desarrolladora).

## Decisiones tecnicas

El objetivo del ejercicio es practicar relaciones simples, por eso el modelo usa dos tablas en lugar de una sola:

- `juegos_biblioteca_gamer.desarrolladora_id` es `FOREIGN KEY` hacia `desarrolladoras_biblioteca_gamer.id` (relacion 1 a muchos: una desarrolladora tiene varios juegos).
- El `DROP TABLE` respeta el orden inverso a las dependencias (primero `juegos_biblioteca_gamer`, luego `desarrolladoras_biblioteca_gamer`) para no romper la relacion al recrear el esquema.
- Los `INSERT` de juegos usan una subconsulta (`SELECT id FROM desarrolladoras_biblioteca_gamer WHERE nombre = ...`) en vez de IDs escritos a mano, para que el script sea legible y no dependa de adivinar el autoincremento.
- `titulo` y `nombre` son `UNIQUE` en sus respectivas tablas.
- `CONSTRAINT chk_precio_juegos_biblioteca CHECK (precio >= 0)` y `CONSTRAINT chk_horas_juegos_biblioteca CHECK (horas_jugadas >= 0)` evitan datos imposibles.
  Ambos nombres de `CHECK` son unicos dentro de la base de datos para no chocar con los `CHECK` de otros ejercicios.

## Archivos

- `ddl/schema.sql` — dos tablas + `FOREIGN KEY` + dos `CHECK`.
- `dml/inserts.sql` — 5 desarrolladoras y 10 juegos (2 por desarrolladora).
- `dql/consultas.sql` — 6 consultas con `JOIN` (juegos con su desarrolladora, cantidad de juegos por desarrolladora, horas totales por desarrolladora, juegos completados, top 3 mas caros, generos distintos por estudio).
- `evidencias/resultados_consultas.txt` — salida real de las 6 consultas ejecutadas contra MySQL en Docker.

## Ejecutar

```bash
docker exec -i campuslands-mysql-db mysql -u campus -pcampus123 campuslands_mysql < ddl/schema.sql
docker exec -i campuslands-mysql-db mysql -u campus -pcampus123 campuslands_mysql < dml/inserts.sql
docker exec -i campuslands-mysql-db mysql -u campus -pcampus123 campuslands_mysql < dql/consultas.sql
```
