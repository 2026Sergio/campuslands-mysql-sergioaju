CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS jugadores_battle;

CREATE TABLE jugadores_battle (
    id_jugador INT AUTO_INCREMENT PRIMARY KEY,
    nombre_jugador VARCHAR(50) NOT NULL,
    nickname VARCHAR(30) NOT NULL UNIQUE,
    nivel INT NOT NULL,
    partidas_jugadas INT DEFAULT 0,
    victorias INT DEFAULT 0,
    puntaje DECIMAL(8,2) DEFAULT 0,
    estado ENUM('Activo','Inactivo') DEFAULT 'Activo'
);