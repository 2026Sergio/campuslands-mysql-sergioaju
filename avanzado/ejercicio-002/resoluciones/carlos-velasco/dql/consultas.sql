-- Consultas base. Completa o reemplaza segun el enunciado.
USE campuslands_mysql;

SELECT
    j.nickname AS jugador,
    c.nombre AS clan
FROM jugadores j
LEFT JOIN clanes c
ON j.clan_id = c.id;

SELECT
    c.nombre AS clan,
    COUNT(j.id) AS total_jugadores
FROM clanes c
LEFT JOIN jugadores j
ON c.id = j.clan_id
GROUP BY c.id,c.nombre;

SELECT
    c.nombre AS clan,
    AVG(j.puntos) AS promedio_puntos
FROM clanes c
LEFT JOIN jugadores j
ON c.id = j.clan_id
GROUP BY c.id,c.nombre;

SELECT
    nickname,
    puntos
FROM jugadores
ORDER BY puntos DESC
LIMIT 5;

SELECT
    nombre,
    region
FROM clanes
WHERE estado='Activo';

-- Ejemplo de uso del procedimiento almacenado
CALL registrar_jugador(
    'Carlos Méndez',
    'GhostKing',
    88,
    6400.50,
    2
);

