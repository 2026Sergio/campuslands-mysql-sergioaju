USE db_battle_royale;

SELECT c.nombre AS clan, c.region, j.alias AS jugador, j.puntos_ranking 
FROM clanes c 
LEFT JOIN jugadores j ON c.id = j.id_clan 
ORDER BY c.nombre;

SELECT j.alias, j.eliminaciones, j.puntos_ranking, COALESCE(c.nombre, 'Sin Clan') AS clan 
FROM jugadores j 
LEFT JOIN clanes c ON j.id_clan = c.id 
ORDER BY j.puntos_ranking DESC;

SELECT c.nombre AS clan_sin_miembros, c.region 
FROM clanes c 
LEFT JOIN jugadores j ON c.id = j.id_clan 
WHERE j.id IS NULL;

SELECT c.nombre AS clan, COUNT(j.id) AS total_miembros, ROUND(AVG(j.puntos_ranking), 2) AS promedio_puntos 
FROM clanes c 
LEFT JOIN jugadores j ON c.id = j.id_clan 
GROUP BY c.id, c.nombre 
ORDER BY promedio_puntos DESC;
SELECT alias, eliminaciones, puntos_ranking 
FROM jugadores 
ORDER BY eliminaciones DESC 
LIMIT 3;