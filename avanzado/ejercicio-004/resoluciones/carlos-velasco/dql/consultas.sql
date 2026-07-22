-- Consultas base. Completa o reemplaza segun el enunciado.
USE campuslands_mysql;

SELECT
    id,
    marca,
    modelo,
    estado
FROM motos;

SELECT
    id,
    moto_id,
    descripcion,
    fecha_registro
FROM historial_ingresos;

SELECT
    estado,
    COUNT(*) AS total
FROM motos
GROUP BY estado;

SELECT
    AVG(precio) AS precio_promedio
FROM motos;


SELECT
    marca,
    modelo,
    precio
FROM motos
ORDER BY precio DESC;
