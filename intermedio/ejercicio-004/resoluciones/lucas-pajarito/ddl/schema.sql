-- Campuslands MySQL - intermedio ejercicio 004
-- Ejecuta este archivo antes de inserts.sql.

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS intermedio_ejercicio_004;

CREATE TABLE garaje_motos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    modelo VARCHAR(120) NOT NULL,
    marca VARCHAR(80) NOT NULL,
    cilindraje INT NOT NULL,
    precio DECIMAL(10,2) NOT NULL DEFAULT 0,
    estado ENUM('disponible','mantenimiento','vendida') NOT NULL DEFAULT 'disponible',
    creado_en DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);
