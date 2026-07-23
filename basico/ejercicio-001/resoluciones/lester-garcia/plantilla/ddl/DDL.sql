
CREATE DATABASE torneo_esports_moba;
USE torneo_esports_moba;

CREATE TABLE equipos (
    id_equipo INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL UNIQUE,
    pais VARCHAR(40) NOT NULL,
    fecha_fundacion DATE NOT NULL,
    entrenador VARCHAR(60) NOT NULL
);

CREATE TABLE jugadores (
    id_jugador INT AUTO_INCREMENT PRIMARY KEY,
    nickname VARCHAR(40) NOT NULL UNIQUE,
    nombre VARCHAR(80) NOT NULL,
    rol ENUM('Top','Jungla','Mid','ADC','Support') NOT NULL,
    edad INT NOT NULL,
    nacionalidad VARCHAR(40) NOT NULL,
    id_equipo INT NOT NULL,
    FOREIGN KEY (id_equipo) REFERENCES equipos(id_equipo)
);

CREATE TABLE torneos (
    id_torneo INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(80) NOT NULL,
    ciudad VARCHAR(50) NOT NULL,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE NOT NULL,
    premio DECIMAL(12,2) NOT NULL
);

CREATE TABLE partidas (
    id_partida INT AUTO_INCREMENT PRIMARY KEY,
    id_torneo INT NOT NULL,
    equipo_local INT NOT NULL,
    equipo_visitante INT NOT NULL,
    ganador INT NOT NULL,
    fecha DATE NOT NULL,
    duracion_minutos INT NOT NULL,
    FOREIGN KEY (id_torneo) REFERENCES torneos(id_torneo),
    FOREIGN KEY (equipo_local) REFERENCES equipos(id_equipo),
    FOREIGN KEY (equipo_visitante) REFERENCES equipos(id_equipo),
    FOREIGN KEY (ganador) REFERENCES equipos(id_equipo)
);