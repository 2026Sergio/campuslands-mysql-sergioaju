-- Campuslands MySQL - basico ejercicio 003
-- Ejecuta este archivo antes de inserts.sql.

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS basico_ejercicio_003;

CREATE TABLE basico_ejercicio_003 (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre_skin VARCHAR(120) NOT NULL,
  rareza VARCHAR(80) NOT NULL,
  precio DECIMAL(10,2) NOT NULL DEFAULT 0,
  estado_uso ENUM('equipado','inventario','descartado') NOT NULL DEFAULT 'inventario',
  creado_en DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);