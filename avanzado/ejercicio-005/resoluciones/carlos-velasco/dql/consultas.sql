-- Consultas base. Completa o reemplaza segun el enunciado.
USE campuslands_mysql;

SHOW INDEX FROM motos;

SHOW INDEX FROM ordenes_servicio;

SELECT
    marca,
    modelo,
    propietario,
    estado
FROM motos
WHERE marca = 'Yamaha';

SELECT
    id,
    tipo_servicio,
    mecanico,
    fecha_ingreso,
    estado
FROM ordenes_servicio
WHERE estado = 'Pendiente'
ORDER BY fecha_ingreso ASC;

SELECT
    mecanico,
    COUNT(*) AS total_servicios,
    SUM(costo) AS total_facturado
FROM ordenes_servicio
GROUP BY mecanico
ORDER BY total_facturado DESC;


EXPLAIN
SELECT
    id,
    tipo_servicio,
    costo,
    estado
FROM ordenes_servicio
WHERE estado = 'Entregado';

SELECT
    m.marca,
    m.modelo,
    o.tipo_servicio,
    o.costo,
    o.fecha_ingreso
FROM motos m
INNER JOIN ordenes_servicio o
    ON m.id = o.moto_id
WHERE m.placa = 'MOT001';