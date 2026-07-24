DROP DATABASE IF EXISTS torneo_moba;

CREATE DATABASE torneo_moba;

USE torneo_moba;

CREATE TABLE equipos (
    id_equipo INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(80) NOT NULL,
    pais VARCHAR(50) NOT NULL,
    entrenador VARCHAR(80) NOT NULL
);

CREATE TABLE jugadores (
    id_jugador INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(80) NOT NULL,
    nickname VARCHAR(50) NOT NULL UNIQUE,
    rol ENUM('Top','Jungla','Mid','ADC','Support') NOT NULL,
    edad INT NOT NULL,
    id_equipo INT NOT NULL,
    FOREIGN KEY (id_equipo) REFERENCES equipos(id_equipo)
);

CREATE TABLE torneos (
    id_torneo INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    ciudad VARCHAR(60) NOT NULL,
    fecha DATE NOT NULL,
    premio DECIMAL(12,2) NOT NULL
);

CREATE TABLE participaciones (
    id_participacion INT AUTO_INCREMENT PRIMARY KEY,
    id_equipo INT NOT NULL,
    id_torneo INT NOT NULL,
    posicion_final INT NOT NULL,
    victorias INT NOT NULL,
    derrotas INT NOT NULL,
    FOREIGN KEY (id_equipo) REFERENCES equipos(id_equipo),
    FOREIGN KEY (id_torneo) REFERENCES torneos(id_torneo)
);
