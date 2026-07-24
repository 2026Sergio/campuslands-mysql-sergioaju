USE db_shooter_skins_funcs;

-- 1. Utilizar la función personalizada para mostrar el precio de las skins con un 15% de descuento aplicado
SELECT 
    nombre, 
    arma, 
    rareza, 
    precio AS precio_original, 
    fn_calcular_descuento(precio, 15) AS precio_con_descuento_15pct 
FROM skins 
ORDER BY precio DESC;

-- 2. Total de skins agrupadas por nivel de rareza
SELECT rareza, COUNT(*) AS total_skins 
FROM skins 
GROUP BY rareza 
ORDER BY total_skins DESC;

-- 3. Precio promedio, máximo y total agrupados por tipo de arma
SELECT 
    arma, 
    COUNT(*) AS cantidad_skins, 
    ROUND(AVG(precio), 2) AS precio_promedio, 
    MAX(precio) AS precio_maximo 
FROM skins 
GROUP BY arma 
ORDER BY precio_promedio DESC;

-- 4. Valor total del inventario agrupado por su estado actual
SELECT 
    estado, 
    COUNT(*) AS total_skins, 
    ROUND(SUM(precio), 2) AS valor_total_inventario 
FROM skins 
GROUP BY estado 
ORDER BY valor_total_inventario DESC;

-- 5. Filtrar rarezas cuyo precio promedio supere los 50 dólares utilizando HAVING
SELECT 
    rareza, 
    ROUND(AVG(precio), 2) AS promedio_precio 
FROM skins 
GROUP BY rareza 
HAVING AVG(precio) > 50.00 
ORDER BY promedio_precio DESC;