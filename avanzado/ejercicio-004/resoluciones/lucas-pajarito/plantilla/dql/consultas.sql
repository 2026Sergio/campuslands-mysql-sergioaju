-- Consultas base. Completa o reemplaza segun el enunciado.
USE campuslands_mysql;

SELECT * FROM avanzado_ejercicio_004;

SELECT modelo, marca, cilindraje
FROM garaje
WHERE cilindraje > 600;

SELECT *
FROM garaje;

SELECT modelo, marca, precio
FROM garaje
WHERE estado = 'disponible';

SELECT modelo, marca, precio
FROM garaje_motos
ORDER BY precio DESC;

SELECT marca, COUNT(*) AS cantidad_motos
FROM garaje_motos
GROUP BY marca;