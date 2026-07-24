-- Consultas base. Completa o reemplaza segun el enunciado.
USE campuslands_mysql;

SELECT * FROM intermedio_ejercicio_005;

SELECT *
FROM taller_mecanico_motos;

SELECT cliente, motocicleta, servicio
FROM taller_mecanico_motos
WHERE estado = 'pendiente';

SELECT cliente, servicio, costo
FROM taller_mecanico_motos
WHERE costo > 700;

SELECT cliente, servicio, costo
FROM taller_mecanico_motos
WHERE costo > 700;

SELECT cliente, motocicleta, costo
FROM taller_mecanico_motos
ORDER BY costo DESC;

SELECT cliente, motocicleta, servicio, costo
FROM taller_mecanico_motos
ORDER BY costo DESC
LIMIT 5;

