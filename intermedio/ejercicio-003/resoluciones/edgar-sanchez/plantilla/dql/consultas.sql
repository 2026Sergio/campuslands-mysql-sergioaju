
SELECT 
    arma_tipo,
    rareza,
    COUNT(skin_id) AS cantidad_modelos,
    ROUND(AVG(precio_mercado), 2) AS precio_promedio
FROM skins
WHERE es_stattrak = TRUE
GROUP BY arma_tipo, rareza;

SELECT 
    c.nombre_coleccion,
    c.estado,
    COUNT(s.skin_id) AS total_skins,
    SUM(s.stock_disponible) AS stock_total,
    ROUND(AVG(s.precio_mercado), 2) AS precio_promedio_coleccion,
    MAX(s.precio_mercado) AS skin_mas_costosa
FROM colecciones c
INNER JOIN skins s ON c.coleccion_id = s.coleccion_id
GROUP BY c.coleccion_id, c.nombre_coleccion, c.estado
HAVING stock_total > 100 AND precio_promedio_coleccion > 1000.00;

UPDATE skins
SET precio_mercado = ROUND(precio_mercado * 1.10, 2)
WHERE coleccion_id IN (
    SELECT coleccion_id 
    FROM skins 
    GROUP BY coleccion_id 
    HAVING AVG(precio_mercado) > 5000.00
);

DELETE FROM colecciones
WHERE coleccion_id IN (
    SELECT c.coleccion_id 
    FROM (SELECT * FROM colecciones) AS c
    LEFT JOIN skins s ON c.coleccion_id = s.coleccion_id
    GROUP BY c.coleccion_id
    HAVING COUNT(s.skin_id) < 5 AND SUM(COALESCE(s.stock_disponible, 0)) = 0
);

SELECT 
    c.nombre_coleccion,
    COUNT(s.skin_id) AS variaciones_skin,
    SUM(s.stock_disponible) AS total_unidades,
    SUM(s.stock_disponible * s.precio_mercado) AS valor_monetario_inventario
FROM colecciones c
INNER JOIN skins s ON c.coleccion_id = s.coleccion_id
GROUP BY c.coleccion_id, c.nombre_coleccion
ORDER BY valor_monetario_inventario DESC
LIMIT 5;