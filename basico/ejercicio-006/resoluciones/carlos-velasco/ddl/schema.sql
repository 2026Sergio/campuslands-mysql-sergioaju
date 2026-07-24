-- Campuslands MySQL - Básico Ejercicio 006
-- Tema: WHERE para autos hiperdeportivos

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS autos_hiperdeportivos;

SET FOREIGN_KEY_CHECKS = 1;


CREATE TABLE autos_hiperdeportivos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    marca VARCHAR(50) NOT NULL,
    modelo VARCHAR(80) NOT NULL,
    pais_origen VARCHAR(50) NOT NULL,
    potencia_hp INT NOT NULL,
    velocidad_maxima INT NOT NULL,
    precio DECIMAL(12,2) NOT NULL,
    combustible ENUM('Gasolina','Híbrido','Eléctrico') NOT NULL,
    disponible ENUM('Sí','No') NOT NULL DEFAULT 'Sí',

    CHECK (potencia_hp > 0),
    CHECK (velocidad_maxima > 0),
    CHECK (precio >= 0)
);