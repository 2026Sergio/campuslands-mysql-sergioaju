-- Consultas base. Completa o reemplaza segun el enunciado.
USE campuslands_mysql;

SELECT
    j.nombre AS jugador,
    j.nickname,
    e.nombre AS equipo
FROM jugadores AS j
INNER JOIN equipos AS e
ON j.equipo_id = e.id;


SELECT
    j.nombre AS jugador,
    e.nombre AS equipo,
    e.estado
FROM jugadores AS j
INNER JOIN equipos AS e
ON j.equipo_id = e.id
WHERE e.estado = 'Activo';

SELECT
    j.nombre AS jugador,
    e.nombre AS equipo,
    j.puntaje
FROM jugadores AS j
INNER JOIN equipos AS e
ON j.equipo_id = e.id
ORDER BY j.puntaje DESC
LIMIT 5;

SELECT
    j.nombre AS jugador,
    e.nombre AS equipo,
    j.puntaje
FROM jugadores AS j
INNER JOIN equipos AS e
ON j.equipo_id = e.id
ORDER BY j.puntaje DESC
LIMIT 5;

SELECT
    e.nombre AS equipo,
    COUNT(j.id) AS total_jugadores
FROM equipos AS e
INNER JOIN jugadores AS j
ON e.id = j.equipo_id
GROUP BY e.id, e.nombre
ORDER BY total_jugadores DESC;