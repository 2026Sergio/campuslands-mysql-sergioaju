-- Campuslands MySQL - avanzado ejercicio 001
-- Ejecuta este archivo antes de inserts.sql.

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS avanzado_ejercicio_001;

CREATE TABLE avanzado_ejercicio_001 (
    id INT AUTO_INCREMENT PRIMARY KEY,
    equipo VARCHAR(120) NOT NULL,
    juego VARCHAR(80) NOT NULL,
    jugadores INT NOT NULL,
    puntaje DECIMAL(10,2) NOT NULL DEFAULT 0,
    estado ENUM('clasificado','en_competencia','eliminado') NOT NULL DEFAULT 'en_competencia',
    creado_en DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);
