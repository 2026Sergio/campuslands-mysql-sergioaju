SELECT 
    nombre_skin,
    UPPER(rareza) AS rareza_mayusculas,
    LOWER(tipo_arma) AS tipo_arma_minusculas
FROM skins_shooter;

SELECT 
    nombre_skin,
    CONCAT('Skin: ', nombre_skin, ' - Rareza: ', rareza) AS descripcion_skin
FROM skins_shooter;

SELECT 
    nombre_skin,
    precio,
    ROUND(precio * 1.19, 2) AS precio_con_impuesto
FROM skins_shooter;

SELECT 
    s.nombre_skin,
    i.cantidad,
    s.precio,
    ROUND(s.precio * i.cantidad, 2) AS valor_inventario
FROM skins_shooter s
INNER JOIN inventario_skins_shooter i
    ON s.skin_id = i.skin_id;

SELECT 
    nombre_skin,
    precio,
    CASE
        WHEN precio >= 2500 THEN 'Precio alto'
        WHEN precio >= 1000 THEN 'Precio medio'
        ELSE 'Precio bajo'
    END AS categoria_precio
FROM skins_shooter
ORDER BY precio DESC;