# Ejercicio 009 (intermedio) - maria-montepeque

Tematica: kickboxing. Dos tablas: `gimnasios_kickboxing` (gimnasios) y `peleadores_kickboxing` (peleadores, cada uno asociado a un gimnasio mediante `FOREIGN KEY`).

## Decisiones tecnicas

El objetivo del ejercicio es `FOREIGN KEY`, por eso el diseno y las pruebas se centraron en la integridad referencial, no solo en declarar la relacion:

- `peleadores_kickboxing.gimnasio_id` es `FOREIGN KEY` hacia `gimnasios_kickboxing.id`, con `ON DELETE RESTRICT` (no se puede borrar un gimnasio mientras tenga peleadores) y `ON UPDATE CASCADE`.
- `Gimnasio Vacio` se dejo a proposito sin peleadores, para poder demostrar con `LEFT JOIN` que la relacion es opcional del lado del gimnasio.
- `CONSTRAINT chk_peleas_ganadas_kickboxing_fk CHECK (peleas_ganadas >= 0)` evita datos imposibles.

### Verificacion manual de la integridad referencial

Antes de generar la evidencia final, probe (fuera del script entregable, directamente contra el contenedor Docker) que la FK realmente protege los datos:

- Intentar insertar un peleador con `gimnasio_id = 9999` (que no existe) fallo con `ERROR 1452`.
- Intentar borrar `Gimnasio Fenix` (que tiene peleadores) fallo con `ERROR 1451` por el `ON DELETE RESTRICT`.
- Borrar un gimnasio sin peleadores (`Gimnasio Vacio`) si funciono correctamente.

Despues de esas pruebas volvi a ejecutar `ddl/schema.sql` + `dml/inserts.sql` para dejar la base en el mismo estado limpio que describe este entregable, antes de correr `dql/consultas.sql` para la evidencia final.

## Archivos

- `ddl/schema.sql` — dos tablas + `FOREIGN KEY` con `ON DELETE RESTRICT` / `ON UPDATE CASCADE` + `CHECK`.
- `dml/inserts.sql` — 4 gimnasios (uno sin peleadores) y 10 peleadores.
- `dql/consultas.sql` — 6 consultas (peleadores con su gimnasio, cantidad por gimnasio, gimnasios sin peleadores, mejor peleador por gimnasio, victorias totales por gimnasio, peleadores retirados).
- `evidencias/resultados_consultas.txt` — salida real de las 6 consultas ejecutadas contra MySQL en Docker.

## Ejecutar

```bash
docker exec -i campuslands-mysql-db mysql -u campus -pcampus123 campuslands_mysql < ddl/schema.sql
docker exec -i campuslands-mysql-db mysql -u campus -pcampus123 campuslands_mysql < dml/inserts.sql
docker exec -i campuslands-mysql-db mysql -u campus -pcampus123 campuslands_mysql < dql/consultas.sql
```
