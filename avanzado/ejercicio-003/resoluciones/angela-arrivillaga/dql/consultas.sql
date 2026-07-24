-- campuslands mysql - avanzado ejercicio 003
-- dql/consultas.sql

USE campuslands_mysql;

-- 1. Calcular el precio con descuento segun rareza (10% Legendaria, 15% Epica)
-- y clasificar la gama de precio (Economica, Estandar, Premium)
SELECT 
    nombre,
    arma,
    rareza,
    precio AS precio_original,
    CASE 
        WHEN rareza = 'Legendaria' THEN ROUND(precio * 0.90, 2)
        WHEN rareza = 'Epica' THEN ROUND(precio * 0.85, 2)
        ELSE precio
    END AS precio_con_descuento,
    CASE 
        WHEN precio < 15.00 THEN 'Economica'
        WHEN precio BETWEEN 15.00 AND 35.00 THEN 'Estandar'
        ELSE 'Premium'
    END AS categoria_precio
FROM skins
WHERE estado = 'disponible'
ORDER BY precio DESC;

-- 2. Resumen de precios e inventario por rareza
SELECT 
    rareza,
    COUNT(*) AS total_skins,
    AVG(precio) AS promedio_precio,
    MIN(precio) AS precio_minimo,
    MAX(precio) AS precio_maximo
FROM skins
WHERE estado = 'disponible'
GROUP BY rareza
ORDER BY promedio_precio DESC;

-- 3. Filtrar directamente las skins de categoria Premium (precio mayor a 35.00)
SELECT 
    nombre,
    arma,
    precio,
    'Premium' AS tipo_categoria
FROM skins
WHERE precio > 35.00 AND estado = 'disponible';

-- 4. Conteo de skins por tipo de arma
SELECT 
    arma,
    COUNT(*) AS cantidad_skins
FROM skins
GROUP BY arma
ORDER BY cantidad_skins DESC;

-- 5. Totales e inventario segun el estado
SELECT 
    estado,
    COUNT(*) AS cantidad,
    SUM(precio) AS valor_total
FROM skins
GROUP BY estado;