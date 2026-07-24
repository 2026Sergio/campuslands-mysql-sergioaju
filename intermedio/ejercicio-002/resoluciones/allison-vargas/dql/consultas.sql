-- DQL: Consultas utilizando LEFT JOIN
USE campuslands_mysql;

-- 1. Listar TODOS los jugadores con el nombre de su clan (o "Sin Clan" si no tienen)
SELECT 
    j.nickname,
    j.puntos_ranking,
    COALESCE(c.nombre_clan, 'Sin Clan') AS clan,
    COALESCE(c.region, 'N/A') AS region_clan
FROM jugadores j
LEFT JOIN clanes c ON j.clan_id = c.clan_id
ORDER BY j.puntos_ranking DESC;

-- 2. Identificar únicamente a los jugadores "Solitarios" (Sin Clan asignado)
SELECT 
    j.nickname,
    j.puntos_ranking,
    j.estado
FROM jugadores j
LEFT JOIN clanes c ON j.clan_id = c.clan_id
WHERE c.clan_id IS NULL;

-- 3. Resumen por Clan: Total de jugadores y puntos acumulados (incluye clanes sin miembros)
SELECT 
    c.nombre_clan,
    c.region,
    COUNT(j.jugador_id) AS total_integrantes,
    COALESCE(SUM(j.puntos_ranking), 0) AS puntos_totales_clan
FROM clanes c
LEFT JOIN jugadores j ON c.clan_id = j.clan_id
GROUP BY c.clan_id, c.nombre_clan, c.region
ORDER BY puntos_totales_clan DESC;

-- 4. Promedio de puntos de jugadores por región de Clan
SELECT 
    c.region,
    COUNT(j.jugador_id) AS total_jugadores,
    ROUND(AVG(j.puntos_ranking), 2) AS promedio_puntos
FROM clanes c
LEFT JOIN jugadores j ON c.clan_id = j.clan_id
WHERE j.estado = 'activo'
GROUP BY c.region
ORDER BY promedio_puntos DESC;

-- 5. Clanes que actualmente no tienen miembros registrados
SELECT 
    c.nombre_clan,
    c.region,
    c.nivel_clan,
    c.fecha_creacion
FROM clanes c
LEFT JOIN jugadores j ON c.clan_id = j.clan_id
WHERE j.jugador_id IS NULL;
