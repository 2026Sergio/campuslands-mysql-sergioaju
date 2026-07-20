-- Consultas base. Completa o reemplaza segun el enunciado.
USE campuslands_mysql;

SELECT * FROM funcionalidades_ejercicio_015;

SELECT categoria, COUNT(*) AS total_registros, AVG(puntaje) AS promedio
FROM funcionalidades_ejercicio_015
GROUP BY categoria
ORDER BY promedio DESC;
