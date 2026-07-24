-- DQL: Consultas de análisis para Battle Royale
USE campuslands_mysql;

-- 1. Leaderboard / Tabla de Clasificación Global
SELECT 
    RANK() OVER (ORDER BY puntos_totales DESC) AS posicion,
    nickname,
    rango,
    puntos_totales,
    victorias,
    bajas_totales,
    partidas_jugadas
FROM jugadores_br
WHERE estado = 'activo'
ORDER BY puntos_totales DESC;

-- 2. Promedio de Bajas por Partida (K/D Ratio simplificado)
SELECT 
    nickname,
    rango,
    bajas_totales,
    partidas_jugadas,
    ROUND(bajas_totales / NULLIF(partidas_jugadas, 0), 2) AS promedio_bajas
FROM jugadores_br
WHERE partidas_jugadas > 0
ORDER BY promedio_bajas DESC;

-- 3. Historial de Partidas con Nombres de Jugadores
SELECT 
    hp.partida_id,
    j.nickname,
    hp.posicion_final,
    hp.bajas_partida,
    hp.puntos_obtenidos,
    hp.fecha_partida
FROM historial_partidas hp
JOIN jugadores_br j ON hp.jugador_id = j.jugador_id
ORDER BY hp.fecha_partida DESC;

-- 4. Distribución de Jugadores por Rango
SELECT 
    rango,
    COUNT(*) AS total_jugadores,
    SUM(victorias) AS victorias_acumuladas
FROM jugadores_br
GROUP BY rango
ORDER BY total_jugadores DESC;

-- 5. Top Jugadores con Mayor Porcentaje de Victorias (Win Rate)
SELECT 
    nickname,
    rango,
    partidas_jugadas,
    victorias,
    CONCAT(ROUND((victorias / partidas_jugadas) * 100, 1), '%') AS win_rate
FROM jugadores_br
WHERE partidas_jugadas >= 2
ORDER BY (victorias / partidas_jugadas) DESC;
