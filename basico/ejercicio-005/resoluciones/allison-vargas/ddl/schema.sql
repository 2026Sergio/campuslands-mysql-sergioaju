-- DDL: Estructura básica para consultas SELECT en el Taller Mecánico
CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS repuestos_taller_basico;

CREATE TABLE repuestos_taller_basico (
    repuesto_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_repuesto VARCHAR(60) NOT NULL,
    categoria ENUM('frenos', 'motor', 'electrico', 'suspension', 'lubricantes') NOT NULL,
    precio_unitario DECIMAL(8, 2) NOT NULL CHECK (precio_unitario > 0.00),
    stock_actual INT NOT NULL CHECK (stock_actual >= 0),
    proveedor VARCHAR(50) NOT NULL,
    estado ENUM('disponible', 'agotado', 'descontinuado') NOT NULL DEFAULT 'disponible'
) ENGINE=InnoDB;
