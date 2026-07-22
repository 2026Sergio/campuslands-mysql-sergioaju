-- Campuslands MySQL - Básico Ejercicio 002
-- Tema: Tipos de datos

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS ranking_battle_royale;

CREATE TABLE ranking_battle_royale (
    id INT AUTO_INCREMENT PRIMARY KEY,
    jugador VARCHAR(100) NOT NULL,
    nickname VARCHAR(50) NOT NULL UNIQUE,
    nivel TINYINT UNSIGNED NOT NULL,
    partidas INT UNSIGNED NOT NULL,
    victorias INT UNSIGNED NOT NULL DEFAULT 0,
    puntos DECIMAL(8,2) NOT NULL,
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    region ENUM('Norte','Sur','Este','Oeste') NOT NULL,
    fecha_registro DATE NOT NULL,
    ultima_partida DATETIME NOT NULL,

    CHECK (nivel BETWEEN 1 AND 100),
    CHECK (victorias <= partidas),
    CHECK (puntos >= 0)
);