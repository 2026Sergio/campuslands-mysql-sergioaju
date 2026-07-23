SELECT *
FROM motos;

SELECT
    m.placa,
    m.modelo,
    p.nombre AS propietario
FROM motos m
INNER JOIN propietarios p
ON m.id_propietario = p.id_propietario;

SELECT
    m.modelo,
    ma.nombre AS marca
FROM motos m
INNER JOIN marcas ma
ON m.id_marca = ma.id_marca;

SELECT
    mo.placa,
    mt.tipo_servicio,
    mt.fecha,
    mt.costo
FROM mantenimientos mt
INNER JOIN motos mo
ON mt.id_moto = mo.id_moto;

SELECT
tipo_servicio,
costo
FROM mantenimientos
ORDER BY costo DESC
LIMIT 1;

SELECT
AVG(costo) AS costo_promedio
FROM mantenimientos;

SELECT
modelo,
cilindraje
FROM motos
WHERE cilindraje>300
ORDER BY  cilindraje DESC;