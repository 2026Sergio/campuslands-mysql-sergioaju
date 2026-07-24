DROP DATABASE IF EXISTS inventario_skins_shooter;
CREATE DATABASE inventario_skins_shooter;
USE inventario_skins_shooter;

CREATE TABLE jugadores (
    id_jugador INT AUTO_INCREMENT PRIMARY KEY,
    nickname VARCHAR(40) NOT NULL,
    nombre VARCHAR(80) NOT NULL,
    pais VARCHAR(40) NOT NULL,
    nivel INT NOT NULL,
    fecha_registro DATE NOT NULL
);

CREATE TABLE armas (
    id_arma INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    categoria VARCHAR(30) NOT NULL,
    fabricante VARCHAR(40) NOT NULL
);

CREATE TABLE skins (
    id_skin INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(60) NOT NULL,
    rareza ENUM('Comun','Poco Comun','Rara','Epica','Legendaria') NOT NULL,
    color_principal VARCHAR(30) NOT NULL,
    precio DECIMAL(8,2) NOT NULL,
    id_arma INT NOT NULL,
    FOREIGN KEY (id_arma) REFERENCES armas(id_arma)
);

CREATE TABLE inventario (
    id_inventario INT AUTO_INCREMENT PRIMARY KEY,
    id_jugador INT NOT NULL,
    id_skin INT NOT NULL,
    fecha_adquisicion DATE NOT NULL,
    equipada BOOLEAN NOT NULL,
    FOREIGN KEY (id_jugador) REFERENCES jugadores(id_jugador),
    FOREIGN KEY (id_skin) REFERENCES skins(id_skin)
);