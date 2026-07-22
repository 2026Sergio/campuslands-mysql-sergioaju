-- intermedio/ejercicio-008 - maria-montepeque
USE campuslands_mysql;

-- 1. Jugadores con el nombre y la ciudad de su equipo (JOIN, sin datos duplicados en jugadores)
SELECT
    j.nombre AS jugador,
    e.nombre AS equipo,
    e.ciudad
FROM jugadores_futbol_sala AS j
JOIN equipos_futbol_sala AS e ON e.id = j.equipo_id
ORDER BY e.nombre, j.nombre;

-- 2. Todos los jugadores de un mismo equipo comparten la misma ciudad (prueba de consistencia
--    que la 3FN garantiza: la ciudad se guarda una sola vez, en equipos_futbol_sala)
SELECT
    e.nombre AS equipo,
    e.ciudad,
    COUNT(DISTINCT e.ciudad) AS ciudades_distintas_en_el_equipo
FROM jugadores_futbol_sala AS j
JOIN equipos_futbol_sala AS e ON e.id = j.equipo_id
GROUP BY e.nombre, e.ciudad;

-- 3. Goles totales por equipo
SELECT
    e.nombre AS equipo,
    SUM(j.goles) AS goles_totales
FROM equipos_futbol_sala AS e
JOIN jugadores_futbol_sala AS j ON j.equipo_id = e.id
GROUP BY e.nombre
ORDER BY goles_totales DESC;

-- 4. Equipos con mas de 2 jugadores activos
SELECT
    e.nombre AS equipo,
    COUNT(*) AS jugadores_activos
FROM equipos_futbol_sala AS e
JOIN jugadores_futbol_sala AS j ON j.equipo_id = e.id
WHERE j.estado = 'activo'
GROUP BY e.nombre
HAVING COUNT(*) > 2;

-- 5. Maximo goleador de cada equipo
SELECT
    e.nombre AS equipo,
    j.nombre AS jugador,
    j.goles
FROM jugadores_futbol_sala AS j
JOIN equipos_futbol_sala AS e ON e.id = j.equipo_id
WHERE j.goles = (
    SELECT MAX(j2.goles)
    FROM jugadores_futbol_sala AS j2
    WHERE j2.equipo_id = j.equipo_id
)
ORDER BY j.goles DESC;

-- 6. Jugadores suspendidos, con su equipo y ciudad
SELECT
    j.nombre AS jugador,
    e.nombre AS equipo,
    e.ciudad,
    j.tarjetas_amarillas
FROM jugadores_futbol_sala AS j
JOIN equipos_futbol_sala AS e ON e.id = j.equipo_id
WHERE j.estado = 'suspendido';
