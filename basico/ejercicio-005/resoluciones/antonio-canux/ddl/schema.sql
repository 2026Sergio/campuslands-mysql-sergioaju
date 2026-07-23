-- Campuslands MySQL - basico ejercicio 005
-- Ejecuta este archivo antes de inserts.sql.

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS basico_ejercicio_005;

CREATE TABLE basico_ejercicio_005 (
  id INT AUTO_INCREMENT PRIMARY KEY,
  cliente VARCHAR(100) NOT NULL,
  moto_modelo VARCHAR(100) NOT NULL,
  tipo_servicio VARCHAR(100) NOT NULL,
  costo DECIMAL(10,2) NOT NULL,
  estado ENUM('pendiente','en_proceso','completado') NOT NULL DEFAULT 'pendiente',
  creado_en DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);