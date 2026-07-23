CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS partidas;
DROP TABLE IF EXISTS jugadores;

CREATE TABLE jugadores(
    id_jugador INT AUTO_INCREMENT PRIMARY KEY,
    nickname VARCHAR(40) NOT NULL,
    pais VARCHAR(30) NOT NULL,
    nivel INT NOT NULL,
    estado ENUM('Activo','Inactivo') DEFAULT 'Activo'
);

CREATE TABLE partidas(
    id_partida INT AUTO_INCREMENT PRIMARY KEY,
    id_jugador INT NOT NULL,
    mapa VARCHAR(30) NOT NULL,
    posicion INT NOT NULL,
    eliminaciones INT NOT NULL,
    puntos DECIMAL(6,2) NOT NULL,

    FOREIGN KEY(id_jugador)
    REFERENCES jugadores(id_jugador)
);