-- Campuslands MySQL - Básico Ejercicio 010
-- Tema: COUNT y SUM para carreras urbanas

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS participantes_carreras;

SET FOREIGN_KEY_CHECKS = 1;


CREATE TABLE participantes_carreras (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_participante VARCHAR(100) NOT NULL,
    ciudad VARCHAR(80) NOT NULL,
    categoria ENUM('5K','10K','21K') NOT NULL,
    edad INT NOT NULL,
    posicion INT NOT NULL,
    tiempo_minutos INT NOT NULL,
    inscripcion DECIMAL(10,2) NOT NULL,
    estado ENUM('Finalizo','Abandono','Registrado') NOT NULL DEFAULT 'Registrado',

    CHECK (edad >= 16),
    CHECK (posicion > 0),
    CHECK (tiempo_minutos > 0),
    CHECK (inscripcion >= 0)
);