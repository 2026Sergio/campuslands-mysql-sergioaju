-- Consultas base. Completa o reemplaza segun el enunciado.
USE campuslands_mysql;

SELECT * FROM intermedio_ejercicio_002;

SELECT *
FROM ranking_battle_royale;

SELECT jugador, juego, puntaje
FROM ranking_battle_royale
WHERE estado = 'activo';

SELECT jugador, juego, victorias
FROM ranking_battle_royale
WHERE victorias > 25;

SELECT jugador, juego, puntaje
FROM ranking_battle_royale
ORDER BY puntaje DESC;

SELECT jugador, juego, puntaje
FROM ranking_battle_royale
ORDER BY puntaje DESC
LIMIT 5;