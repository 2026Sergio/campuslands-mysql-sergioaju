USE campuslands_mysql;

-- 1. Mostrar todos los jugadores junto con el equipo al que pertenecen.

SELECT
    j.nickname,
    j.rol,
    e.nombre AS equipo
FROM jugadores AS j
INNER JOIN equipos AS e
ON j.id_equipo = e.id_equipo;

-- 2. Mostrar el nombre real del jugador, su equipo y la región.

SELECT
    j.nombre_real,
    j.nickname,
    e.nombre AS equipo,
    e.region
FROM jugadores AS j
INNER JOIN equipos AS e
ON j.id_equipo = e.id_equipo;

-- 3. Mostrar únicamente los jugadores con estado Activo.

SELECT
    j.nickname,
    e.nombre AS equipo,
    j.estado
FROM jugadores AS j
INNER JOIN equipos AS e
ON j.id_equipo = e.id_equipo
WHERE j.estado = 'Activo';

-- 4. Mostrar la cantidad de jugadores registrados por equipo.

SELECT
    e.nombre AS equipo,
    COUNT(j.id_jugador) AS total_jugadores
FROM equipos AS e
INNER JOIN jugadores AS j
ON e.id_equipo = j.id_equipo
GROUP BY e.nombre;

-- 5. Mostrar el puntaje promedio obtenido por cada equipo.

SELECT
    e.nombre AS equipo,
    AVG(j.puntaje) AS promedio_puntaje
FROM equipos AS e
INNER JOIN jugadores AS j
ON e.id_equipo = j.id_equipo
GROUP BY e.nombre
ORDER BY promedio_puntaje DESC;

-- 6. Mostrar el Top 5 de jugadores con mayor puntaje.

SELECT
    j.nickname,
    e.nombre AS equipo,
    j.puntaje
FROM jugadores AS j
INNER JOIN equipos AS e
ON j.id_equipo = e.id_equipo
ORDER BY j.puntaje DESC
LIMIT 5;

-- 7. Mostrar la cantidad de jugadores por región.

SELECT
    e.region,
    COUNT(j.id_jugador) AS total_jugadores
FROM equipos AS e
INNER JOIN jugadores AS j
ON e.id_equipo = j.id_equipo
GROUP BY e.region;

-- 8. Mostrar los jugadores suspendidos junto con su equipo.

SELECT
    j.nickname,
    e.nombre AS equipo,
    j.estado
FROM jugadores AS j
INNER JOIN equipos AS e
ON j.id_equipo = e.id_equipo
WHERE j.estado = 'Suspendido';