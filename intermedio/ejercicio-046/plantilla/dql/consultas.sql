-- Consultas base. Completa o reemplaza segun el enunciado.
USE campuslands_mysql;

SELECT * FROM intermedio_ejercicio_046;

SELECT categoria, COUNT(*) AS total_registros, AVG(puntaje) AS promedio
FROM intermedio_ejercicio_046
GROUP BY categoria
ORDER BY promedio DESC;
