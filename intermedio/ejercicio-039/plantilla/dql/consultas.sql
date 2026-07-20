-- Consultas base. Completa o reemplaza segun el enunciado.
USE campuslands_mysql;

SELECT * FROM intermedio_ejercicio_039;

SELECT categoria, COUNT(*) AS total_registros, AVG(puntaje) AS promedio
FROM intermedio_ejercicio_039
GROUP BY categoria
ORDER BY promedio DESC;
