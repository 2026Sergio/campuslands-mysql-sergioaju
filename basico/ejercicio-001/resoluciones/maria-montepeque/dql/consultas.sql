-- basico/ejercicio-001 - maria-montepeque
USE campuslands_mysql;

-- 1. Listado por KDA descendente
SELECT gamer_tag, equipo, rol, kda
FROM jugadores_torneo_moba
ORDER BY kda DESC;

-- 2. Top 5 por MVP
SELECT
    gamer_tag,
    equipo,
    mvp_count AS total_mvp
FROM jugadores_torneo_moba
ORDER BY mvp_count DESC
LIMIT 5;

-- 3. Promedio de KDA y victorias por rol
SELECT
    rol,
    COUNT(*) AS jugadores,
    ROUND(AVG(kda), 2) AS kda_promedio,
    SUM(victorias) AS victorias_totales
FROM jugadores_torneo_moba
GROUP BY
    rol
ORDER BY kda_promedio DESC;

-- 4. Activos con más del 50% de victorias
SELECT
    gamer_tag,
    equipo,
    ROUND(
        (victorias / partidas_jugadas) * 100,
        2
    ) AS pct_victorias
FROM jugadores_torneo_moba
WHERE
    estado = 'activo'
    AND (victorias / partidas_jugadas) > 0.5
ORDER BY pct_victorias DESC;

-- 5. Equipo con más victorias totales
SELECT equipo, SUM(victorias) AS victorias_totales
FROM jugadores_torneo_moba
GROUP BY
    equipo
ORDER BY victorias_totales DESC
LIMIT 1;

-- 6. Conteo por estado
SELECT estado, COUNT(*) AS total
FROM jugadores_torneo_moba
GROUP BY
    estado
ORDER BY total DESC;