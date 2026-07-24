-- Campuslands MySQL - intermedio ejercicio 005
-- Ejecuta este archivo antes de inserts.sql.

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS intermedio_ejercicio_005;

CREATE TABLE taller_mecanico_motos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cliente VARCHAR(120) NOT NULL,
    motocicleta VARCHAR(120) NOT NULL,
    servicio VARCHAR(100) NOT NULL,
    costo DECIMAL(10,2) NOT NULL DEFAULT 0,
    estado ENUM('pendiente','en_proceso','finalizado') NOT NULL DEFAULT 'pendiente',
    creado_en DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);
