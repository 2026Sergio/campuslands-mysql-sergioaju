-- Campuslands MySQL - basico ejercicio 001
-- Ejecuta este archivo antes de inserts.sql.

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS equipos;

CREATE TABLE equipos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    region VARCHAR(50) NOT NULL,
    entrenador VARCHAR(100) NOT NULL,
    victorias INT NOT NULL DEFAULT 0,
    derrotas INT NOT NULL DEFAULT 0,
    puntaje DECIMAL(5,2) NOT NULL,
    estado ENUM('Activo', 'Eliminado') NOT NULL,
    fecha_registro DATE NOT NULL,
    UNIQUE(nombre),
    CHECK (victorias >= 0),
    CHECK (derrotas >= 0),
    CHECK (puntaje >= 0)
);