# Ejercicio 004 (intermedio) - maria-montepeque

Tematica: garaje de motos. Tabla `registros_servicio_motos` con el historial de servicios de un garaje (cada moto puede tener varios registros), pensada para practicar `HAVING`.

## Decisiones tecnicas

- A diferencia del ejercicio basico equivalente, esta tabla es un historial de servicios (varias filas por moto, identificada por `placa`), no un inventario de una fila por moto. Esto es necesario porque el objetivo del ejercicio es `HAVING`, que filtra sobre resultados ya agrupados.
- Los datos se disenaron a proposito: 2 motos (`MTA-101`, `MTA-102`) tienen 3 servicios cada una para poder demostrar `HAVING COUNT(*) > 2`, y los costos varian lo suficiente para que los umbrales de `HAVING SUM/AVG/MAX` separen resultados de forma clara.
- `CONSTRAINT chk_costo_servicio_motos CHECK (costo >= 0)` evita costos invalidos.
  El nombre del constraint es unico dentro de la base de datos para no chocar con los `CHECK` de otros ejercicios.
- Las consultas cubren `HAVING` sobre distintas funciones de agregacion: `COUNT`, `SUM`, `AVG` y `MAX`, tanto agrupando por placa como por mecanico y por tipo de servicio.

## Archivos

- `ddl/schema.sql` — tabla + `CHECK` de costo.
- `dml/inserts.sql` — 12 registros de servicio sobre 6 motos, 3 mecanicos y 3 tipos de servicio.
- `dql/consultas.sql` — 6 consultas con `HAVING` (motos con mas de 2 servicios, costo total > 400, costo promedio > 200, mecanicos con mas de 3 servicios, tipos de servicio con 4+ registros, servicio individual mas caro > 300).
- `evidencias/resultados_consultas.txt` — salida real de las 6 consultas ejecutadas contra MySQL en Docker.

## Ejecutar

```bash
docker exec -i campuslands-mysql-db mysql -u campus -pcampus123 campuslands_mysql < ddl/schema.sql
docker exec -i campuslands-mysql-db mysql -u campus -pcampus123 campuslands_mysql < dml/inserts.sql
docker exec -i campuslands-mysql-db mysql -u campus -pcampus123 campuslands_mysql < dql/consultas.sql
```
