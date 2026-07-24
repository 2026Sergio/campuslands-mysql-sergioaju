-- Consultas base. Completa o reemplaza segun el enunciado.
USE campuslands_mysql;

SELECT * FROM intermedio_ejercicio_004;

SELECT *
FROM garaje_motos;

SELECT modelo, marca, precio
FROM garaje_motos
WHERE estado = 'disponible';

SELECT modelo, marca, cilindraje
FROM garaje_motos
WHERE cilindraje > 600;

SELECT modelo, marca, precio
FROM garaje_motos
ORDER BY precio DESC;

SELECT modelo, marca, precio
FROM garaje_motos
ORDER BY precio DESC
LIMIT 5;