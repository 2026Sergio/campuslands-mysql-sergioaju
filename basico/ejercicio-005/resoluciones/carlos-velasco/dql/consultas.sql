
USE campuslands_mysql;

SELECT
    id,
    marca,
    modelo,
    placa,
    estado
FROM motos;

SELECT
    marca,
    modelo,
    propietario,
    estado
FROM motos
WHERE estado = 'En servicio';

SELECT
    tipo_servicio,
    mecanico,
    costo,
    fecha_reparacion
FROM reparaciones
ORDER BY costo DESC;

SELECT
    AVG(costo) AS costo_promedio_reparaciones
FROM reparaciones;

SELECT
    mecanico,
    COUNT(*) AS total_reparaciones,
    SUM(costo) AS dinero_generado
FROM reparaciones
GROUP BY mecanico
ORDER BY dinero_generado DESC;

SELECT
    m.marca,
    m.modelo,
    r.tipo_servicio,
    r.costo
FROM reparaciones r
INNER JOIN motos m
    ON r.moto_id = m.id
ORDER BY r.costo DESC
LIMIT 5;