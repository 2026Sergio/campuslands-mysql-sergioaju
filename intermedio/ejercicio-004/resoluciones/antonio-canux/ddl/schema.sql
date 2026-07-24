-- Campuslands MySQL - intermedio ejercicio 004
-- Contexto: Modulo de datos para garaje de motos (Marcas y Motocicletas).
CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS intermedio_ejercicio_004_motos;
DROP TABLE IF EXISTS intermedio_ejercicio_004_marcas;

CREATE TABLE intermedio_ejercicio_004_marcas (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(50) NOT NULL,
  pais_origen VARCHAR(50) NOT NULL,
  creado_en DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE intermedio_ejercicio_004_motos (
  id INT AUTO_INCREMENT PRIMARY KEY,
  marca_id INT NOT NULL,
  modelo VARCHAR(100) NOT NULL,
  cilindraje INT NOT NULL,
  precio DECIMAL(10,2) NOT NULL,
  estado ENUM('disponible','vendida','mantenimiento') NOT NULL DEFAULT 'disponible',
  FOREIGN KEY (marca_id) REFERENCES intermedio_ejercicio_004_marcas(id)
);