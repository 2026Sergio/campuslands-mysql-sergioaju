# Ejercicio 006 (basico) - maria-montepeque

Tematica: autos hiperdeportivos. Tabla `autos_hiperdeportivos` con catalogo de autos de alto rendimiento (marca, potencia, velocidad maxima, precio y estado).

## Decisiones tecnicas

- `placa` es `UNIQUE` como identificador natural del vehiculo.
- `anio` usa el tipo `YEAR` porque solo interesa el ano de fabricacion.
- `precio` es `DECIMAL(12,2)` para manejar montos altos con precision exacta.
- `estado` es `ENUM` para limitar los valores de disponibilidad.
- `CONSTRAINT chk_velocidad_autos_hiper CHECK (velocidad_max_kmh > 0)` evita datos imposibles.
  El nombre del constraint es unico dentro de la base de datos para no chocar con los `CHECK` de otros ejercicios.
- Las consultas cubren distintas formas de `WHERE` (objetivo del ejercicio): comparacion simple, `BETWEEN`, `IN`, `AND`, `!=` y `LIKE`.

## Archivos

- `ddl/schema.sql` — tabla + `UNIQUE` en placa + `CHECK` de velocidad maxima.
- `dml/inserts.sql` — 10 autos de practica, 9 marcas y 6 paises de origen.
- `dql/consultas.sql` — 6 consultas (potencia > 900, precio entre 300000 y 1000000, marcas italianas por IN, disponibles y veloces con AND, no vendidos con !=, origen Italia con LIKE).
- `evidencias/resultados_consultas.txt` — salida real de las 6 consultas ejecutadas contra MySQL en Docker.

## Ejecutar

```bash
docker exec -i campuslands-mysql-db mysql -u campus -pcampus123 campuslands_mysql < ddl/schema.sql
docker exec -i campuslands-mysql-db mysql -u campus -pcampus123 campuslands_mysql < dml/inserts.sql
docker exec -i campuslands-mysql-db mysql -u campus -pcampus123 campuslands_mysql < dql/consultas.sql
```
