# Ejercicio 009 (avanzado) - maria-montepeque

Tematica: kickboxing. Tabla `eventos_kickboxing_locks` con cupos disponibles por evento, usada para demostrar bloqueos reales de InnoDB con `SELECT ... FOR UPDATE`.

## Decisiones tecnicas

El objetivo del ejercicio es bloqueos. Un `.sql` ejecutado con una sola conexion (como `mysql < archivo.sql`) no puede demostrar un bloqueo real entre transacciones, porque todo corre en secuencia dentro de la misma sesion. Por eso la prueba central de este ejercicio se hizo con **dos sesiones concurrentes de verdad** (dos procesos `mysql` distintos, uno en segundo plano), fuera del script entregable, y quedo documentada aqui con los tiempos medidos.

### Prueba de bloqueo con dos sesiones concurrentes

1. **Sesion A** (en segundo plano): abre una transaccion, ejecuta `SELECT cupos_disponibles FROM eventos_kickboxing_locks WHERE nombre_evento = 'Copa Kick 2026' FOR UPDATE` (bloquea esa fila) y retiene el bloqueo con `SELECT SLEEP(8)` antes de hacer `UPDATE` + `COMMIT`.
2. Dos segundos despues de iniciar la Sesion A, tome un snapshot de `information_schema.innodb_trx` que confirma que su transaccion seguia `RUNNING`, reteniendo el bloqueo.
3. **Sesion B** (en primer plano, lanzada justo despues del snapshot): intenta el mismo `SELECT ... FOR UPDATE` sobre la misma fila. Medido con `time`, tardo **5.9 segundos reales** en completarse: quedo bloqueada esperando a que la Sesion A liberara el lock con su `COMMIT`. Sin el bloqueo, hubiera respondido en milisegundos.
4. Al desbloquearse, la Sesion B leyo el valor ya actualizado por la Sesion A (`cupos_disponibles = 4`), confirmando que el bloqueo tambien garantizo la consistencia del dato (sin `FOR UPDATE`, ambas sesiones podrian haber leido `5` y decrementado por separado, perdiendo una de las dos actualizaciones: el clasico problema de "lost update").

Los detalles completos (consultas exactas, snapshot y tiempos) quedan en `evidencias/resultados_consultas.txt`.

- `CONSTRAINT chk_cupos_kickboxing_locks CHECK (cupos_disponibles >= 0)` evita cupos negativos.

## Archivos

- `ddl/schema.sql` — tabla + `CHECK`.
- `dml/inserts.sql` — 4 eventos con distintos cupos disponibles.
- `dql/consultas.sql` — 6 consultas: eventos con cupos, un `SELECT ... FOR UPDATE` correctamente encerrado en su transaccion, la configuracion de `innodb_lock_wait_timeout`, el nivel de aislamiento activo, y dos consultas de negocio (total de cupos, evento con mas cupos).
- `evidencias/resultados_consultas.txt` — salida real de las 6 consultas, mas el detalle completo de la prueba de bloqueo con dos sesiones concurrentes (snapshot de `innodb_trx` y tiempos medidos con `time`).

## Ejecutar

```bash
docker exec -i campuslands-mysql-db mysql -u campus -pcampus123 campuslands_mysql < ddl/schema.sql
docker exec -i campuslands-mysql-db mysql -u campus -pcampus123 campuslands_mysql < dml/inserts.sql
docker exec -i campuslands-mysql-db mysql -u campus -pcampus123 campuslands_mysql < dql/consultas.sql
```
