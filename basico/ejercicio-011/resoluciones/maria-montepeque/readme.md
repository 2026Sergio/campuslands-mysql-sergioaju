# Ejercicio 011 (basico) - maria-montepeque

Tematica: pingpong. Tabla `jugadores_pingpong` con el registro de jugadores de un club (ranking, categoria, mano dominante y estadisticas).

## Decisiones tecnicas

El objetivo del ejercicio es practicar validaciones simples, por eso la tabla combina varios tipos de validacion de MySQL:

- `nombre VARCHAR(80) NOT NULL UNIQUE` — validacion de presencia y unicidad.
- `categoria` y `mano_dominante` como `ENUM` — validacion de valores permitidos.
- `mano_dominante` y `estado` con `DEFAULT` — validacion de valor por omision cuando no se especifica.
- `CONSTRAINT chk_ranking_pingpong CHECK (ranking_puntos >= 0)` — evita puntajes negativos.
- `CONSTRAINT chk_ganados_pingpong CHECK (partidos_ganados <= partidos_jugados)` — evita mas victorias que partidos jugados.
  Ambos nombres de `CHECK` son unicos dentro de la base de datos para no chocar con los `CHECK` de otros ejercicios.

## Archivos

- `ddl/schema.sql` — tabla con `NOT NULL`, `UNIQUE`, `ENUM`, `DEFAULT` y dos `CHECK`.
- `dml/inserts.sql` — 10 jugadores de practica en 3 clubes y 4 categorias.
- `dql/consultas.sql` — 6 consultas (top 5 ranking, invictos, conteo por categoria, ranking promedio por mano dominante, inactivos, % de victorias).
- `evidencias/resultados_consultas.txt` — salida real de las 6 consultas ejecutadas contra MySQL en Docker.

## Ejecutar

```bash
docker exec -i campuslands-mysql-db mysql -u campus -pcampus123 campuslands_mysql < ddl/schema.sql
docker exec -i campuslands-mysql-db mysql -u campus -pcampus123 campuslands_mysql < dml/inserts.sql
docker exec -i campuslands-mysql-db mysql -u campus -pcampus123 campuslands_mysql < dql/consultas.sql
```
