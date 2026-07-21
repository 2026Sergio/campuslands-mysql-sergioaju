-- Consultas base. Completa o reemplaza segun el enunciado.
USE campuslands_mysql;

SELECT
    c.nombre AS clan,
    j.nickname AS jugador
FROM clanes AS c
LEFT JOIN jugadores AS j
ON c.id = j.clan_id
ORDER BY c.nombre;

SELECT
    c.nombre AS clan
FROM clanes AS c
LEFT JOIN jugadores AS j
ON c.id = j.clan_id
WHERE j.id IS NULL;

SELECT
    c.nombre AS clan,
    COUNT(j.id) AS total_jugadores
FROM clanes AS c
LEFT JOIN jugadores AS j
ON c.id = j.clan_id
GROUP BY c.id, c.nombre;

SELECT
    c.nombre AS clan,
    AVG(j.puntos) AS promedio_puntos
FROM clanes AS c
LEFT JOIN jugadores AS j
ON c.id = j.clan_id
GROUP BY c.id, c.nombre;

SELECT
    j.nickname AS jugador,
    COALESCE(c.nombre,'Sin clan') AS clan
FROM jugadores AS j
LEFT JOIN clanes AS c
ON j.clan_id = c.id;