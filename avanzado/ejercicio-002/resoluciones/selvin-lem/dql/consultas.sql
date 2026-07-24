USE campuslands_mysql;

-- 1. Ranking actualizado tras las partidas simuladas
SELECT nombre_jugador, partidas_jugadas, victorias, puntos_ranking
FROM jugadores_battle_royale
ORDER BY puntos_ranking DESC;

-- 2. Jugadores con al menos una victoria
SELECT nombre_jugador, victorias, puntos_ranking
FROM jugadores_battle_royale
WHERE victorias > 0;

-- 3. Win rate calculado directamente (sin procedimiento, para comparar)
SELECT nombre_jugador,
       partidas_jugadas,
       IF(partidas_jugadas = 0, 0, ROUND((victorias / partidas_jugadas) * 100, 2)) AS win_rate
FROM jugadores_battle_royale
WHERE partidas_jugadas > 0
ORDER BY win_rate DESC;

-- 4. Jugadores que no registraron partidas (caso limite)
SELECT nombre_jugador, estado
FROM jugadores_battle_royale
WHERE partidas_jugadas = 0;

-- 5. Ejecucion directa del procedimiento de estadisticas para otro jugador
CALL obtener_estadisticas_jugador(3, @nombre, @winrate, @puntos);
SELECT @nombre AS nombre_jugador, @winrate AS win_rate, @puntos AS puntos_totales;