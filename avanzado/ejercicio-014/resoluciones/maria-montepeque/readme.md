# Ejercicio 014 (avanzado) - maria-montepeque

Tematica: saga de ciencia ficcion. Tabla `peliculas_saga_cf_events` mas `log_eventos_saga_cf`, y un `EVENT` (`ev_actualizar_estrenos_saga_cf`) que corre automaticamente cada minuto.

## Decisiones tecnicas

El objetivo del ejercicio es *event scheduler*. `ddl/schema.sql` tiene una parte que puede crear el usuario normal `campus` y otra que requiere administrador:

- **Crear la tabla y el `EVENT`** — si lo puede hacer `campus`, porque `ALL PRIVILEGES` sobre `campuslands_mysql` incluye el privilegio `EVENT`. Lo verifique creando y borrando un evento de prueba antes de escribir la solucion final.
- **Activar el scheduler del servidor** (`SET GLOBAL event_scheduler = ON`) — esto **no** lo puede hacer `campus`; falla con `ERROR 1227 (Access denied; you need SUPER or SYSTEM_VARIABLES_ADMIN)`. Es una configuracion global del servidor, asi que la active como `root` al validar este ejercicio.

El `EVENT` revisa cada minuto si alguna pelicula en `en_produccion` ya deberia estar `estrenada` (`fecha_estreno <= CURDATE()`), la actualiza, y deja un registro de cada corrida en `log_eventos_saga_cf` (incluso cuando no actualiza nada), para poder auditar que el scheduler sigue vivo.

### Evidencia de que el event corrio solo, de verdad

Despues de activar el scheduler, deje pasar el tiempo real y observe **dos corridas automaticas reales, exactamente separadas por 60 segundos** (el intervalo configurado):

| Corrida | Hora real | filas_afectadas |
| --- | --- | --- |
| 1 | `2026-07-23 01:25:45` | 0 |
| 2 | `2026-07-23 01:26:45` | 1 |

La segunda corrida actualizo `Horizonte Cuantico: Colapso` de `en_produccion` a `estrenada` (su `fecha_estreno`, `2026-07-01`, ya habia pasado), y su `fecha_actualizacion` quedo en `2026-07-23 01:26:45`, exactamente la hora de esa segunda corrida. Nadie ejecuto un `UPDATE` manual: el cambio lo hizo el `EVENT` por si solo.

**Nota honesta sobre la consulta 4**: como la carga inicial de datos y la primera corrida del event ocurrieron el mismo dia, filtrar por `DATE(fecha_actualizacion) = CURDATE()` tambien incluye peliculas que ya eran `estrenada` desde la carga original (su `fecha_actualizacion` por defecto tambien cae hoy). La prueba inequivoca de que el event actuo esta en la consulta 3 (`log_eventos_saga_cf`), donde la fila con `filas_afectadas = 1` es evidencia directa e inconfundible de la actualizacion automatica.

- `CONSTRAINT chk_episodio_saga_cf_events CHECK (episodio > 0)` evita datos imposibles.

## Archivos

- `ddl/schema.sql` — dos tablas + `CHECK` + `CREATE EVENT` (con la nota sobre el privilegio de administrador necesario para activar el scheduler).
- `dml/inserts.sql` — 7 peliculas, una de ellas (`Horizonte Cuantico: Colapso`) cargada a proposito como `en_produccion` con fecha de estreno ya pasada, para que el event tuviera algo real que actualizar.
- `dql/consultas.sql` — 6 consultas: definicion del event registrado, estado actual de todas las peliculas, log de corridas, peliculas "actualizadas hoy", peliculas correctamente sin tocar, y total de corridas.
- `evidencias/resultados_consultas.txt` — salida real de las 6 consultas, incluyendo las dos corridas reales del event separadas por 60 segundos.

## Ejecutar

```bash
docker exec -i campuslands-mysql-db mysql -u campus -pcampus123 campuslands_mysql < ddl/schema.sql
docker exec -i campuslands-mysql-db mysql -u root -proot123 -e "SET GLOBAL event_scheduler = ON;"   # requiere administrador
docker exec -i campuslands-mysql-db mysql -u campus -pcampus123 campuslands_mysql < dml/inserts.sql
docker exec -i campuslands-mysql-db mysql -u campus -pcampus123 campuslands_mysql < dql/consultas.sql
```
