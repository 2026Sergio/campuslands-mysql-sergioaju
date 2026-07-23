-- Campuslands MySQL - Básico Ejercicio 009
-- Tema: DELETE controlado para kickboxing

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS combates_kickboxing;

SET FOREIGN_KEY_CHECKS = 1;


CREATE TABLE combates_kickboxing (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_luchador VARCHAR(100) NOT NULL,
    categoria VARCHAR(50) NOT NULL,
    edad INT NOT NULL,
    victorias INT NOT NULL DEFAULT 0,
    derrotas INT NOT NULL DEFAULT 0,
    peso DECIMAL(5,2) NOT NULL,
    estado ENUM('Activo','Retirado','Suspendido') NOT NULL DEFAULT 'Activo',
    fecha_ultimo_combate DATE NOT NULL,

    CHECK (edad >= 18),
    CHECK (victorias >= 0),
    CHECK (derrotas >= 0),
    CHECK (peso > 0)
);