-- Campuslands MySQL - intermedio ejercicio 003
-- Ejecuta este archivo antes de inserts.sql.

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS intermedio_ejercicio_003;

CREATE TABLE inventario_skins_shooter (
    id INT AUTO_INCREMENT PRIMARY KEY,
    skin VARCHAR(120) NOT NULL,
    juego VARCHAR(80) NOT NULL,
    rareza ENUM('Comun','Rara','Epica','Legendaria') NOT NULL,
    precio DECIMAL(10,2) NOT NULL DEFAULT 0,
    estado ENUM('disponible','equipada','vendida') NOT NULL DEFAULT 'disponible',
    creado_en DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);
