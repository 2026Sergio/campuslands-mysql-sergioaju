-- DQL: 5 Consultas analíticas utilizando GROUP BY y HAVING
USE campuslands_mysql;

-- 1. Total de skins, stock acumulado y precio promedio por Categoría de Arma
SELECT 
    categoria_arma,
    COUNT(*) AS variedad_skins,
    SUM(stock_disponible) AS stock_total,
    ROUND(AVG(precio_mercado), 2) AS precio_promedio
FROM inventario_skins_intermedio
WHERE estado = 'en_venta'
GROUP BY categoria_arma
ORDER BY stock_total DESC;

-- 2. Valorización total del inventario agrupado por Rareza
SELECT 
    rareza,
    COUNT(*) AS total_modelos,
    SUM(precio_mercado * stock_disponible) AS valor_inventario_usd
FROM inventario_skins_intermedio
GROUP BY rareza
ORDER BY valor_inventario_usd DESC;

-- 3. Categorías de armas con un precio promedio mayor a $100 USD (Uso de HAVING)
SELECT 
    categoria_arma,
    ROUND(AVG(precio_mercado), 2) AS precio_promedio,
    MAX(precio_mercado) AS precio_maximo
FROM inventario_skins_intermedio
GROUP BY categoria_arma
HAVING precio_promedio > 100.00
ORDER BY precio_promedio DESC;

-- 4. Conteo de skins por Estado de Disponibilidad
SELECT 
    estado,
    COUNT(*) AS cantidad_skins,
    SUM(stock_disponible) AS unidades_totales
FROM inventario_skins_intermedio
GROUP BY estado;

-- 5. Comparativa de Precios Mínimos y Máximos agrupados por Rareza y Categoría
SELECT 
    rareza,
    categoria_arma,
    MIN(precio_mercado) AS precio_minimo,
    MAX(precio_mercado) AS precio_maximo
FROM inventario_skins_intermedio
GROUP BY rareza, categoria_arma
ORDER BY rareza ASC;
