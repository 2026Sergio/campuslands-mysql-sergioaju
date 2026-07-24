-- DDL: Relación de Clanes y Jugadores para practicar LEFT JOIN
CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS jugadores;
DROP TABLE IF EXISTS clanes;

-- Tabla 1: Clanes de Battle Royale
CREATE TABLE clanes (
    clan_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_clan VARCHAR(50) NOT NULL UNIQUE,
    region VARCHAR(20) NOT NULL DEFAULT 'NA-East',
    nivel_clan INT NOT NULL DEFAULT 1 CHECK (nivel_clan >= 1),
    fecha_creacion DATE DEFAULT (CURRENT_DATE)
) ENGINE=InnoDB;

-- Tabla 2: Jugadores (pueden o no pertenecer a un clan)
CREATE TABLE jugadores (
    jugador_id INT AUTO_INCREMENT PRIMARY KEY,
    clan_id INT NULL,
    nickname VARCHAR(30) NOT NULL UNIQUE,
    puntos_ranking INT NOT NULL DEFAULT 0 CHECK (puntos_ranking >= 0),
    estado ENUM('activo', 'inactivo') NOT NULL DEFAULT 'activo',
    FOREIGN KEY (clan_id) REFERENCES clanes(clan_id) ON DELETE SET NULL
) ENGINE=InnoDB;
