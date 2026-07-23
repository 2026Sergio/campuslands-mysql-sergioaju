# Ejercicio 006 (avanzado) - maria-montepeque

Tematica: autos hiperdeportivos. Tabla `autos_hiperdeportivos_explain` con 2000 registros y 3 indices creados desde el inicio, usada para **interpretar** distintos planes de `EXPLAIN` (no solo comparar con/sin indice, que ya se cubrio en el ejercicio de indices).

## Decisiones tecnicas

- Los 3 indices (`idx_marca_auto_explain`, `idx_precio_auto_explain`, `idx_pais_auto_explain`) se crean en `ddl/schema.sql`, antes de cargar datos. El objetivo de este ejercicio es leer el plan de ejecucion, no demostrar que crear un indice ayuda (eso ya se hizo en el ejercicio anterior).
- Igual que en el ejercicio de indices, se genero volumen real (2000 filas) con un procedimiento temporal, porque con pocas filas todos los planes se ven iguales.
- `CONSTRAINT chk_precio_auto_explain CHECK (precio >= 0)` y `CONSTRAINT chk_potencia_auto_explain CHECK (potencia_hp > 0)` evitan datos imposibles.

### Que muestra cada EXPLAIN (resultado real, ver evidencias)

| # | Consulta | type | key usada | Por que |
| - | -------- | ---- | --------- | ------- |
| 1 | `placa = 'HPC-000500'` | `const` | `placa` (UNIQUE) | Busqueda por clave unica: MySQL sabe que hay como maximo una fila posible. |
| 2 | `precio BETWEEN 300000 AND 800000` | `range` | `idx_precio_auto_explain` | Rango sobre columna indexada, resuelto con un recorrido parcial del indice. |
| 3 | `marca LIKE 'Ferrari%'` | `range` | `idx_marca_auto_explain` | El comodin solo al final es "sargable": MySQL puede usar el indice para saltar directo al prefijo `'Ferrari'`. |
| 4 | `marca LIKE '%rrari%'` | `ALL` | ninguna (`idx_marca_auto_explain` existe pero no se usa) | Con el comodin al **inicio**, MySQL no sabe por donde empieza el valor buscado: no puede usar el indice y recorre la tabla completa. |
| 5 | `UPPER(marca) = 'FERRARI'` | `ALL` | ninguna (`idx_marca_auto_explain` existe pero no se usa) | El indice se creo sobre los valores originales de `marca`, no sobre el resultado de `UPPER(marca)`. Envolver la columna en una funcion inhabilita el indice. |
| 6 | `marca = 'Rimac' OR pais_origen = 'Croacia'` | `index_merge` | `idx_marca_auto_explain` + `idx_pais_auto_explain` (union) | MySQL resuelve el `OR` entre dos columnas indexadas por separado usando ambos indices y uniendo los resultados, en vez de recorrer toda la tabla. |

Las consultas 4 y 5 son el punto central del ejercicio: demuestran que **tener un indice no garantiza que se use** si la consulta esta escrita de una forma que MySQL no puede aprovechar (comodin al inicio, funcion sobre la columna indexada).

## Archivos

- `ddl/schema.sql` — tabla + `CHECK` + 3 `CREATE INDEX`.
- `dml/inserts.sql` — procedimiento temporal para generar 2000 filas, `CALL` y `DROP PROCEDURE`.
- `dql/consultas.sql` — 6 `EXPLAIN`, cada uno ilustrando un tipo de plan distinto (const, range sargable, range no sargable con comodin al inicio, funcion sobre columna indexada, index_merge).
- `evidencias/resultados_consultas.txt` — salida real de los 6 `EXPLAIN` ejecutados contra MySQL en Docker.

## Ejecutar

```bash
docker exec -i campuslands-mysql-db mysql -u campus -pcampus123 campuslands_mysql < ddl/schema.sql
docker exec -i campuslands-mysql-db mysql -u campus -pcampus123 campuslands_mysql < dml/inserts.sql
docker exec -i campuslands-mysql-db mysql -u campus -pcampus123 campuslands_mysql < dql/consultas.sql
```
