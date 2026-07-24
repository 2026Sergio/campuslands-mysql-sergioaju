-- DDL: Tabla de trabajos de taller para práctica de SUBCONSULTAS
CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS trabajos_taller_intermedio;

CREATE TABLE trabajos_taller_intermedio (
    trabajo_id INT AUTO_INCREMENT PRIMARY KEY,
    placa_moto VARCHAR(10) NOT NULL,
    cliente VARCHAR(80) NOT NULL,
    mecanico VARCHAR(50) NOT NULL,
    tipo_reparacion VARCHAR(50) NOT NULL,
    costo_total DECIMAL(10, 2) NOT NULL CHECK (costo_total >= 0.00),
    horas_laboradas DECIMAL(4, 1) NOT NULL CHECK (horas_laboradas > 0.0),
    estado ENUM('finalizado', 'en_espera', 'en_proceso') NOT NULL DEFAULT 'finalizado'
) ENGINE=InnoDB;
