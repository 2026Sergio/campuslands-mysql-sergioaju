-- Consultas base. Completa o reemplaza segun el enunciado.
USE campuslands_mysql;

SELECT
    nombre_skin,
    UPPER(nombre_skin) AS nombre_mayusculas
FROM inventario_skins;

SELECT
    nombre_skin,
    precio,
    ROUND(precio * 0.85,2) AS precio_descuento
FROM inventario_skins;

SELECT
    nombre_skin,
    LENGTH(nombre_skin) AS cantidad_caracteres
FROM inventario_skins;

SELECT
    nombre_skin,
    fecha_ingreso,
    DATEDIFF(CURDATE(), fecha_ingreso) AS dias_en_inventario
FROM inventario_skins;

SELECT
    categoria,
    ROUND(AVG(precio),2) AS precio_promedio
FROM inventario_skins
GROUP BY categoria;
