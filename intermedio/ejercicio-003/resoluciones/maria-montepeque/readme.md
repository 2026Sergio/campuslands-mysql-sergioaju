# Ejercicio 003 (intermedio) - maria-montepeque

Tematica: inventario de skins shooter. Tabla `coleccion_skins_shooter` con 12 skins de 5 propietarios, pensada para practicar distintas formas de `GROUP BY`.

## Decisiones tecnicas

- `codigo_skin` es `UNIQUE` como clave de negocio del catalogo.
- Los datos se disenaron con proposito: 2 propietarios (`NovaStrike`, `KairoShot`) tienen 3 skins cada uno para poder demostrar `HAVING COUNT(*) >= 3`, y las armas/rarezas se repiten lo suficiente para que el `GROUP BY` compuesto tenga sentido.
- `CONSTRAINT chk_precio_coleccion_skins CHECK (precio >= 0)` evita precios invalidos.
  El nombre del constraint es unico dentro de la base de datos para no chocar con los `CHECK` de otros ejercicios.
- Las consultas cubren variantes de `GROUP BY` (objetivo del ejercicio): agrupacion simple, agrupacion por dos columnas, `HAVING` sobre `COUNT`, `HAVING` sobre `AVG`, multiples funciones de agregacion juntas (`MIN`/`MAX`/`SUM`) y agrupacion por una expresion (`YEAR(fecha_obtencion)`).

## Archivos

- `ddl/schema.sql` — tabla + `UNIQUE` en codigo_skin + `CHECK` de precio.
- `dml/inserts.sql` — 12 skins de practica, 5 propietarios, 6 armas y 5 rarezas.
- `dql/consultas.sql` — 6 consultas (rareza+arma, propietarios con 3+ skins, armas con precio promedio > 30, estado+rareza, min/max/total por propietario, skins por ano).
- `evidencias/resultados_consultas.txt` — salida real de las 6 consultas ejecutadas contra MySQL en Docker.

## Ejecutar

```bash
docker exec -i campuslands-mysql-db mysql -u campus -pcampus123 campuslands_mysql < ddl/schema.sql
docker exec -i campuslands-mysql-db mysql -u campus -pcampus123 campuslands_mysql < dml/inserts.sql
docker exec -i campuslands-mysql-db mysql -u campus -pcampus123 campuslands_mysql < dql/consultas.sql
```
