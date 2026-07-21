-- Consultas base. Completa o reemplaza segun el enunciado.
USE campuslands_mysql;

SELECT
    id,
    marca,
    modelo,
    precio
FROM motos;

SELECT
    marca,
    modelo,
    estado
FROM motos
WHERE estado = 'Disponible';

SELECT
    marca,
    modelo,
    precio
FROM motos
ORDER BY precio DESC;

SELECT
    marca,
    modelo,
    cilindrada
FROM motos
WHERE cilindrada >= 350;

SELECT
    AVG(precio) AS precio_promedio
FROM motos;