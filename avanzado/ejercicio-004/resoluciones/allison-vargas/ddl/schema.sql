-- DDL: Tabla de Motocicletas, Historial de Auditoría y Triggers
CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TRIGGER IF EXISTS trg_auditoria_mantenimiento_motos;
DROP TABLE IF EXISTS auditoria_mantenimiento;
DROP TABLE IF EXISTS motos;

CREATE TABLE motos (
    moto_id INT AUTO_INCREMENT PRIMARY KEY,
    placa VARCHAR(10) NOT NULL UNIQUE,
    modelo VARCHAR(50) NOT NULL,
    cilindraje INT NOT NULL CHECK (cilindraje > 0),
    kilometraje INT NOT NULL CHECK (kilometraje >= 0),
    costo_mantenimiento DECIMAL(10, 2) NOT NULL DEFAULT 0.00 CHECK (costo_mantenimiento >= 0.00),
    estado_mantenimiento ENUM('en_revision', 'en_reparacion', 'listo', 'entregado') NOT NULL DEFAULT 'en_revision',
    ultima_actualizacion DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB;

-- Tabla para guardar el historial de cambios mediante el Trigger
CREATE TABLE auditoria_mantenimiento (
    auditoria_id INT AUTO_INCREMENT PRIMARY KEY,
    moto_id INT NOT NULL,
    estado_anterior VARCHAR(20),
    estado_nuevo VARCHAR(20),
    fecha_cambio DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (moto_id) REFERENCES motos(moto_id) ON DELETE CASCADE
) ENGINE=InnoDB;

-- Trigger: Auditoría automática ante cambios de estado en motos
DELIMITER //
CREATE TRIGGER trg_auditoria_mantenimiento_motos
AFTER UPDATE ON motos
FOR EACH ROW
BEGIN
    IF OLD.estado_mantenimiento != NEW.estado_mantenimiento THEN
        INSERT INTO auditoria_mantenimiento (moto_id, estado_anterior, estado_nuevo)
        VALUES (NEW.moto_id, OLD.estado_mantenimiento, NEW.estado_mantenimiento);
    END IF;
END //
DELIMITER ;
