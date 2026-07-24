

SELECT 
    j.jugador_id,
    j.nickname,
    j.region,
    j.rango_actual,
    p.partida_id,
    p.puesto_final,
    p.bajas,
    p.puntos_obtenidos
FROM jugadores j
LEFT JOIN partidas_clasificatorias p ON j.jugador_id = p.jugador_id
WHERE p.partida_id IS NULL;

SELECT 
    j.nickname,
    j.rango_actual,
    COUNT(p.partida_id) AS total_partidas,
    COALESCE(SUM(p.bajas), 0) AS total_bajas,
    COALESCE(SUM(p.puntos_obtenidos), 0) AS balance_puntos,
    COALESCE(ROUND(AVG(p.duracion_minutos), 1), 0.0) AS tiempo_promedio_supervivencia
FROM jugadores j
LEFT JOIN partidas_clasificatorias p ON j.jugador_id = p.jugador_id
GROUP BY j.jugador_id, j.nickname, j.rango_actual
HAVING total_partidas < 3;

UPDATE jugadores j
LEFT JOIN partidas_clasificatorias p ON j.jugador_id = p.jugador_id
SET j.rango_actual = 'Bronce'
WHERE p.partida_id IS NULL;

DELETE j FROM jugadores j
LEFT JOIN partidas_clasificatorias p ON j.jugador_id = p.jugador_id
WHERE p.partida_id IS NULL 
  AND j.fecha_registro < '2026-03-11 00:00:00';

SELECT 
    j.nickname,
    j.region,
    j.rango_actual,
    COUNT(p.partida_id) AS partidas_jugadas,
    COALESCE(SUM(p.bajas), 0) AS bajas_totales,
    COALESCE(SUM(p.puntos_obtenidos), 0) AS puntos_totales
FROM jugadores j
LEFT JOIN partidas_clasificatorias p ON j.jugador_id = p.jugador_id
GROUP BY j.jugador_id, j.nickname, j.region, j.rango_actual
ORDER BY puntos_totales DESC, bajas_totales DESC
LIMIT 5;