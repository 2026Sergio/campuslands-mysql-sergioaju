-- avanzado/ejercicio-010 - maria-montepeque
USE campuslands_mysql;

-- 1. Cantidad de carreras disputadas por piloto
SELECT
    piloto,
    COUNT(*) AS total_carreras
FROM participaciones_carreras_urbanas_backup
GROUP BY piloto
ORDER BY total_carreras DESC;

-- 2. Total de premios ganados por piloto
SELECT
    piloto,
    SUM(premio_ganado) AS total_premios
FROM participaciones_carreras_urbanas_backup
GROUP BY piloto
ORDER BY total_premios DESC;

-- 3. Cantidad de carreras por estado
SELECT
    estado,
    COUNT(*) AS total_carreras
FROM participaciones_carreras_urbanas_backup
GROUP BY estado
ORDER BY total_carreras DESC;

-- 4. Resumen global: filas y suma de premios totales (usado tambien como
--    "huella" para comparar antes y despues del backup/restore)
SELECT
    COUNT(*) AS total_carreras_registradas,
    SUM(premio_ganado) AS total_premios_repartidos,
    MD5(GROUP_CONCAT(id, piloto, premio_ganado ORDER BY id SEPARATOR '|')) AS huella_datos
FROM participaciones_carreras_urbanas_backup;

-- 5. Detalle completo ordenado por id (referencia exacta para comparar fila
--    por fila antes y despues de restaurar el backup)
SELECT
    id,
    piloto,
    circuito,
    posicion_llegada,
    premio_ganado,
    estado
FROM participaciones_carreras_urbanas_backup
ORDER BY id;

-- 6. Circuito con mas carreras registradas
SELECT
    circuito,
    COUNT(*) AS total_carreras
FROM participaciones_carreras_urbanas_backup
GROUP BY circuito
ORDER BY total_carreras DESC
LIMIT 1;
