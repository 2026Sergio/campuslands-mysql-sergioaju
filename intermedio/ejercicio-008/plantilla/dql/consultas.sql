-- Consultas base. Completa o reemplaza segun el enunciado.
USE campuslands_mysql;

SELECT * FROM intermedio_ejercicio_008;

SELECT categoria, COUNT(*) AS total_registros, AVG(puntaje) AS promedio
FROM intermedio_ejercicio_008
GROUP BY categoria
ORDER BY promedio DESC;
