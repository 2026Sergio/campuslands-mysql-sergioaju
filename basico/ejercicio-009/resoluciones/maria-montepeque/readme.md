# Ejercicio 009 (basico) - maria-montepeque

Tematica: kickboxing. Tabla `peleadores_kickboxing` con el registro de peleadores de un torneo, incluyendo un caso de limpieza de datos de prueba y una baja controlada.

## Decisiones tecnicas

- `nombre` es `UNIQUE` porque identifica al peleador dentro del torneo.
- `estado` es `ENUM` para reflejar la situacion del peleador (activo, retirado, descalificado).
- `CONSTRAINT chk_peleas_ganadas_kickboxing CHECK (peleas_ganadas >= 0)` evita datos imposibles.
  El nombre del constraint es unico dentro de la base de datos para no chocar con los `CHECK` de otros ejercicios.
- El objetivo del ejercicio es `DELETE controlado`, por eso `dml/inserts.sql` sigue este flujo:
  1. Inserta 10 peleadores reales.
  2. Inserta 2 registros de prueba (`TestFighter`, `DemoFighter`) que simulan un error de carga.
  3. Antes de cada `DELETE` se ejecuta un `SELECT` de verificacion para confirmar exactamente que se va a borrar.
  4. Los `DELETE` siempre usan un `WHERE` especifico (por gimnasio de prueba o por nombre + estado), nunca un `DELETE` sin condiciones sobre toda la tabla.
  5. Se elimina tambien, de forma puntual y verificada, al peleador `ByteCrusher` (descalificado, sin peleas ganadas) que solicito la baja de su registro.

## Archivos

- `ddl/schema.sql` — tabla + `UNIQUE` en nombre + `CHECK` de peleas ganadas.
- `dml/inserts.sql` — 10 peleadores reales + 2 registros de prueba, con los `SELECT` de verificacion y los `DELETE` controlados.
- `dql/consultas.sql` — 6 consultas (listado final, confirmacion de 0 registros de prueba, ranking de ganadas, conteo por categoria de peso, efectividad, conteo por gimnasio y estado).
- `evidencias/resultados_consultas.txt` — salida real de las 6 consultas ejecutadas contra MySQL en Docker, que confirma que los `DELETE` dejaron la tabla en el estado esperado (9 peleadores, 0 registros de prueba).

## Ejecutar

```bash
docker exec -i campuslands-mysql-db mysql -u campus -pcampus123 campuslands_mysql < ddl/schema.sql
docker exec -i campuslands-mysql-db mysql -u campus -pcampus123 campuslands_mysql < dml/inserts.sql
docker exec -i campuslands-mysql-db mysql -u campus -pcampus123 campuslands_mysql < dql/consultas.sql
```
