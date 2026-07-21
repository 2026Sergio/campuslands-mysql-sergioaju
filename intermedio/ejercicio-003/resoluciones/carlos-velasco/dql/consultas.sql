-- Consultas base. Completa o reemplaza segun el enunciado.
USE campuslands_mysql;

SELECT
    categoria,
    COUNT(*) AS total_skins
FROM inventario_skins
GROUP BY categoria;

SELECT
    rareza,
    AVG(precio) AS precio_promedio
FROM inventario_skins
GROUP BY rareza
ORDER BY precio_promedio DESC;

SELECT
    categoria,
    MAX(precio) AS precio_maximo
FROM inventario_skins
GROUP BY categoria;

SELECT
    categoria,
    MAX(precio) AS precio_maximo
FROM inventario_skins
GROUP BY categoria;

SELECT
    rareza,
    COUNT(*) AS disponibles
FROM inventario_skins
WHERE disponible = TRUE
GROUP BY rareza;

SELECT
    categoria,
    SUM(precio) AS valor_total
FROM inventario_skins
GROUP BY categoria
ORDER BY valor_total DESC;