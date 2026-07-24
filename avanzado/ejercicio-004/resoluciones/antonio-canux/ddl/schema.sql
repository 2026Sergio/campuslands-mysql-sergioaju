-- Campuslands MySQL - avanzado ejercicio 004
-- Contexto: Modulo de datos para garaje de motos (Triggers y Auditoria).
CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS avanzado_ejercicio_004_auditoria;
DROP TABLE IF EXISTS avanzado_ejercicio_004_motos;

CREATE TABLE avanzado_ejercicio_004_motos (
  id INT AUTO_INCREMENT PRIMARY KEY,
  marca VARCHAR(50) NOT NULL,
  modelo VARCHAR(100) NOT NULL,
  precio DECIMAL(10,2) NOT NULL,
  estado ENUM('disponible','vendida','mantenimiento') NOT NULL DEFAULT 'disponible',
  creado_en DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE avanzado_ejercicio_004_auditoria (
  id INT AUTO_INCREMENT PRIMARY KEY,
  moto_id INT NOT NULL,
  estado_anterior VARCHAR(50) NOT NULL,
  estado_nuevo VARCHAR(50) NOT NULL,
  fecha_cambio DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (moto_id) REFERENCES avanzado_ejercicio_004_motos(id)
);