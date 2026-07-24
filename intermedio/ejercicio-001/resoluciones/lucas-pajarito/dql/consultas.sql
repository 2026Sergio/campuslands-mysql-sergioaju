-- Consultas base. Completa o reemplaza segun el enunciado.
USE campuslands_mysql;

SELECT * FROM intermedio_ejercicio_001;

SELECT categoria, COUNT(*) AS total_registros, AVG(puntaje) AS promedio
FROM intermedio_ejercicio_001
GROUP BY categoria
ORDER BY promedio DESC;

SELECT equipo, COUNT(*)
FROM intermedio_ejercicio_001
GROUP BY equipo;
