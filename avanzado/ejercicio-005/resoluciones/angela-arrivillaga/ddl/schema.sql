-- campuslands mysql - avanzado ejercicio 005
-- ddl/schema.sql

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

-- limpiamos tablas previas
SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS servicios_taller;
SET FOREIGN_KEY_CHECKS = 1;

-- tabla principal: servicios del taller mecanico
CREATE TABLE servicios_taller (
    id INT AUTO_INCREMENT PRIMARY KEY,
    placa_moto VARCHAR(20) NOT NULL,
    mecanico VARCHAR(100) NOT NULL,
    tipo_servicio VARCHAR(100) NOT NULL,
    costo DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    estado ENUM('en_proceso', 'completado', 'cancelado') NOT NULL DEFAULT 'en_proceso',
    fecha_servicio DATE NOT NULL,
    creado_en DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    
    -- creacion de indices para optimizar las busquedas frecuentes
    INDEX idx_placa (placa_moto),
    INDEX idx_estado (estado),
    INDEX idx_mecanico (mecanico)
) ENGINE=InnoDB;