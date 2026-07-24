-- Campuslands MySQL - Básico Ejercicio 008
-- Tema: UPDATE para fútbol sala

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS jugadores_futsal;

SET FOREIGN_KEY_CHECKS = 1;


CREATE TABLE jugadores_futsal (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    equipo VARCHAR(100) NOT NULL,
    posicion ENUM('Portero','Cierre','Ala','Pivot') NOT NULL,
    edad INT NOT NULL,
    goles INT NOT NULL DEFAULT 0,
    asistencias INT NOT NULL DEFAULT 0,
    salario DECIMAL(10,2) NOT NULL,
    estado ENUM('Activo','Lesionado','Suspendido') NOT NULL DEFAULT 'Activo',

    CHECK (edad >= 16),
    CHECK (goles >= 0),
    CHECK (asistencias >= 0),
    CHECK (salario >= 0)
);