-- Campuslands MySQL - avanzado ejercicio 002
-- Ejecuta este archivo antes de inserts.sql.

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS avanzado_ejercicio_002;

CREATE TABLE avanzado_ejercicio_002 (
  id INT AUTO_INCREMENT PRIMARY KEY,
    jugador VARCHAR(100) NOT NULL,
    videojuego VARCHAR(80) NOT NULL,
    victorias INT NOT NULL,
    puntaje DECIMAL(10,2) NOT NULL,
    estado ENUM('activo','suspendido','retirado') NOT NULL DEFAULT 'activo',
    fecha_registro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);
