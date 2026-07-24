# Ejercicio 010 (avanzado) - maria-montepeque

Tematica: carreras urbanas. Tabla `participaciones_carreras_urbanas_backup` con 10 participaciones, usada para un ciclo real de backup logico y restauracion con `mysqldump`.

## Decisiones tecnicas

El objetivo del ejercicio es backup logico. Un backup no demuestra nada si nunca se prueba la restauracion, asi que ademas de generar el dump hice el ciclo completo: **backup -> desastre simulado -> restauracion -> verificacion de integridad**.

### Ciclo de backup y restauracion (fuera del script entregable, documentado aqui y en la evidencia)

1. **Backup**: `mysqldump -u campus -pcampus123 --no-tablespaces --databases campuslands_mysql --tables participaciones_carreras_urbanas_backup > backup_participaciones.sql`. El archivo generado se guardo en `evidencias/backup_participaciones.sql` como artefacto real del ejercicio.
   - El primer intento sin `--no-tablespaces` genero una advertencia (`Access denied; you need the PROCESS privilege(s) ... to dump tablespaces`) porque `campus` no tiene privilegios globales. No afecto los datos, pero se repitio con `--no-tablespaces` para un backup limpio.
2. **Desastre simulado**: `DROP TABLE participaciones_carreras_urbanas_backup;` — se confirmo que la tabla desaparecio (`ERROR 1146: Table ... doesn't exist`).
3. **Restauracion**: `mysql -u campus -pcampus123 campuslands_mysql < backup_participaciones.sql`, sin errores.
4. **Verificacion de integridad**: la consulta 4 de `dql/consultas.sql` calcula una "huella" `MD5(GROUP_CONCAT(id, piloto, premio_ganado ORDER BY id))` de toda la tabla. Antes del desastre esa huella fue `4a6b3238a2c7201963853e779d21d7f8`; despues de restaurar el backup, **la misma consulta devolvio exactamente la misma huella**, confirmando que los datos volvieron identicos, fila por fila, sin perdida ni alteracion.

- `CONSTRAINT chk_posicion_carreras_backup CHECK (posicion_llegada > 0)` evita datos imposibles.

## Archivos

- `ddl/schema.sql` — tabla + `CHECK`.
- `dml/inserts.sql` — 10 participaciones de 5 pilotos.
- `dql/consultas.sql` — 6 consultas de negocio, incluyendo una con huella `MD5` pensada especificamente para comparar el estado de los datos antes y despues de un backup/restore.
- `evidencias/resultados_consultas.txt` — salida real de las 6 consultas, mas el detalle completo del ciclo de backup y restauracion (comandos, errores esperados y verificacion de la huella MD5).
- `evidencias/backup_participaciones.sql` — el archivo de backup logico real generado con `mysqldump`, incluido como artefacto del ejercicio.

## Ejecutar

```bash
docker exec -i campuslands-mysql-db mysql -u campus -pcampus123 campuslands_mysql < ddl/schema.sql
docker exec -i campuslands-mysql-db mysql -u campus -pcampus123 campuslands_mysql < dml/inserts.sql
docker exec -i campuslands-mysql-db mysql -u campus -pcampus123 campuslands_mysql < dql/consultas.sql
```
