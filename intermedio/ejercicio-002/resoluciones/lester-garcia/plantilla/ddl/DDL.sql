DROP DATABASE IF EXISTS ranking_battle_royale;

CREATE DATABASE ranking_battle_royale;

USE ranking_battle_royale;

CREATE TABLE jugadores (
    id_jugador INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(80) NOT NULL,
    nickname VARCHAR(50) NOT NULL UNIQUE,
    pais VARCHAR(50) NOT NULL,
    nivel INT NOT NULL
);

CREATE TABLE temporadas (
    id_temporada INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE NOT NULL
);

CREATE TABLE rankings (
    id_ranking INT AUTO_INCREMENT PRIMARY KEY,
    id_jugador INT NOT NULL,
    id_temporada INT NOT NULL,
    posicion INT NOT NULL,
    puntos INT NOT NULL,
    victorias INT NOT NULL,
    FOREIGN KEY (id_jugador) REFERENCES jugadores(id_jugador),
    FOREIGN KEY (id_temporada) REFERENCES temporadas(id_temporada)
);