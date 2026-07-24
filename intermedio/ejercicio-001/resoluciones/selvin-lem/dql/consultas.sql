USE campuslands_mysql;

-- 1. Jugadores con el nombre de su equipo
SELECT j.nombre_jugador, j.rol, e.nombre_equipo
FROM jugadores_torneo j
INNER JOIN equipos e ON j.id_equipo = e.id_equipo;

-- 2. Promedio de puntaje por equipo
SELECT e.nombre_equipo, COUNT(j.id_jugador) AS total_jugadores, AVG(j.puntaje) AS promedio_puntaje
FROM equipos e
INNER JOIN jugadores_torneo j ON e.id_equipo = j.id_equipo
GROUP BY e.nombre_equipo
ORDER BY promedio_puntaje DESC;

-- 3. Jugadores activos de equipos activos
SELECT j.nombre_jugador, e.nombre_equipo, e.region
FROM jugadores_torneo j
INNER JOIN equipos e ON j.id_equipo = e.id_equipo
WHERE j.estado = 'activo' AND e.estado = 'activo';

-- 4. Top 5 jugadores por puntaje, con su equipo
SELECT j.nombre_jugador, e.nombre_equipo, j.puntaje
FROM jugadores_torneo j
INNER JOIN equipos e ON j.id_equipo = e.id_equipo
ORDER BY j.puntaje DESC
LIMIT 5;

-- 5. Jugadores de equipos retirados (caso limite)
SELECT j.nombre_jugador, j.estado, e.nombre_equipo, e.estado AS estado_equipo
FROM jugadores_torneo j
INNER JOIN equipos e ON j.id_equipo = e.id_equipo
WHERE e.estado = 'retirado';