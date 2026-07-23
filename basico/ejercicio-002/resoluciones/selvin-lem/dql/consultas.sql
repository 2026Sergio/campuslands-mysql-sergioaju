USE campuslands_mysql;

-- 1. Listado general
SELECT * FROM basico_ejercicio_002;

-- 2. Top 5 por kills
SELECT jugador, plataforma, kills
FROM basico_ejercicio_002
ORDER BY kills DESC
LIMIT 5;

-- 3. Promedio de kills por plataforma
SELECT plataforma, COUNT(*) AS total_partidas, AVG(kills) AS promedio_kills
FROM basico_ejercicio_002
GROUP BY plataforma
ORDER BY promedio_kills DESC;

-- 4. Partidas ganadas (victorias)
SELECT jugador, posicion_final, tiempo_supervivencia, premio_ganado
FROM basico_ejercicio_002
WHERE es_victoria = TRUE;

-- 5. Partidas en revision o descalificadas (caso limite)
SELECT jugador, estado, kills, posicion_final
FROM basico_ejercicio_002
WHERE estado IN ('revision', 'descalificado');