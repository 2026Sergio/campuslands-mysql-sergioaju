-- basico/ejercicio-008 - maria-montepeque
USE campuslands_mysql;

-- 1. Estado final de todos los jugadores tras los UPDATE
SELECT
    nombre,
    equipo,
    goles,
    tarjetas_amarillas,
    tarjetas_rojas,
    estado
FROM jugadores_futbol_sala
ORDER BY goles DESC;

-- 2. Goleadores de la jornada (al menos un gol)
SELECT
    nombre,
    equipo,
    goles
FROM jugadores_futbol_sala
WHERE goles > 0
ORDER BY goles DESC;

-- 3. Jugadores suspendidos (afectados por la actualizacion de tarjeta roja)
SELECT
    nombre,
    equipo,
    tarjetas_rojas,
    estado
FROM jugadores_futbol_sala
WHERE estado = 'suspendido';

-- 4. Jugadores disponibles para la proxima jornada
SELECT
    nombre,
    equipo,
    posicion
FROM jugadores_futbol_sala
WHERE estado = 'activo'
ORDER BY equipo, nombre;

-- 5. Total de goles y tarjetas por equipo
SELECT
    equipo,
    SUM(goles) AS goles_totales,
    SUM(tarjetas_amarillas) AS amarillas_totales,
    SUM(tarjetas_rojas) AS rojas_totales
FROM jugadores_futbol_sala
GROUP BY equipo;

-- 6. Conteo de jugadores por estado tras los eventos de la jornada
SELECT
    estado,
    COUNT(*) AS total_jugadores
FROM jugadores_futbol_sala
GROUP BY estado
ORDER BY total_jugadores DESC;
