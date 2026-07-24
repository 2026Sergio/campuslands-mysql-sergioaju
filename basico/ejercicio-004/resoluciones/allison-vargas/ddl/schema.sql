-- DDL: Estructura para practica de INSERT en Garaje de Motos
CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS motos_basico;

CREATE TABLE motos_basico (
    moto_id INT AUTO_INCREMENT PRIMARY KEY,
    placa VARCHAR(10) NOT NULL UNIQUE,
    marca VARCHAR(30) NOT NULL,
    modelo VARCHAR(50) NOT NULL,
    anio INT NOT NULL CHECK (anio >= 1990),
    precio_alquiler_dia DECIMAL(8, 2) NOT NULL CHECK (precio_alquiler_dia > 0.00),
    disponible BOOLEAN NOT NULL DEFAULT TRUE,
    estado ENUM('excelente', 'bueno', 'mantenimiento') NOT NULL DEFAULT 'excelente'
) ENGINE=InnoDB;
