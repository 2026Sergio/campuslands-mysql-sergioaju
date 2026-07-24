USE db_shooter_skins_funcs;
INSERT INTO skins (nombre, arma, rareza, precio, estado) VALUES
('AK-47 Vulcano', 'AK-47', 'Legendaria', 120.50, 'Disponible'),
('M4A4 Howl', 'M4A4', 'Mítica', 450.00, 'Exclusiva'),
('AWP Asiimov', 'AWP', 'Legendaria', 85.75, 'Disponible'),
('Glock-16 Desperdicio', 'Glock-16', 'Épica', 25.00, 'Disponible'),
('USP-S Kill Confirmed', 'USP-S', 'Legendaria', 95.40, 'Agotada'),
('Desert Eagle Esmeralda', 'Desert Eagle', 'Rara', 12.50, 'Disponible'),
('MP7 Sangre fría', 'MP7', 'Común', 5.00, 'Disponible'),
('Knife Karambit Diente de Tigre', 'Cuchillo', 'Mítica', 600.00, 'Exclusiva'),
('P250 Valenzuela', 'P250', 'Común', 4.50, 'Disponible'),
('Famas Neon', 'Famas', 'Rara', 15.00, 'Agotada');

DELIMITER //
CREATE FUNCTION fn_calcular_descuento(p_precio DECIMAL(8,2), p_porcentaje INT) 
RETURNS DECIMAL(8,2)
DETERMINISTIC
BEGIN
    DECLARE v_precio_final DECIMAL(8,2);
    SET v_precio_final = p_precio - (p_precio * p_porcentaje / 100);
    RETURN v_precio_final;
END //

DELIMITER ;