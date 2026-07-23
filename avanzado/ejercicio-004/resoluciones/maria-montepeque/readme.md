# Ejercicio 004 (avanzado) - maria-montepeque

Tematica: garaje de motos. Tabla `motos_garaje_trg` mas dos tablas de historial (`historial_precios_motos_trg`, `historial_estado_motos_trg`) alimentadas automaticamente por 3 triggers.

## Decisiones tecnicas

El objetivo del ejercicio es triggers, por eso el diseno gira en torno a un patron de auditoria automatica (no depende de que la aplicacion recuerde registrar los cambios):

1. **`trg_motos_before_update`** (`BEFORE UPDATE`) — refresca `fecha_ultima_modificacion` en cada `UPDATE`, sin importar que columna cambie.
2. **`trg_motos_after_update_precio`** (`AFTER UPDATE`) — compara `OLD.precio` contra `NEW.precio`; si son distintos, inserta una fila en `historial_precios_motos_trg`. Si el `UPDATE` no toco el precio, no inserta nada.
3. **`trg_motos_after_update_estado`** (`AFTER UPDATE`) — misma logica que el anterior, pero para `estado`.

`dml/inserts.sql` incluye varios `UPDATE` de prueba disenados a proposito para verificar los tres casos:

- Cambios que solo tocan precio (`MTA-101`).
- Cambios que solo tocan estado (`MTA-102`, `MTA-107`).
- Un cambio que toca **ambos a la vez** (`MTA-105`), para confirmar que los dos triggers `AFTER UPDATE` se disparan en la misma sentencia y generan una fila en cada tabla de historial.
- Un cambio "neutro" que no toca ni precio ni estado (`MTA-103`, se corrige solo la fecha de ingreso), para confirmar que los triggers de historial **no** generan filas cuando no hay un cambio real, aunque `fecha_ultima_modificacion` si se actualice.

Las consultas 4 y 6 de `dql/consultas.sql` verifican explicitamente estos dos casos limite.

- `historial_precios_motos_trg.moto_id` y `historial_estado_motos_trg.moto_id` son `FOREIGN KEY` hacia `motos_garaje_trg.id`.
- `CONSTRAINT chk_precio_motos_trg CHECK (precio >= 0)` evita precios invalidos.

## Archivos

- `ddl/schema.sql` — tres tablas + dos `FOREIGN KEY` + `CHECK` + 3 `CREATE TRIGGER`.
- `dml/inserts.sql` — 10 motos, seguidas de 6 `UPDATE` de prueba (precio, estado, ambos a la vez, y uno neutro).
- `dql/consultas.sql` — 6 consultas que verifican el comportamiento de los triggers (estado actual con timestamp, historial de precios, historial de estado, motos con ambos historiales, conteo de cambios por moto, confirmacion de que la actualizacion neutra no genero historial).
- `evidencias/resultados_consultas.txt` — salida real de las 6 consultas ejecutadas contra MySQL en Docker.

## Ejecutar

```bash
docker exec -i campuslands-mysql-db mysql -u campus -pcampus123 campuslands_mysql < ddl/schema.sql
docker exec -i campuslands-mysql-db mysql -u campus -pcampus123 campuslands_mysql < dml/inserts.sql
docker exec -i campuslands-mysql-db mysql -u campus -pcampus123 campuslands_mysql < dql/consultas.sql
```
