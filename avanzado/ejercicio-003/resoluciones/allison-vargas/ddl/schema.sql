-- DDL: Tabla de Skins y Función Personalizada de Valoración
CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP FUNCTION IF EXISTS calcular_valor_mercado;
DROP TABLE IF EXISTS inventario_skins;

CREATE TABLE inventario_skins (
    skin_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_skin VARCHAR(60) NOT NULL,
    arma VARCHAR(30) NOT NULL,
    rareza ENUM('Común', 'Rara', 'Épica', 'Legendaria', 'Definitiva') NOT NULL,
    precio_base DECIMAL(10, 2) NOT NULL CHECK (precio_base >= 0.00),
    float_wear DECIMAL(5, 4) NOT NULL CHECK (float_wear BETWEEN 0.0000 AND 1.0000), -- 0.0000 (Factory New) a 1.0000 (Battle-Scarred)
    stattrak BOOLEAN NOT NULL DEFAULT FALSE,
    fecha_adquisicion DATE NOT NULL,
    estado ENUM('disponible', 'bloqueada_intercambio', 'vendida') NOT NULL DEFAULT 'disponible'
) ENGINE=InnoDB;

-- Función SQL Personalizada: Aplica un multiplicador de precio según la rareza y si es StatTrak
DELIMITER //
CREATE FUNCTION calcular_valor_mercado(
    p_precio_base DECIMAL(10, 2),
    p_rareza VARCHAR(20),
    p_stattrak BOOLEAN
)
RETURNS DECIMAL(10, 2)
DETERMINISTIC
BEGIN
    DECLARE v_multiplicador DECIMAL(4, 2) DEFAULT 1.00;
    DECLARE v_valor_final DECIMAL(10, 2);
    
    SET v_multiplicador = CASE p_rareza
        WHEN 'Común' THEN 1.00
        WHEN 'Rara' THEN 1.25
        WHEN 'Épica' THEN 1.60
        WHEN 'Legendaria' THEN 2.20
        WHEN 'Definitiva' THEN 3.50
        ELSE 1.00
    END;
    
    -- Si es StatTrak, incrementa un 30% adicional sobre el valor base
    IF p_stattrak THEN
        SET v_multiplicador = v_multiplicador + 0.30;
    END IF;
    
    SET v_valor_final = p_precio_base * v_multiplicador;
    RETURN ROUND(v_valor_final, 2);
END //
DELIMITER ;
