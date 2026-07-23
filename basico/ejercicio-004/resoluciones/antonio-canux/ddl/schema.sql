-- Campuslands MySQL - basico ejercicio 004
-- Ejecuta este archivo antes de inserts.sql.

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS basico_ejercicio_004;

CREATE TABLE basico_ejercicio_004 (
  id INT AUTO_INCREMENT PRIMARY KEY,
  marca VARCHAR(50) NOT NULL,
  modelo VARCHAR(100) NOT NULL,
  cilindraje INT NOT NULL,
  precio DECIMAL(10,2) NOT NULL,
  estado ENUM('disponible','mantenimiento','vendido') NOT NULL DEFAULT 'disponible',
  creado_en DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);
