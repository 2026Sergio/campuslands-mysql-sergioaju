USE db_battle_royale_procs;

-- 1. Listado general del ranking de jugadores con su respectivo clan (utilizando LEFT JOIN)
SELECT 
    j.alias, 
    j.eliminaciones, 
    j.puntos_ranking, 
    COALESCE(c.nombre, 'Sin Clan') AS clan 
FROM jugadores j 
LEFT JOIN clanes c ON j.id_clan = c.id 
ORDER BY j.puntos_ranking DESC;

-- 2. Top 3 de jugadores con mayor cantidad de eliminaciones del ranking general
SELECT alias, eliminaciones, puntos_ranking 
FROM jugadores 
ORDER BY eliminaciones DESC 
LIMIT 3;

-- 3. Promedio de puntos de ranking y total de eliminaciones agrupadas por clan (con LEFT JOIN)
SELECT 
    c.nombre AS clan, 
    c.region,
    COUNT(j.id) AS total_miembros, 
    ROUND(AVG(j.puntos_ranking), 2) AS promedio_puntos,
    SUM(j.eliminaciones) AS total_eliminaciones_clan
FROM clanes c 
LEFT JOIN jugadores j ON c.id = j.id_clan 
GROUP BY c.id, c.nombre, c.region 
ORDER BY promedio_puntos DESC;

-- 4. Jugadores cuyo puntaje de ranking supera el promedio general de todos los jugadores (Subconsulta)
SELECT alias, eliminaciones, puntos_ranking 
FROM jugadores 
WHERE puntos_ranking > (SELECT AVG(puntos_ranking) FROM jugadores) 
ORDER BY puntos_ranking DESC;

-- 5. Clanes que no tienen ningún jugador registrado (Casos límite con LEFT JOIN)
SELECT c.nombre AS clan_sin_miembros, c.region 
FROM clanes c 
LEFT JOIN jugadores j ON c.id = j.id_clan 
WHERE j.id IS NULL;