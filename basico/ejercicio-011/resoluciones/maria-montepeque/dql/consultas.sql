-- basico/ejercicio-011 - maria-montepeque
USE campuslands_mysql;

-- 1. Top 5 jugadores por ranking de puntos
SELECT
    nombre,
    club,
    ranking_puntos
FROM jugadores_pingpong
ORDER BY ranking_puntos DESC
LIMIT 5;

-- 2. Jugadores invictos (ganaron todos los partidos que jugaron)
SELECT
    nombre,
    partidos_jugados,
    partidos_ganados
FROM jugadores_pingpong
WHERE partidos_ganados = partidos_jugados AND partidos_jugados > 0;

-- 3. Cantidad de jugadores por categoria
SELECT
    categoria,
    COUNT(*) AS total_jugadores
FROM jugadores_pingpong
GROUP BY categoria
ORDER BY total_jugadores DESC;

-- 4. Ranking promedio segun mano dominante
SELECT
    mano_dominante,
    COUNT(*) AS total_jugadores,
    ROUND(AVG(ranking_puntos), 2) AS ranking_promedio
FROM jugadores_pingpong
GROUP BY mano_dominante
ORDER BY ranking_promedio DESC;

-- 5. Jugadores inactivos
SELECT
    nombre,
    club,
    estado
FROM jugadores_pingpong
WHERE estado = 'inactivo';

-- 6. Porcentaje de victorias por jugador
SELECT
    nombre,
    partidos_jugados,
    partidos_ganados,
    ROUND(partidos_ganados / partidos_jugados * 100, 2) AS pct_victorias
FROM jugadores_pingpong
ORDER BY pct_victorias DESC;
