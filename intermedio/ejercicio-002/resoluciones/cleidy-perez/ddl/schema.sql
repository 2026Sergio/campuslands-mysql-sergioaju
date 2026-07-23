-- Campuslands MySQL - intermedio ejercicio 002
-- Ejecuta este archivo antes de inserts.sql.

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS partidas;
DROP TABLE IF EXISTS jugadores;

CREATE TABLE jugadores (
    id_jugador INT AUTO_INCREMENT PRIMARY KEY,
    nickname VARCHAR(50) NOT NULL UNIQUE,
    region VARCHAR(30) NOT NULL,
    estado ENUM('activo', 'inactivo', 'suspendido') NOT NULL DEFAULT 'activo',
    creado_en DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE partidas (
    id_partida INT AUTO_INCREMENT PRIMARY KEY,
    id_jugador INT NOT NULL,
    categoria VARCHAR(50) NOT NULL,
    puntaje DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    modo_juego ENUM('solo', 'duo', 'squad') NOT NULL DEFAULT 'solo',
    fecha_partida DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_partidas_jugadores 
        FOREIGN KEY (id_jugador) 
        REFERENCES jugadores(id_jugador) 
        ON DELETE CASCADE
);