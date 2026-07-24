-- Consultas base. Completa o reemplaza segun el enunciado.
USE campuslands_mysql;

SELECT * FROM avanzado_ejercicio_005;

SELECT *
FROM ordenes_servicio_motos;

SELECT cliente, motocicleta, servicio
FROM ordenes_servicio_motos
WHERE estado = 'pendiente';

SELECT cliente, servicio, costo
FROM ordenes_servicio_motos
WHERE costo > 500;

SELECT cliente, motocicleta, costo
FROM ordenes_servicio_motos
ORDER BY costo DESC;

SELECT estado, COUNT(*) AS total_ordenes
FROM ordenes_servicio_motos
GROUP BY estado;