-- basico/ejercicio-002 - maria-montepeque
USE campuslands_mysql;

-- 1. Ranking general por puntaje de temporada
SELECT
    nickname,
    escuadra,
    puntaje_temporada
FROM jugadores_ranking_battle_royale
ORDER BY puntaje_temporada DESC
LIMIT 5;

-- 2. Porcentaje de victorias por jugador
SELECT
    nickname,
    partidas_jugadas,
    victorias,
    ROUND(victorias / partidas_jugadas * 100, 2) AS pct_victorias
FROM jugadores_ranking_battle_royale
ORDER BY pct_victorias DESC;

-- 3. Eliminaciones promedio y total de jugadores por plataforma
SELECT
    plataforma,
    COUNT(*) AS total_jugadores,
    ROUND(AVG(eliminaciones), 2) AS eliminaciones_promedio
FROM jugadores_ranking_battle_royale
GROUP BY plataforma
ORDER BY eliminaciones_promedio DESC;

-- 4. Jugador con mas eliminaciones (top fragger)
SELECT
    nickname,
    escuadra,
    eliminaciones
FROM jugadores_ranking_battle_royale
ORDER BY eliminaciones DESC
LIMIT 1;

-- 5. Conteo de jugadores por estado
SELECT
    estado,
    COUNT(*) AS total_jugadores
FROM jugadores_ranking_battle_royale
GROUP BY estado
ORDER BY total_jugadores DESC;

-- 6. Jugadores activos con mas de 80 partidas, ordenados por partida mas reciente
SELECT
    nickname,
    partidas_jugadas,
    fecha_ultima_partida
FROM jugadores_ranking_battle_royale
WHERE estado = 'activo' AND partidas_jugadas > 80
ORDER BY fecha_ultima_partida DESC;
