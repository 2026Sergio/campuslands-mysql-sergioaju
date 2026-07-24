DELIMITER //

CREATE FUNCTION ObtenerValorPorRareza(p_rareza VARCHAR(30)) 
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE v_total INT;
    
    SELECT SUM(precio) INTO v_total
    FROM catalogo_skins
    WHERE rareza = p_rareza;
    
    -- Si no hay resultados, devolvemos 0 en lugar de NULL
    RETURN IFNULL(v_total, 0);
END //

DELIMITER ;