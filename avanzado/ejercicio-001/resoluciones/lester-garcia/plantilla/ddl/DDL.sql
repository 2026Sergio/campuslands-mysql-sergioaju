DROP DATABASE IF EXISTS torneo_esports_moba;
CREATE DATABASE torneo_esports_moba;
USE torneo_esports_moba;

CREATE TABLE equipos (
    id_equipo INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(80) NOT NULL UNIQUE,
    ciudad VARCHAR(80),
    entrenador VARCHAR(80),
    fecha_creacion DATE,
    activo BOOLEAN DEFAULT TRUE
);

CREATE TABLE jugadores (
    id_jugador INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(80) NOT NULL,
    nickname VARCHAR(50) NOT NULL UNIQUE,
    rol ENUM('Top','Jungla','Mid','ADC','Support') NOT NULL,
    edad INT,
    nacionalidad VARCHAR(50),
    id_equipo INT,
    FOREIGN KEY (id_equipo)
        REFERENCES equipos(id_equipo)
);

CREATE TABLE torneos (
    id_torneo INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    ciudad VARCHAR(80),
    fecha_inicio DATE,
    fecha_fin DATE,
    premio DECIMAL(12,2)
);

CREATE TABLE partidas (
    id_partida INT AUTO_INCREMENT PRIMARY KEY,
    id_torneo INT NOT NULL,
    equipo_local INT NOT NULL,
    equipo_visitante INT NOT NULL,
    ganador INT,
    fecha DATETIME,
    FOREIGN KEY (id_torneo)
        REFERENCES torneos(id_torneo),
    FOREIGN KEY (equipo_local)
        REFERENCES equipos(id_equipo),
    FOREIGN KEY (equipo_visitante)
        REFERENCES equipos(id_equipo),
    FOREIGN KEY (ganador)
        REFERENCES equipos(id_equipo)
);

CREATE TABLE estadisticas_jugador (
    id_estadistica INT AUTO_INCREMENT PRIMARY KEY,
    id_partida INT,
    id_jugador INT,
    asesinatos INT,
    muertes INT,
    asistencias INT,
    oro INT,
    FOREIGN KEY (id_partida)
        REFERENCES partidas(id_partida),
    FOREIGN KEY (id_jugador)
        REFERENCES jugadores(id_jugador)
);