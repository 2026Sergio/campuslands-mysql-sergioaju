# Ejercicio 005 (basico) - maria-montepeque

Tematica: taller mecanico de motos. Tabla `ordenes_taller_motos` con las ordenes de servicio de un taller (cliente, mecanico, tipo de servicio, costo y estado).

## Decisiones tecnicas

- `numero_orden` es `UNIQUE` porque es el identificador de negocio de cada orden.
- `tipo_servicio` y `estado` son `ENUM` para limitar valores validos.
- `costo` es `DECIMAL(10,2)` para evitar errores de redondeo en dinero.
- `CONSTRAINT chk_costo_taller_motos CHECK (costo >= 0)` evita costos invalidos.
  El nombre del constraint es unico dentro de la base de datos para no chocar con los `CHECK` de otros ejercicios.
- Las consultas cubren distintas formas de `SELECT` (objetivo del ejercicio): `WHERE` con `IN`, `BETWEEN`, `LIKE`, `ORDER BY`, `GROUP BY` con `HAVING`.

## Archivos

- `ddl/schema.sql` — tabla + `UNIQUE` en numero_orden + `CHECK` de costo.
- `dml/inserts.sql` — 10 ordenes de practica, 5 clientes y 4 mecanicos.
- `dql/consultas.sql` — 6 consultas (pendientes/en proceso, costo entre 50 y 300, mecanico por LIKE, top 5 mas costosas, promedio por tipo de servicio, clientes con mas de una orden).
- `evidencias/resultados_consultas.txt` — salida real de las 6 consultas ejecutadas contra MySQL en Docker.

## Ejecutar

```bash
docker exec -i campuslands-mysql-db mysql -u campus -pcampus123 campuslands_mysql < ddl/schema.sql
docker exec -i campuslands-mysql-db mysql -u campus -pcampus123 campuslands_mysql < dml/inserts.sql
docker exec -i campuslands-mysql-db mysql -u campus -pcampus123 campuslands_mysql < dql/consultas.sql
```
