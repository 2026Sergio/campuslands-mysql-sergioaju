-- Consultas base. Completa o reemplaza segun el enunciado.
USE campuslands_mysql;

SELECT * FROM avanzado_ejercicio_001;

SELECT *
FROM avanzado_ejercicio_001
WHERE puntaje > 900;

SELECT equipo, juego, puntaje
FROM avanzado_ejercicio_001
WHERE estado = 'clasificado';

SELECT equipo, juego, puntaje
FROM    avanzado_ejercicio_001
WHERE estado = 'clasificado';

SELECT equipo, juego, puntaje
FROM avanzado_ejercicio_001
ORDER BY puntaje DESC;

SELECT equipo, juego, puntaje
FROM avanzado_ejercicio_001
ORDER BY puntaje DESC
LIMIT 5;

