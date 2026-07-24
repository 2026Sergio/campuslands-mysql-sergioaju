# Ejercicio 006 (intermedio) - maria-montepeque

Tematica: autos hiperdeportivos. Dos tablas: `modelos_hiperdeportivos` (catalogo de modelos) y `colores_disponibles_modelo` (un color por fila, por modelo).

## Decisiones tecnicas

El objetivo del ejercicio es normalizacion 1FN, por eso `ddl/schema.sql` documenta en un comentario el diseno que **no** se debia usar: una columna tipo `colores_disponibles VARCHAR(200)` con una lista separada por comas (`'Rojo, Negro, Blanco'`). Ese diseno viola la Primera Forma Normal porque una sola celda guarda varios valores, lo que hace impreciso o imposible filtrar, contar o unir por color de forma confiable con SQL estandar.

La solucion en 1FN separa esa informacion en una segunda tabla, donde **cada color es una fila atomica**:

- `colores_disponibles_modelo.modelo_id` es `FOREIGN KEY` hacia `modelos_hiperdeportivos.id`.
- `CONSTRAINT uq_modelo_color UNIQUE (modelo_id, color)` evita registrar el mismo color dos veces para el mismo modelo.
- `CONSTRAINT uq_marca_modelo_anio UNIQUE (marca, modelo, anio)` evita modelos duplicados.
- `CONSTRAINT chk_potencia_modelos_hiper CHECK (potencia_hp > 0)` evita datos imposibles.
- Las consultas 2 y 5 muestran justamente lo que la 1FN habilita: filtrar por un color exacto (`WHERE c.color = 'Negro'`) con total precision, algo fragil de lograr con `LIKE '%Negro%'` sobre una lista en texto.

## Archivos

- `ddl/schema.sql` — dos tablas + `FOREIGN KEY` + `UNIQUE` compuestos + `CHECK` (con el comentario del diseno no normalizado que se evito).
- `dml/inserts.sql` — 6 modelos y 17 combinaciones modelo-color.
- `dql/consultas.sql` — 6 consultas (todos los colores por modelo, modelos disponibles en negro, cantidad de colores por modelo, modelos con mas de 3 colores, modelo mas caro en blanco, colores mas ofrecidos).
- `evidencias/resultados_consultas.txt` — salida real de las 6 consultas ejecutadas contra MySQL en Docker.

## Ejecutar

```bash
docker exec -i campuslands-mysql-db mysql -u campus -pcampus123 campuslands_mysql < ddl/schema.sql
docker exec -i campuslands-mysql-db mysql -u campus -pcampus123 campuslands_mysql < dml/inserts.sql
docker exec -i campuslands-mysql-db mysql -u campus -pcampus123 campuslands_mysql < dql/consultas.sql
```
