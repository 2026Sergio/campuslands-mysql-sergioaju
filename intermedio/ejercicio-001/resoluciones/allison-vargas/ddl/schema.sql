-- DDL: Esquema relacional para Equipos y Jugadores (INNER JOIN)
CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS jugadores;
DROP TABLE IF EXISTS equipos;

-- Tabla 1: Equipos
CREATE TABLE equipos (
    equipo_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL UNIQUE,
    region VARCHAR(20) NOT NULL,
    patrocinador VARCHAR(50) DEFAULT 'Sin Patrocinador',
    fecha_creacion DATE DEFAULT (CURRENT_DATE)
) ENGINE=InnoDB;

-- Tabla 2: Jugadores (relacionada con equipos)
CREATE TABLE jugadores (
    jugador_id INT AUTO_INCREMENT PRIMARY KEY,
    equipo_id INT NOT NULL,
    nickname VARCHAR(30) NOT NULL UNIQUE,
    rol ENUM('Top', 'Jungle', 'Mid', 'ADC', 'Support') NOT NULL,
    salario_mensual DECIMAL(10, 2) NOT NULL CHECK (salario_mensual >= 0),
    partidas_jugadas INT NOT NULL DEFAULT 0 CHECK (partidas_jugadas >= 0),
    estado ENUM('titular', 'suplente', 'inactivo') NOT NULL DEFAULT 'titular',
    FOREIGN KEY (equipo_id) REFERENCES equipos(equipo_id) ON DELETE CASCADE
) ENGINE=InnoDB;
