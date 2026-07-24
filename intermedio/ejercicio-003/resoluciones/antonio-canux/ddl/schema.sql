-- Campuslands MySQL - intermedio ejercicio 003
-- Contexto: Modulo de datos para inventario de skins shooter (Armas y Skins).

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS intermedio_ejercicio_003_skins;
DROP TABLE IF EXISTS intermedio_ejercicio_003_armas;

CREATE TABLE intermedio_ejercicio_003_armas (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(50) NOT NULL,
  tipo VARCHAR(50) NOT NULL,
  creado_en DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE intermedio_ejercicio_003_skins (
  id INT AUTO_INCREMENT PRIMARY KEY,
  arma_id INT NOT NULL,
  nombre_skin VARCHAR(100) NOT NULL,
  rareza VARCHAR(50) NOT NULL,
  precio DECIMAL(10,2) NOT NULL DEFAULT 0,
  FOREIGN KEY (arma_id) REFERENCES intermedio_ejercicio_003_armas(id)
);