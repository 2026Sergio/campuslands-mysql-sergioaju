-- Campuslands MySQL - Avanzado Ejercicio 004
-- Tema: Triggers

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

SET FOREIGN_KEY_CHECKS = 0;

DROP TRIGGER IF EXISTS trg_registrar_moto;
DROP TABLE IF EXISTS historial_ingresos;
DROP TABLE IF EXISTS motos;

SET FOREIGN_KEY_CHECKS = 1;

CREATE TABLE motos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    marca VARCHAR(50) NOT NULL,
    modelo VARCHAR(80) NOT NULL,
    cilindrada INT NOT NULL,
    color VARCHAR(30) NOT NULL,
    precio DECIMAL(10,2) NOT NULL,
    estado ENUM('Disponible','Vendida','Mantenimiento') NOT NULL DEFAULT 'Disponible',
    fecha_ingreso DATE NOT NULL,

    CHECK (cilindrada > 0),
    CHECK (precio >= 0)
);

CREATE TABLE historial_ingresos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    moto_id INT NOT NULL,
    descripcion VARCHAR(255) NOT NULL,
    fecha_registro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_historial_moto
        FOREIGN KEY (moto_id)
        REFERENCES motos(id)
);

DELIMITER $$

CREATE TRIGGER trg_registrar_moto
AFTER INSERT ON motos
FOR EACH ROW
BEGIN

    INSERT INTO historial_ingresos
    (moto_id, descripcion)
    VALUES
    (
        NEW.id,
        CONCAT('Se registró la moto ', NEW.marca, ' ', NEW.modelo)
    );

END;
DELIMITER ;