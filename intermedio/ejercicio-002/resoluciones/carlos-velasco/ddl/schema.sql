-- Campuslands MySQL - intermedio ejercicio 002
-- Ejecuta este archivo antes de inserts.sql.

-- Tema: LEFT JOIN

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS jugadores;
DROP TABLE IF EXISTS clanes;

CREATE TABLE clanes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(80) NOT NULL UNIQUE,
    region VARCHAR(50) NOT NULL,
    lider VARCHAR(100) NOT NULL,
    estado ENUM('Activo','Inactivo') NOT NULL DEFAULT 'Activo'
);

CREATE TABLE jugadores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    nickname VARCHAR(50) NOT NULL UNIQUE,
    nivel TINYINT UNSIGNED NOT NULL,
    puntos DECIMAL(8,2) NOT NULL,
    clan_id INT,

    CHECK (nivel BETWEEN 1 AND 100),
    CHECK (puntos >= 0),

    CONSTRAINT fk_jugador_clan
        FOREIGN KEY (clan_id)
        REFERENCES clanes(id)
);
