-- Consultas base. Completa o reemplaza segun el enunciado.
USE campuslands_mysql;

SELECT
    nombre_equipo,
    puntos
FROM equipos_futbol
ORDER BY puntos DESC;

SELECT
    nombre_equipo,
    ciudad
FROM equipos_futbol
ORDER BY nombre_equipo ASC;

SELECT
    nombre_equipo,
    goles_favor
FROM equipos_futbol
ORDER BY goles_favor DESC
LIMIT 5;

SELECT
    nombre_equipo,
    presupuesto
FROM equipos_futbol
ORDER BY presupuesto DESC;

SELECT
    nombre_equipo,
    partidos_jugados,
    partidos_ganados,
    goles_favor,
    puntos
FROM equipos_futbol
ORDER BY
    puntos DESC,
    goles_favor DESC;