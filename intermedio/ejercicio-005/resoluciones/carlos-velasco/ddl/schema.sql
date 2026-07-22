-- Campuslands MySQL - Intermedio Ejercicio 005
-- Tema: Subconsultas para taller mecánico de motos

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS servicios;
DROP TABLE IF EXISTS motos;

SET FOREIGN_KEY_CHECKS = 1;


CREATE TABLE motos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    marca VARCHAR(50) NOT NULL,
    modelo VARCHAR(80) NOT NULL,
    cilindrada INT NOT NULL,
    placa VARCHAR(10) NOT NULL UNIQUE,
    propietario VARCHAR(100) NOT NULL,
    estado ENUM('Activo','Inactivo') NOT NULL DEFAULT 'Activo',

    CHECK (cilindrada > 0)
);


CREATE TABLE servicios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    moto_id INT NOT NULL,
    descripcion VARCHAR(120) NOT NULL,
    costo DECIMAL(10,2) NOT NULL,
    fecha_servicio DATE NOT NULL,
    mecanico VARCHAR(100) NOT NULL,
    estado ENUM('Pendiente','Finalizado') NOT NULL DEFAULT 'Pendiente',

    CONSTRAINT fk_servicio_moto
        FOREIGN KEY (moto_id)
        REFERENCES motos(id),

    CHECK (costo >= 0)
);