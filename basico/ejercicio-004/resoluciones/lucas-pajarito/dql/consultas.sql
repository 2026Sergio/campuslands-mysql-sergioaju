-- Consultas base. Completa o reemplaza segun el enunciado.
USE campuslands_mysql;

SELECT * FROM basico_ejercicio_004;

SELECT marca, COUNT(*) AS total_registros
FROM basico_ejercicio_004
GROUP BY marca
ORDER BY total_registros DESC;
