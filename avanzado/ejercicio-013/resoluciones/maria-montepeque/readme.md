# Ejercicio 013 (avanzado) - maria-montepeque

Tematica: catalogo de peliculas de miedo. Tabla `peliculas_miedo_json` con una columna `JSON` (`detalles`) que guarda datos semi-estructurados: director, subgeneros, reparto y premios de cada pelicula.

## Decisiones tecnicas

- `detalles` guarda en un solo documento JSON informacion que varia de pelicula a pelicula (listas de distinto tamano: subgeneros, reparto, premios). Forzar esto a columnas fijas o a tablas separadas hubiera sido mas normalizado, pero el objetivo del ejercicio es justamente aprovechar la flexibilidad de JSON para este tipo de dato.
- `duracion_minutos` es una **columna generada** (`GENERATED ALWAYS AS (detalles ->> '$.duracion_minutos') STORED`) que extrae un valor del JSON y lo materializa como columna normal, indexable con un `CREATE INDEX` comun.
- `idx_subgeneros_peliculas_json` es un **indice multivaluado** (`CAST(... AS CHAR(30) ARRAY)`, disponible desde MySQL 8.0.17): indexa cada elemento del array `subgeneros` por separado, para que buscar con `MEMBER OF` no tenga que recorrer todas las filas.
- `CONSTRAINT chk_calificacion_peliculas_json CHECK (calificacion BETWEEN 0 AND 10)` evita datos imposibles (esta si es una columna normal, no JSON).

### Las 6 tecnicas de JSON practicadas

1. **`->>`** — extraer un valor del JSON como texto plano, para reportes.
2. **`MEMBER OF`** — buscar peliculas cuyo array `subgeneros` contiene un valor especifico, aprovechando el indice multivaluado.
3. **`JSON_TABLE` (array simple)** — convierte el array `reparto` de cada pelicula en filas (una fila por actor), algo imposible de hacer solo con `->>`.
4. **Agregacion sobre `JSON_TABLE`** — usando el mismo `JSON_TABLE` de reparto, se calcula el actor con mas apariciones.
5. **`JSON_ARRAY_APPEND` (actualizacion en el lugar)** — `Amanecer Muerto` no tenia premios (`[]`); se le agrega uno sin reescribir todo el documento, y se verifica el resultado.
6. **`JSON_TABLE` con `NESTED PATH` / `COLUMNS` sobre un array de objetos** — expande el array `premios` (cada elemento es un objeto `{nombre, anio}`) en filas con una columna por cada campo del objeto.

## Archivos

- `ddl/schema.sql` — tabla + columna `JSON` + columna generada indexada + indice multivaluado + `CHECK`.
- `dml/inserts.sql` — 5 peliculas con `detalles` construido con `JSON_OBJECT`/`JSON_ARRAY`.
- `dql/consultas.sql` — 6 consultas/operaciones con JSON (extraccion, MEMBER OF, dos usos de JSON_TABLE, actualizacion en el lugar).
- `evidencias/resultados_consultas.txt` — salida real de las 6 consultas ejecutadas contra MySQL en Docker.

## Ejecutar

```bash
docker exec -i campuslands-mysql-db mysql -u campus -pcampus123 campuslands_mysql < ddl/schema.sql
docker exec -i campuslands-mysql-db mysql -u campus -pcampus123 campuslands_mysql < dml/inserts.sql
docker exec -i campuslands-mysql-db mysql -u campus -pcampus123 campuslands_mysql < dql/consultas.sql
```
