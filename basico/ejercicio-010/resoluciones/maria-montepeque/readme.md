# Ejercicio 010 (basico) - maria-montepeque

Tematica: carreras urbanas. Tabla `participaciones_carreras_urbanas` con el registro de cada participacion de un piloto en una carrera (una fila por carrera disputada, no una fila por piloto).

## Decisiones tecnicas

- A diferencia de otros ejercicios, `piloto` no es `UNIQUE`: es intencional, porque cada piloto participa en varias carreras y el objetivo del ejercicio (`COUNT` y `SUM`) requiere poder agrupar varias filas por el mismo piloto.
- `posicion_llegada` usa `99` como convencion para descalificados/abandonos, ya que el `CHECK` exige un valor positivo y ese circuito no se completo con una posicion real.
- `premio_ganado` es `DECIMAL(10,2)` para sumar dinero sin errores de redondeo.
- `CONSTRAINT chk_posicion_carreras_urbanas CHECK (posicion_llegada > 0)` evita posiciones invalidas.
  El nombre del constraint es unico dentro de la base de datos para no chocar con los `CHECK` de otros ejercicios.
- Las consultas usan `COUNT(*)` y `SUM(...)` (objetivo del ejercicio) tanto agrupados por piloto/circuito/estado como en un resumen global sin `GROUP BY`.

## Archivos

- `ddl/schema.sql` — tabla + `CHECK` de posicion de llegada.
- `dml/inserts.sql` — 10 participaciones de 5 pilotos (2 carreras cada uno) en 4 circuitos.
- `dql/consultas.sql` — 6 consultas (carreras por piloto, premios por piloto, carreras por circuito, penalizaciones por piloto, carreras por estado, resumen global).
- `evidencias/resultados_consultas.txt` — salida real de las 6 consultas ejecutadas contra MySQL en Docker.

## Ejecutar

```bash
docker exec -i campuslands-mysql-db mysql -u campus -pcampus123 campuslands_mysql < ddl/schema.sql
docker exec -i campuslands-mysql-db mysql -u campus -pcampus123 campuslands_mysql < dml/inserts.sql
docker exec -i campuslands-mysql-db mysql -u campus -pcampus123 campuslands_mysql < dql/consultas.sql
```
