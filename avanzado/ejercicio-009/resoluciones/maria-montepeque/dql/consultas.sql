-- avanzado/ejercicio-009 - maria-montepeque
USE campuslands_mysql;

-- 1. Eventos con cupos disponibles para inscribirse
SELECT
    nombre_evento,
    cupos_disponibles
FROM eventos_kickboxing_locks
WHERE cupos_disponibles > 0
ORDER BY cupos_disponibles DESC;

-- 2. Uso correcto de SELECT ... FOR UPDATE dentro de una transaccion: bloquea
--    la fila de "Copa Kick 2026" hasta el COMMIT, para que ninguna otra
--    transaccion pueda leerla con FOR UPDATE ni modificarla mientras tanto
--    (esto es lo que se prueba en vivo con dos sesiones, ver el readme).
START TRANSACTION;

SELECT cupos_disponibles
FROM eventos_kickboxing_locks
WHERE nombre_evento = 'Copa Kick 2026'
FOR UPDATE;

COMMIT;

-- 3. Tiempo de espera configurado antes de que una transaccion bloqueada
--    falle con "Lock wait timeout exceeded" (relevante para bloqueos)
SHOW VARIABLES LIKE 'innodb_lock_wait_timeout';

-- 4. Nivel de aislamiento de transacciones activo (afecta como y cuanto
--    tiempo se retienen los bloqueos de lectura/escritura en InnoDB)
SELECT @@transaction_isolation AS nivel_aislamiento;

-- 5. Total de cupos disponibles en todos los eventos
SELECT SUM(cupos_disponibles) AS cupos_totales_disponibles
FROM eventos_kickboxing_locks;

-- 6. Evento con mas cupos disponibles
SELECT
    nombre_evento,
    cupos_disponibles
FROM eventos_kickboxing_locks
ORDER BY cupos_disponibles DESC
LIMIT 1;
