-- Campuslands MySQL - Básico Ejercicio 005
-- Tema: SELECT para taller mecánico de motos

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS reparaciones;
DROP TABLE IF EXISTS motos;

SET FOREIGN_KEY_CHECKS = 1;


CREATE TABLE motos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    marca VARCHAR(50) NOT NULL,
    modelo VARCHAR(80) NOT NULL,
    cilindrada INT NOT NULL,
    año_fabricacion YEAR NOT NULL,
    placa VARCHAR(10) NOT NULL UNIQUE,
    propietario VARCHAR(100) NOT NULL,
    estado ENUM('En servicio','Finalizada','Pendiente') NOT NULL DEFAULT 'Pendiente',

    CHECK (cilindrada > 0)
);


CREATE TABLE reparaciones (
    id INT AUTO_INCREMENT PRIMARY KEY,
    moto_id INT NOT NULL,
    tipo_servicio VARCHAR(100) NOT NULL,
    costo DECIMAL(10,2) NOT NULL,
    fecha_reparacion DATE NOT NULL,
    mecanico VARCHAR(100) NOT NULL,
    estado ENUM('Pendiente','Completada') NOT NULL DEFAULT 'Pendiente',

    CONSTRAINT fk_reparacion_moto
        FOREIGN KEY (moto_id)
        REFERENCES motos(id),

    CHECK (costo >= 0)
);