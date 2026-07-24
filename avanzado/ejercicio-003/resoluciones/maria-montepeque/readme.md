# Ejercicio 003 (avanzado) - maria-montepeque

Tematica: inventario de skins shooter. Tabla `coleccion_skins_shooter_fn` mas 3 funciones SQL escalares que se usan directamente dentro de `SELECT`, `WHERE` y `ORDER BY`.

## Decisiones tecnicas

El objetivo del ejercicio es funciones SQL. A diferencia de un procedimiento almacenado (que se invoca con `CALL` y no puede aparecer dentro de una consulta), una `FUNCTION` devuelve un solo valor escalar y **si** se puede usar como si fuera una columna calculada:

1. **`fn_categoria_precio_skin(precio)`** — clasifica el precio en `Economica`/`Media`/`Premium`/`Legendaria`. Es `DETERMINISTIC NO SQL` porque no consulta ninguna tabla y siempre da el mismo resultado para el mismo precio.
2. **`fn_dias_en_inventario_skin(fecha_obtencion)`** — calcula `DATEDIFF(CURDATE(), fecha_obtencion)`. Es `NOT DETERMINISTIC` porque el resultado cambia cada dia aunque el parametro sea el mismo, pero sigue siendo `NO SQL` porque no consulta tablas.
3. **`fn_valor_total_propietario_skin(propietario)`** — suma el precio de todas las skins de un propietario. Es `READS SQL DATA` porque si consulta la tabla `coleccion_skins_shooter_fn`.

### Nota sobre un obstaculo real al crear las funciones

Al ejecutar `CREATE FUNCTION` por primera vez me encontre con el error `1419 (You do not have the SUPER privilege and binary logging is enabled...)`, porque el servidor tiene `log_bin` activado y `log_bin_trust_function_creators` estaba en `0`. El usuario `campus` (el que usan los scripts) no tiene privilegios para cambiar esa variable, asi que tuve que conectarme como `root` y ejecutar una sola vez:

```sql
SET GLOBAL log_bin_trust_function_creators = 1;
```

Esto queda documentado como comentario al inicio de `ddl/schema.sql`, ya que es una configuracion del servidor (no algo que el script de un estudiante pueda resolver por si solo) y es un problema real y comun al trabajar con funciones en MySQL con el binary log activado.

- `CONSTRAINT chk_precio_coleccion_skins_fn CHECK (precio >= 0)` evita precios invalidos.

## Archivos

- `ddl/schema.sql` — tabla + `CHECK` + 3 `CREATE FUNCTION` (con la nota sobre `log_bin_trust_function_creators`).
- `dml/inserts.sql` — 12 skins de practica, 5 propietarios.
- `dql/consultas.sql` — 6 consultas que usan las funciones dentro de `SELECT`, `WHERE` y `ORDER BY` (categoria de precio, dias en inventario, valor total por propietario, skins premium/legendarias, propietario con mayor inversion, skins con mas de 200 dias en inventario).
- `evidencias/resultados_consultas.txt` — salida real de las 6 consultas ejecutadas contra MySQL en Docker.

## Ejecutar

```bash
-- Solo si el servidor da error 1419 al crear las funciones (una sola vez, como root):
-- SET GLOBAL log_bin_trust_function_creators = 1;

docker exec -i campuslands-mysql-db mysql -u campus -pcampus123 campuslands_mysql < ddl/schema.sql
docker exec -i campuslands-mysql-db mysql -u campus -pcampus123 campuslands_mysql < dml/inserts.sql
docker exec -i campuslands-mysql-db mysql -u campus -pcampus123 campuslands_mysql < dql/consultas.sql
```
