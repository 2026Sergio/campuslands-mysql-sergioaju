-- Campuslands MySQL - Básico Ejercicio 007
-- Tema: ORDER BY para liga de fútbol

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS equipos_futbol;

SET FOREIGN_KEY_CHECKS = 1;


CREATE TABLE equipos_futbol (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_equipo VARCHAR(80) NOT NULL,
    ciudad VARCHAR(80) NOT NULL,
    entrenador VARCHAR(100) NOT NULL,
    partidos_jugados INT NOT NULL,
    partidos_ganados INT NOT NULL,
    goles_favor INT NOT NULL,
    puntos INT NOT NULL,
    presupuesto DECIMAL(12,2) NOT NULL,
    estado ENUM('Activo','Inactivo') NOT NULL DEFAULT 'Activo',

    CHECK (partidos_jugados >= 0),
    CHECK (partidos_ganados >= 0),
    CHECK (goles_favor >= 0),
    CHECK (puntos >= 0),
    CHECK (presupuesto >= 0)
);