USE campuslands_mysql;

-- 1. Agrupar por rareza de skin para calcular el total de elementos, el valor acumulado y el promedio de mercado
SELECT 
    rareza,
    COUNT(*) AS total_skins,
    SUM(precio_mercado) AS valor_total_mercado,
    ROUND(AVG(precio_mercado), 2) AS precio_promedio
FROM skins_shooter_groupby
GROUP BY rareza
ORDER BY valor_total_mercado DESC;

-- 2. Agrupar por estado actual en el inventario para analizar la distribución logística y financiera
SELECT 
    estado_inventario,
    COUNT(*) AS cantidad_skins,
    SUM(precio_mercado) AS capital_acumulado,
    ROUND(AVG(precio_mercado), 2) AS precio_medio_estado
FROM skins_shooter_groupby
GROUP BY estado_inventario
ORDER BY cantidad_skins DESC;

-- 3. Agrupar por arma asociada para identificar qué armas concentran mayor cantidad de skins y valor
SELECT 
    arma_asociada,
    COUNT(*) AS total_skins_arma,
    MAX(precio_mercado) AS skin_mas_cara,
    MIN(precio_mercado) AS skin_mas_barata,
    SUM(precio_mercado) AS valor_total_arma
FROM skins_shooter_groupby
GROUP BY arma_asociada
ORDER BY valor_total_arma DESC;

-- 4. Agrupación compuesta por rareza y desgaste utilizando filtros HAVING para mostrar solo categorías con valor acumulado mayor a 100
SELECT 
    rareza,
    desgaste,
    COUNT(*) AS cantidad,
    SUM(precio_mercado) AS valor_acumulado
FROM skins_shooter_groupby
GROUP BY rareza, desgaste
HAVING SUM(precio_mercado) > 100.00
ORDER BY valor_acumulado DESC;

-- 5. Agrupar por estado de inventario filtrando previamente solo las skins con valor superior a 100.00 (WHERE + GROUP BY)
SELECT 
    estado_inventario,
    COUNT(*) AS skins_valiosas_count,
    ROUND(AVG(precio_mercado), 2) AS promedio_precio_valiosas
FROM skins_shooter_groupby
WHERE precio_mercado > 100.00
GROUP BY estado_inventario
ORDER BY promedio_precio_valiosas DESC;