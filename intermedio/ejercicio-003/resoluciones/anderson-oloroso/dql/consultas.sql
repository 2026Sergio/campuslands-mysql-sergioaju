SELECT 
    s.rareza,
    COUNT(s.skin_id) AS cantidad_skins,
    SUM(i.cantidad) AS unidades_totales
FROM skins_shooter s
INNER JOIN inventario_skins_shooter i
    ON s.skin_id = i.skin_id
GROUP BY s.rareza
ORDER BY cantidad_skins DESC;

SELECT 
    s.tipo_arma,
    COUNT(s.skin_id) AS cantidad_skins,
    SUM(i.cantidad) AS unidades_totales
FROM skins_shooter s
INNER JOIN inventario_skins_shooter i
    ON s.skin_id = i.skin_id
GROUP BY s.tipo_arma
ORDER BY unidades_totales DESC;

SELECT 
    s.estado,
    COUNT(s.skin_id) AS cantidad_skins,
    SUM(i.cantidad) AS unidades_totales
FROM skins_shooter s
INNER JOIN inventario_skins_shooter i
    ON s.skin_id = i.skin_id
GROUP BY s.estado
ORDER BY cantidad_skins DESC;

SELECT 
    s.rareza,
    AVG(s.precio) AS precio_promedio
FROM skins_shooter s
GROUP BY s.rareza
ORDER BY precio_promedio DESC;

SELECT 
    s.tipo_arma,
    SUM(s.precio * i.cantidad) AS valor_total_inventario
FROM skins_shooter s
INNER JOIN inventario_skins_shooter i
    ON s.skin_id = i.skin_id
GROUP BY s.tipo_arma
ORDER BY valor_total_inventario DESC;