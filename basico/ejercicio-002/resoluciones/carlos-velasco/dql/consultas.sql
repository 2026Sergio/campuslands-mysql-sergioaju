-- Consultas base. Completa o reemplaza segun el enunciado.
USE campuslands_mysql;

SELECT
    jugador,
    nickname,
    puntos
FROM ranking_battle_royale
ORDER BY puntos DESC
LIMIT 5;

SELECT
    jugador,
    region,
    nivel
FROM ranking_battle_royale
WHERE activo = TRUE;

SELECT
    region,
    COUNT(*) AS total_jugadores
FROM ranking_battle_royale
GROUP BY region;

SELECT
    region,
    AVG(puntos) AS promedio_puntos
FROM ranking_battle_royale
GROUP BY region
ORDER BY promedio_puntos DESC;

SELECT
    jugador,
    victorias,
    partidas
FROM ranking_battle_royale
WHERE victorias > 100
ORDER BY victorias DESC;
