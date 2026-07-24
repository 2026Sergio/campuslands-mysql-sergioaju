-- consultas para responder preguntas del torneo
USE campuslands_mysql;

-- 1. obtener todos los jugadores con el nombre de su equipo
SELECT 
    j.nickname,
    j.rol,
    j.puntos,
    e.nombre AS equipo
FROM jugadores j
INNER JOIN equipos e ON j.equipo_id = e.id;

-- 2. jugadores con mas de 1500 puntos y su region
SELECT 
    j.nickname,
    j.puntos,
    e.nombre AS equipo,
    e.region
FROM jugadores j
INNER JOIN equipos e ON j.equipo_id = e.id
WHERE j.puntos > 1500;

-- 3. total de puntos acumulados por equipo
SELECT 
    e.nombre AS equipo,
    COUNT(j.id) AS total_jugadores,
    SUM(j.puntos) AS puntos_totales
FROM jugadores j
INNER JOIN equipos e ON j.equipo_id = e.id
GROUP BY e.id, e.nombre;

-- 4. promedio de puntos de los jugadores por region
SELECT 
    e.region,
    AVG(j.puntos) AS promedio_puntos
FROM jugadores j
INNER JOIN equipos e ON j.equipo_id = e.id
GROUP BY e.region;

-- 5. top 3 jugadores con mayor puntaje y su estado de equipo
SELECT 
    j.nickname,
    j.rol,
    j.puntos,
    e.nombre AS equipo,
    e.estado AS estado_equipo
FROM jugadores j
INNER JOIN equipos e ON j.equipo_id = e.id
ORDER BY j.puntos DESC
LIMIT 3;