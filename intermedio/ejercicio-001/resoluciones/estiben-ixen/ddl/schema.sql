CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS jugadores;
DROP TABLE IF EXISTS equipos;

CREATE TABLE equipos(
    id_equipo INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    region VARCHAR(30) NOT NULL,
    entrenador VARCHAR(60) NOT NULL,
    estado ENUM('Activo','Inactivo') DEFAULT 'Activo'
);

CREATE TABLE jugadores(
    id_jugador INT AUTO_INCREMENT PRIMARY KEY,
    id_equipo INT NOT NULL,
    nickname VARCHAR(40) NOT NULL,
    nombre_real VARCHAR(80) NOT NULL,
    edad INT NOT NULL,
    rol ENUM('Top','Jungla','Medio','ADC','Soporte') NOT NULL,
    puntaje DECIMAL(6,2) NOT NULL,
    estado ENUM('Activo','Suspendido') DEFAULT 'Activo',

    FOREIGN KEY (id_equipo)
    REFERENCES equipos(id_equipo)
);