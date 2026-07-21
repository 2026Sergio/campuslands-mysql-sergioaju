-- Campuslands MySQL - Avanzado Ejercicio 001
-- Tema: Transacciones

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS historial_fichajes;
DROP TABLE IF EXISTS jugadores;
DROP TABLE IF EXISTS equipos;

CREATE TABLE equipos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(80) NOT NULL UNIQUE,
    region VARCHAR(50) NOT NULL,
    entrenador VARCHAR(100) NOT NULL,
    presupuesto DECIMAL(10,2) NOT NULL DEFAULT 0,
    estado ENUM('Activo','Eliminado') NOT NULL DEFAULT 'Activo',

    CHECK (presupuesto >= 0)
);

CREATE TABLE jugadores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    nickname VARCHAR(50) NOT NULL UNIQUE,
    rol ENUM('Top','Jungla','Mid','ADC','Support') NOT NULL,
    valor DECIMAL(10,2) NOT NULL,
    equipo_id INT NOT NULL,

    CHECK (valor > 0),

    CONSTRAINT fk_jugador_equipo
        FOREIGN KEY (equipo_id)
        REFERENCES equipos(id)
);

CREATE TABLE historial_fichajes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    jugador_id INT NOT NULL,
    equipo_origen INT NOT NULL,
    equipo_destino INT NOT NULL,
    costo DECIMAL(10,2) NOT NULL,
    fecha DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_historial_jugador
        FOREIGN KEY (jugador_id)
        REFERENCES jugadores(id),

    CONSTRAINT fk_historial_origen
        FOREIGN KEY (equipo_origen)
        REFERENCES equipos(id),

    CONSTRAINT fk_historial_destino
        FOREIGN KEY (equipo_destino)
        REFERENCES equipos(id)
);