-- consultas con group by para reportes del inventario
USE campuslands_mysql;

-- 1. cantidad total de skins y precio promedio por cada tipo de arma
SELECT 
    tipo_arma,
    COUNT(*) AS total_skins,
    AVG(precio) AS precio_promedio
FROM skins
GROUP BY tipo_arma
ORDER BY total_skins DESC;

-- 2. total de skins y suma del valor total agrupado por rareza
SELECT 
    rareza,
    COUNT(*) AS cantidad,
    SUM(precio) AS valor_total
FROM skins
GROUP BY rareza
ORDER BY valor_total DESC;

-- 3. precio maximo y minimo de skins disponibles por tipo de arma
SELECT 
    tipo_arma,
    MAX(precio) AS precio_maximo,
    MIN(precio) AS precio_minimo
FROM skins
WHERE estado = 'disponible'
GROUP BY tipo_arma;

-- 4. cantidad de skins agrupadas por estado comercial
SELECT 
    estado,
    COUNT(*) AS total_por_estado
FROM skins
GROUP BY estado;

-- 5. tipos de armas que tienen un precio promedio mayor a 20.00 (usando teniendo/having)
SELECT 
    tipo_arma,
    COUNT(*) AS cantidad_skins,
    AVG(precio) AS precio_promedio
FROM skins
GROUP BY tipo_arma
HAVING AVG(precio) > 20.00;