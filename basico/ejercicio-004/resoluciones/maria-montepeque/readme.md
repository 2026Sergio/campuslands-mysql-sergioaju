# Ejercicio 004 (basico) - maria-montepeque

Tematica: garaje de motos. Tabla `motos_garaje` con el inventario de un garaje (marca, modelo, cilindraje, precio y estado).

## Decisiones tecnicas

- `placa` es `UNIQUE` porque es el identificador natural del vehiculo.
- `anio` usa el tipo `YEAR` de MySQL, ya que solo se necesita el ano, no una fecha completa.
- `precio` es `DECIMAL(10,2)` para evitar errores de redondeo en dinero.
- `estado` es `ENUM` para limitar los valores a los estados reales del garaje.
- `CONSTRAINT chk_cilindraje_motos_garaje CHECK (cilindraje > 0)` evita datos imposibles.
  El nombre del constraint es unico dentro de la base de datos para no chocar con los `CHECK` de otros ejercicios.

## Archivos

- `ddl/schema.sql` — tabla + `UNIQUE` en placa + `CHECK` de cilindraje.
- `dml/inserts.sql` — 10 motos de practica, 7 marcas distintas y 3 estados.
- `dql/consultas.sql` — 6 consultas (top 5 mas caras, promedio por marca, disponibles ordenadas por precio, cilindraje promedio por marca, conteo por estado, alto cilindraje por anio).
- `evidencias/resultados_consultas.txt` — salida real de las 6 consultas ejecutadas contra MySQL en Docker.

## Ejecutar

```bash
docker exec -i campuslands-mysql-db mysql -u campus -pcampus123 campuslands_mysql < ddl/schema.sql
docker exec -i campuslands-mysql-db mysql -u campus -pcampus123 campuslands_mysql < dml/inserts.sql
docker exec -i campuslands-mysql-db mysql -u campus -pcampus123 campuslands_mysql < dql/consultas.sql
```
