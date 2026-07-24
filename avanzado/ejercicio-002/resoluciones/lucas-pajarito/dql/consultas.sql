-- Consultas base. Completa o reemplaza segun el enunciado.
USE campuslands_mysql;

SELECT * FROM avanzado_ejercicio_002;

SELECT categoria, COUNT(*) AS total_registros, AVG(puntaje) AS promedio
FROM avanzado_ejercicio_002
GROUP BY categoria
ORDER BY promedio DESC;

SELECT *
FROM avanzado_ejercicio_002;

SELECT jugador, videojuego, puntaje
FROM avanzado_ejercicio_002
WHERE estado = 'activo';

SELECT jugador, victorias, puntaje
FROM avanzado_ejercicio_002
WHERE victorias > 35;

SELECT jugador, videojuego, puntaje
FROM avanzado_ejercicio_002
WHERE estado = 'activo' AND puntaje > 2500
ORDER BY puntaje DESC;

SELECT videojuego, COUNT(*) AS cantidad_jugadores
FROM ranking_battle_royale
GROUP BY videojuego;