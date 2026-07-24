-- Campuslands MySQL - avanzado ejercicio 003
-- Ejecuta este archivo antes de inserts.sql.

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS avanzado_ejercicio_003;

CREATE TABLE avanzado_ejercicio_003 (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_skin VARCHAR(120) NOT NULL,
    videojuego VARCHAR(80) NOT NULL,
    rareza ENUM('Comun','Rara','Epica','Legendaria') NOT NULL,
    precio DECIMAL(10,2) NOT NULL,
    estado ENUM('disponible','equipada','vendida') NOT NULL DEFAULT 'disponible',
    fecha_registro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);
