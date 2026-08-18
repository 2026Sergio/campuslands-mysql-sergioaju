CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

-- Eliminar función y tabla previas para garantizar una ejecución limpia desde cero
DROP FUNCTION IF EXISTS fn_calcular_valoracion_skin;
DROP TABLE IF EXISTS skins_shooter_funciones;

-- 1. Creación de la tabla con tipos de datos estrictos y restricciones
CREATE TABLE skins_shooter_funciones (
  id INT AUTO_INCREMENT PRIMARY KEY,
  codigo_skin VARCHAR(50) NOT NULL UNIQUE,
  nombre_skin VARCHAR(100) NOT NULL,
  arma_asociada VARCHAR(60) NOT NULL,
  rareza ENUM('Común', 'Rara', 'Épica', 'Legendaria', 'Contrabando') NOT NULL,
  precio_mercado DECIMAL(10,2) NOT NULL DEFAULT 0.00,
  desgaste ENUM('Factory New', 'Minimal Wear', 'Field-Tested', 'Well-Worn', 'Battle-Scarred') NOT NULL,
  fecha_adquisicion DATE NOT NULL,
  estado_inventario ENUM('disponible', 'equipado', 'en_venta', 'archivado') NOT NULL DEFAULT 'disponible',
  CONSTRAINT chk_precio_funciones CHECK (precio_mercado >= 0.00)
);

-- 2. Creación de Función Almacenada Personalizada
DELIMITER //

CREATE FUNCTION fn_calcular_valoracion_skin (
    p_precio DECIMAL(10,2),
    p_rareza VARCHAR(30)
) 
RETURNS VARCHAR(30)
DETERMINISTIC
BEGIN
    DECLARE v_categoria_valor VARCHAR(30);
    
    IF p_precio >= 1000.00 OR p_rareza = 'Contrabando' THEN
        SET v_categoria_valor = 'Skin de Colección / Elite';
    ELSEIF p_precio >= 100.00 THEN
        SET v_categoria_valor = 'Gama Alta';
    ELSEIF p_precio >= 50.00 THEN
        SET v_categoria_valor = 'Gama Media';
    ELSE
        SET v_categoria_valor = 'Gama Económica';
    END IF;
    
    RETURN v_categoria_valor;
END //

DELIMITER ;