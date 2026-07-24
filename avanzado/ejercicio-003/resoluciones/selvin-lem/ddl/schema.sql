SET GLOBAL log_bin_trust_function_creators = 1;

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP FUNCTION IF EXISTS clasificar_valor_skin;
DROP FUNCTION IF EXISTS calcular_precio_con_descuento;
DROP TABLE IF EXISTS skins_inventario_avanzado;

CREATE TABLE skins_inventario_avanzado (
  id_skin INT AUTO_INCREMENT PRIMARY KEY,
  jugador VARCHAR(50) NOT NULL,
  nombre_skin VARCHAR(80) NOT NULL,
  precio DECIMAL(8,2) NOT NULL DEFAULT 0.00,
  fecha_obtencion DATE NOT NULL,
  estado ENUM('disponible','bloqueada','en_revision') NOT NULL DEFAULT 'disponible'
);

DELIMITER //

-- Funcion 1: clasifica una skin segun su precio
CREATE FUNCTION clasificar_valor_skin(p_precio DECIMAL(8,2))
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
  DECLARE v_categoria VARCHAR(20);

  IF p_precio = 0 THEN
    SET v_categoria = 'sin_tasar';
  ELSEIF p_precio < 10 THEN
    SET v_categoria = 'bajo';
  ELSEIF p_precio < 50 THEN
    SET v_categoria = 'medio';
  ELSE
    SET v_categoria = 'alto';
  END IF;

  RETURN v_categoria;
END //

-- Funcion 2: calcula precio con descuento segun antiguedad (mas vieja, mas descuento)
CREATE FUNCTION calcular_precio_con_descuento(p_precio DECIMAL(8,2), p_fecha DATE)
RETURNS DECIMAL(8,2)
DETERMINISTIC
BEGIN
  DECLARE v_dias INT;
  DECLARE v_descuento DECIMAL(4,2);

  SET v_dias = DATEDIFF(CURDATE(), p_fecha);

  IF v_dias > 60 THEN
    SET v_descuento = 0.30;
  ELSEIF v_dias > 30 THEN
    SET v_descuento = 0.15;
  ELSE
    SET v_descuento = 0.00;
  END IF;

  RETURN ROUND(p_precio - (p_precio * v_descuento), 2);
END //

DELIMITER ;