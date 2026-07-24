# Ejercicio 003 (basico) - maria-montepeque

Tematica: inventario de skins shooter. Tabla `inventario_skins_shooter` con el inventario de skins de varios jugadores (arma, rareza, precio, propietario y estado).

## Decisiones tecnicas

- `id INT AUTO_INCREMENT PRIMARY KEY` es la clave primaria surrogada, tal como pide el objetivo del ejercicio (practicar PRIMARY KEY).
- `codigo_skin` es `UNIQUE` como clave de negocio (identificador legible del catalogo), distinta de la PK tecnica.
- `rareza` y `estado` son `ENUM` para limitar valores validos.
- `precio` es `DECIMAL(10,2)` para evitar errores de redondeo en dinero.
- `CONSTRAINT chk_precio_no_negativo_skins CHECK (precio >= 0)` evita precios invalidos.
  El nombre del constraint es unico dentro de la base de datos para no chocar con los `CHECK` de otros ejercicios.

## Archivos

- `ddl/schema.sql` — tabla + `PRIMARY KEY` + `UNIQUE` en codigo_skin + `CHECK` de precio.
- `dml/inserts.sql` — 10 skins de practica, repartidas en 5 propietarios, 6 armas y 3 estados.
- `dql/consultas.sql` — 6 consultas (top 5 mas caras, promedio por rareza, promedio por arma, total invertido por propietario, conteo por estado, legendarias equipadas).
- `evidencias/resultados_consultas.txt` — salida real de las 6 consultas ejecutadas contra MySQL en Docker.

## Ejecutar

```bash
docker exec -i campuslands-mysql-db mysql -u campus -pcampus123 campuslands_mysql < ddl/schema.sql
docker exec -i campuslands-mysql-db mysql -u campus -pcampus123 campuslands_mysql < dml/inserts.sql
docker exec -i campuslands-mysql-db mysql -u campus -pcampus123 campuslands_mysql < dql/consultas.sql
```
