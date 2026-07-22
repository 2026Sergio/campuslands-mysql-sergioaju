-- Campuslands MySQL - Avanzado Ejercicio 002
-- Tema: Procedimientos Almacenados

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS jugadores;
DROP TABLE IF EXISTS clanes;

SET FOREIGN_KEY_CHECKS = 1;

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

DELIMITER $$

CREATE PROCEDURE registrar_jugador(
    IN p_nombre VARCHAR(100),
    IN p_nickname VARCHAR(50),
    IN p_nivel TINYINT,
    IN p_puntos DECIMAL(8,2),
    IN p_clan INT
)
BEGIN

    INSERT INTO jugadores
    (nombre,nickname,nivel,puntos,clan_id)
    VALUES
    (p_nombre,p_nickname,p_nivel,p_puntos,p_clan);

END $$

DELIMITER ;