USE campuslands_mysql;


-- Buscar una moto por placa utilizando indice
SELECT
    placa,
    marca,
    modelo,
    propietario
FROM motos
WHERE placa = 'ABC123';



-- Servicios pendientes o en proceso
SELECT
    o.id_orden,
    m.placa,
    m.modelo,
    o.servicio,
    o.estado
FROM ordenes_servicio AS o
INNER JOIN motos AS m
ON o.id_moto = m.id_moto
WHERE o.estado IN ('pendiente','en_proceso')
ORDER BY o.fecha_ingreso;



-- Total de servicios realizados por mecanico
SELECT
    mecanico,
    COUNT(*) AS total_servicios,
    SUM(costo) AS ingresos_generados
FROM ordenes_servicio
GROUP BY mecanico
ORDER BY ingresos_generados DESC;



-- Motos con cilindrada mayor a 300
SELECT
    placa,
    marca,
    modelo,
    cilindrada
FROM motos
WHERE cilindrada > 300
ORDER BY cilindrada DESC;



-- Ranking de servicios mas costosos
SELECT
    servicio,
    costo,
    estado
FROM ordenes_servicio
ORDER BY costo DESC
LIMIT 5;



-- Verificar indices creados
SHOW INDEX FROM motos;

SHOW INDEX FROM ordenes_servicio;