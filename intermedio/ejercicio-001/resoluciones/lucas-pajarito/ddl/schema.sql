-- Campuslands MySQL - intermedio ejercicio 001
-- Ejecuta este archivo antes de inserts.sql.

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS intermedio_ejercicio_001;

CREATE TABLE intermedio_ejercicio_001(
  id_equipo INT AUTO_INCREMENT PRIMARY KEY,
  equipo VARCHAR(120) NOT NULL,
  categoria VARCHAR(80) NOT NULL,
  puntaje DECIMAL(10,2) NOT NULL DEFAULT 0,
  estado ENUM('activo','revision','inactivo') NOT NULL DEFAULT 'activo',
  creado_en DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);
