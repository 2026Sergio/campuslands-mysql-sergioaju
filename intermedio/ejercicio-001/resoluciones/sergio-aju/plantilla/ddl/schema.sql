DROP DATABASE IF EXISTS db_moba_torneo;
CREATE DATABASE db_moba_torneo;
USE db_moba_torneo;

CREATE TABLE equipos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL UNIQUE,
    region VARCHAR(30) NOT NULL,
    estado ENUM('Activo', 'Eliminado') DEFAULT 'Activo'
);

CREATE TABLE jugadores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    alias VARCHAR(40) NOT NULL UNIQUE,
    rol ENUM('Top', 'Jungla', 'Mid', 'ADC', 'Soporte') NOT NULL,
    kda DECIMAL(4,2) NOT NULL,
    id_equipo INT NOT NULL,
    FOREIGN KEY (id_equipo) REFERENCES equipos(id) ON DELETE CASCADE
);