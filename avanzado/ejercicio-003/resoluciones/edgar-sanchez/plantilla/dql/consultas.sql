DELIMITER //

CREATE FUNCTION calcular_valor_inventario_skin(
    p_precio DECIMAL(10,2),
    p_stock INT
) 
RETURNS DECIMAL(12,2)
DETERMINISTIC
BEGIN
    RETURN ROUND(p_precio * p_stock, 2);
END //

CREATE FUNCTION categorizar_valor_skin(
    p_precio DECIMAL(10,2)
) 
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
    DECLARE v_categoria VARCHAR(20);

    IF p_precio >= 10000.00 THEN
        SET v_categoria = 'Coleccionista';
    ELSEIF p_precio >= 1000.00 THEN
        SET v_categoria = 'Gama Alta';
    ELSEIF p_precio >= 200.00 THEN
        SET v_categoria = 'Gama Media';
    ELSE
        SET v_categoria = 'Económica';
    END IF;

    RETURN v_categoria;
END //

CREATE FUNCTION generar_codigo_item(
    p_nombre_skin VARCHAR(100),
    p_arma_tipo VARCHAR(50),
    p_id INT
) 
RETURNS VARCHAR(50)
DETERMINISTIC
BEGIN
    DECLARE v_codigo VARCHAR(50);
    SET v_codigo = CONCAT(
        UPPER(LEFT(p_arma_tipo, 3)), 
        '-', 
        REPLACE(UPPER(p_nombre_skin), ' ', '_'), 
        '-', 
        LPAD(p_id, 4, '0')
    );
    RETURN v_codigo;
END //

DELIMITER ;

SELECT 
    skin_id,
    generar_codigo_item(nombre_skin, arma_tipo, skin_id) AS codigo_identificador,
    nombre_skin,
    arma_tipo,
    precio_mercado,
    stock_disponible,
    calcular_valor_inventario_skin(precio_mercado, stock_disponible) AS valor_total_stock,
    categorizar_valor_skin(precio_mercado) AS rango_comercial
FROM skins;

SELECT 
    c.nombre_coleccion,
    DATEDIFF(CURRENT_DATE, c.fecha_lanzamiento) AS dias_desde_lanzamiento,
    COUNT(s.skin_id) AS total_skins,
    SUM(calcular_valor_inventario_skin(s.precio_mercado, s.stock_disponible)) AS valor_total_coleccion
FROM colecciones c
INNER JOIN skins s ON c.coleccion_id = s.coleccion_id
GROUP BY c.coleccion_id, c.nombre_coleccion, c.fecha_lanzamiento;
