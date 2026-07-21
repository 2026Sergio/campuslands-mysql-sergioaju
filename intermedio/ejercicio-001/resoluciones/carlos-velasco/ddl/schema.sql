-- Campuslands MySQL - Intermedio Ejercicio 001
-- Ejecutar antes de inserts.sql

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS jugadores;
DROP TABLE IF EXISTS equipos;

CREATE TABLE equipos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(80) NOT NULL UNIQUE,
    region VARCHAR(50) NOT NULL,
    entrenador VARCHAR(100) NOT NULL,
    estado ENUM('Activo','Eliminado') NOT NULL DEFAULT 'Activo',
    fecha_registro DATE NOT NULL DEFAULT (CURRENT_DATE)
);

CREATE TABLE jugadores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    nickname VARCHAR(50) NOT NULL UNIQUE,
    rol ENUM('Top','Jungla','Mid','ADC','Support') NOT NULL,
    edad INT NOT NULL,
    puntaje DECIMAL(6,2) NOT NULL DEFAULT 0,
    equipo_id INT NOT NULL,

    CHECK (edad >= 16),
    CHECK (puntaje >= 0),

    CONSTRAINT fk_jugador_equipo
        FOREIGN KEY (equipo_id)
        REFERENCES equipos(id)
);