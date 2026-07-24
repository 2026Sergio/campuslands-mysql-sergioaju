SELECT
p.nombre,
COUNT(m.id_moto) AS total_motos
FROM propietarios p
INNER JOIN motos m
ON p.id_propietario = m.id_propietario
GROUP BY p.id_propietario, p.nombre
HAVING COUNT(m.id_moto) > 1;

SELECT
m.placa,
m.marca,
COUNT(h.id_historial) AS total_servicios
FROM motos m
INNER JOIN historial_servicios h
ON m.id_moto = h.id_moto
GROUP BY m.id_moto, m.placa, m.marca
HAVING COUNT(h.id_historial) > 2;

SELECT
s.nombre,
SUM(h.cantidad) AS total_realizados
FROM servicios s
INNER JOIN historial_servicios h
ON s.id_servicio = h.id_servicio
GROUP BY s.id_servicio, s.nombre
HAVING SUM(h.cantidad) > 3;

SELECT
p.nombre,
SUM(s.costo * h.cantidad) AS total_pagado
FROM propietarios p
INNER JOIN motos m
ON p.id_propietario = m.id_propietario
INNER JOIN historial_servicios h
ON m.id_moto = h.id_moto
INNER JOIN servicios s
ON h.id_servicio = s.id_servicio
GROUP BY p.id_propietario, p.nombre
HAVING SUM(s.costo * h.cantidad) > 800;