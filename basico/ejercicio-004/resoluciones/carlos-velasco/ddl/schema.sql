-- Campuslands MySQL - Básico Ejercicio 004
-- Tema: INSERT

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

SET FOREIGN_KEY_CHECKS = 0;

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