-- avanzado/ejercicio-014 - maria-montepeque
USE campuslands_mysql;

-- 1. Definicion del event registrado en el servidor (confirma que existe,
--    cada cuanto corre y si esta habilitado)
SELECT
    EVENT_NAME,
    EVENT_TYPE,
    INTERVAL_VALUE,
    INTERVAL_FIELD,
    STATUS
FROM information_schema.EVENTS
WHERE EVENT_SCHEMA = 'campuslands_mysql';

-- 2. Estado actual de todas las peliculas (para comparar contra la carga
--    inicial de dml/inserts.sql y ver cuales cambiaron de estado solas)
SELECT
    titulo,
    estado,
    fecha_estreno,
    fecha_actualizacion
FROM peliculas_saga_cf_events
ORDER BY fecha_estreno;

-- 3. Log de ejecuciones automaticas del event (cada fila es una corrida real
--    del scheduler, no algo que se inserto a mano)
SELECT
    mensaje,
    filas_afectadas,
    fecha_ejecucion
FROM log_eventos_saga_cf
ORDER BY fecha_ejecucion;

-- 4. Peliculas que el EVENT paso de "en_produccion" a "estrenada" el mismo
--    dia de hoy (es decir, actualizadas automaticamente, no por un UPDATE manual)
SELECT
    titulo,
    fecha_estreno,
    fecha_actualizacion
FROM peliculas_saga_cf_events
WHERE estado = 'estrenada' AND DATE(fecha_actualizacion) = CURDATE();

-- 5. Peliculas que siguen correctamente en produccion (fecha_estreno futura,
--    el event no debia tocarlas)
SELECT
    titulo,
    fecha_estreno
FROM peliculas_saga_cf_events
WHERE estado = 'en_produccion';

-- 6. Cantidad total de corridas del event registradas hasta ahora
SELECT COUNT(*) AS total_corridas_del_event
FROM log_eventos_saga_cf;
