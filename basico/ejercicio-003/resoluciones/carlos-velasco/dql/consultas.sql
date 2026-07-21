-- Consultas base. Completa o reemplaza segun el enunciado.
USE campuslands_mysql;

SELECT
    id,
    nombre_skin,
    arma,
    precio
FROM inventario_skins;

SELECT
    nombre_skin,
    rareza,
    precio
FROM inventario_skins
ORDER BY precio DESC;

SELECT
    nombre_skin,
    rareza,
    precio
FROM inventario_skins
ORDER BY precio DESC;

SELECT
    AVG(precio) AS precio_promedio
FROM inventario_skins;

SELECT
    nombre_skin,
    arma
FROM inventario_skins
WHERE disponible = TRUE;