-- DDL: Estructura para Taller Mecánico con optimización mediante ÍNDICES
CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS ordenes_taller_avanzado;

CREATE TABLE ordenes_taller_avanzado (
    orden_id INT AUTO_INCREMENT PRIMARY KEY,
    placa_moto VARCHAR(10) NOT NULL,
    cliente VARCHAR(80) NOT NULL,
    mecanico VARCHAR(50) NOT NULL,
    fecha_ingreso DATE NOT NULL,
    costo_total DECIMAL(10, 2) NOT NULL CHECK (costo_total >= 0.00),
    estado_orden ENUM('recibida', 'en_diagnostico', 'reparando', 'lista', 'entregada') NOT NULL DEFAULT 'recibida',
    
    -- Definición explícita de Índices para optimización de consultas
    INDEX idx_placa (placa_moto),
    INDEX idx_estado (estado_orden),
    INDEX idx_mecanico_fecha (mecanico, fecha_ingreso)
) ENGINE=InnoDB;
