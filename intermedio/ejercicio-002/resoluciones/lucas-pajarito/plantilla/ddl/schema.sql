-- Campuslands MySQL - intermedio ejercicio 002
-- Ejecuta este archivo antes de inserts.sql.

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS intermedio_ejercicio_002;

CREATE TABLE ranking_battle_royale (
    id INT AUTO_INCREMENT PRIMARY KEY,
    jugador VARCHAR(120) NOT NULL,
    juego VARCHAR(80) NOT NULL,
    victorias INT NOT NULL DEFAULT 0,
    puntaje DECIMAL(10,2) NOT NULL DEFAULT 0,
    estado ENUM('activo','revision','inactivo') NOT NULL DEFAULT 'activo',
    creado_en DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);
