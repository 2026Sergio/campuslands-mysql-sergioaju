DROP DATABASE IF EXISTS ranking_battle_royale;
CREATE DATABASE ranking_battle_royale;
USE ranking_battle_royale;

CREATE TABLE jugadores (
    id_jugador INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(80) NOT NULL,
    nickname VARCHAR(50) NOT NULL UNIQUE,
    pais VARCHAR(50),
    edad INT,
    fecha_registro DATE
);

CREATE TABLE temporadas (
    id_temporada INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(60) NOT NULL,
    fecha_inicio DATE,
    fecha_fin DATE
);

CREATE TABLE partidas (
    id_partida INT AUTO_INCREMENT PRIMARY KEY,
    id_temporada INT NOT NULL,
    fecha DATETIME NOT NULL,
    mapa VARCHAR(50),
    jugadores INT,
    FOREIGN KEY (id_temporada)
        REFERENCES temporadas(id_temporada)
);

CREATE TABLE ranking (
    id_ranking INT AUTO_INCREMENT PRIMARY KEY,
    id_partida INT NOT NULL,
    id_jugador INT NOT NULL,
    posicion INT,
    eliminaciones INT,
    supervivencia INT,
    puntos INT,
    FOREIGN KEY (id_partida)
        REFERENCES partidas(id_partida),
    FOREIGN KEY (id_jugador)
        REFERENCES jugadores(id_jugador)
);

CREATE TABLE premios (
    id_premio INT AUTO_INCREMENT PRIMARY KEY,
    id_jugador INT,
    descripcion VARCHAR(100),
    monto DECIMAL(10,2),
    FOREIGN KEY (id_jugador)
        REFERENCES jugadores(id_jugador)
);