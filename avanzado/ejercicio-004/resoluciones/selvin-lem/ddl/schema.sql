CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TRIGGER IF EXISTS trg_antes_insertar_reparacion;
DROP TRIGGER IF EXISTS trg_despues_actualizar_estado;
DROP TABLE IF EXISTS garaje_auditoria;
DROP TABLE IF EXISTS garaje_reparaciones_trigger;

CREATE TABLE garaje_reparaciones_trigger (
  id_reparacion INT AUTO_INCREMENT PRIMARY KEY,
  propietario VARCHAR(50) NOT NULL,
  marca VARCHAR(40) NOT NULL,
  costo DECIMAL(8,2) NOT NULL DEFAULT 0.00,
  fecha_registro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  estado ENUM('pendiente','en_proceso','finalizada') NOT NULL DEFAULT 'pendiente'
);

CREATE TABLE garaje_auditoria (
  id_auditoria INT AUTO_INCREMENT PRIMARY KEY,
  id_reparacion INT NOT NULL,
  estado_anterior VARCHAR(20),
  estado_nuevo VARCHAR(20),
  fecha_cambio DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

DELIMITER //

-- Trigger 1: valida que el costo no sea negativo antes de insertar (BEFORE INSERT)
CREATE TRIGGER trg_antes_insertar_reparacion
BEFORE INSERT ON garaje_reparaciones_trigger
FOR EACH ROW
BEGIN
  IF NEW.costo < 0 THEN
    SET NEW.costo = 0.00;
  END IF;
END //

-- Trigger 2: registra en auditoria cada cambio de estado (AFTER UPDATE)
CREATE TRIGGER trg_despues_actualizar_estado
AFTER UPDATE ON garaje_reparaciones_trigger
FOR EACH ROW
BEGIN
  IF OLD.estado <> NEW.estado THEN
    INSERT INTO garaje_auditoria (id_reparacion, estado_anterior, estado_nuevo)
    VALUES (NEW.id_reparacion, OLD.estado, NEW.estado);
  END IF;
END //

DELIMITER ;