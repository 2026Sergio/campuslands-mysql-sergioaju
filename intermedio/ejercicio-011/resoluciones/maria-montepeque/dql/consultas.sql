-- intermedio/ejercicio-011 - maria-montepeque
USE campuslands_mysql;

-- 1. Top 5 jugadores por ranking de puntos
SELECT
    nombre,
    categoria,
    ranking_puntos
FROM jugadores_pingpong_intermedio
ORDER BY ranking_puntos DESC
LIMIT 5;

-- 2. Jugadores invictos (ganaron todos los partidos que jugaron)
SELECT
    nombre,
    partidos_jugados,
    partidos_ganados
FROM jugadores_pingpong_intermedio
WHERE partidos_ganados = partidos_jugados AND partidos_jugados > 0;

-- 3. Ranking promedio por categoria
SELECT
    categoria,
    COUNT(*) AS total_jugadores,
    ROUND(AVG(ranking_puntos), 2) AS ranking_promedio
FROM jugadores_pingpong_intermedio
GROUP BY categoria
ORDER BY ranking_promedio DESC;

-- 4. Diferencia de sets a favor menos en contra, de mayor a menor
SELECT
    nombre,
    sets_favor,
    sets_contra,
    (sets_favor - sets_contra) AS diferencia_sets
FROM jugadores_pingpong_intermedio
ORDER BY diferencia_sets DESC;

-- 5. Jugadores menores de edad (categoria infantil o juvenil)
SELECT
    nombre,
    edad,
    categoria
FROM jugadores_pingpong_intermedio
WHERE edad < 18
ORDER BY edad ASC;

-- 6. Porcentaje de victorias por jugador
SELECT
    nombre,
    partidos_jugados,
    partidos_ganados,
    ROUND(partidos_ganados / partidos_jugados * 100, 2) AS pct_victorias
FROM jugadores_pingpong_intermedio
ORDER BY pct_victorias DESC;
