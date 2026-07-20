-- Consultas base. Completa o reemplaza segun el enunciado.
USE campuslands_mysql;

SELECT * FROM basico_ejercicio_058;

SELECT categoria, COUNT(*) AS total_registros, AVG(puntaje) AS promedio
FROM basico_ejercicio_058
GROUP BY categoria
ORDER BY promedio DESC;
