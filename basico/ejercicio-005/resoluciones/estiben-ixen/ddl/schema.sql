-- Campuslands MySQL - Básico Ejercicio 005
-- Tema: Taller Mecánico de Motos
-- Ejecutar este archivo antes de inserts.sql

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS taller_motos;

CREATE TABLE taller_motos (
    id_servicio INT AUTO_INCREMENT PRIMARY KEY,
    placa VARCHAR(20) NOT NULL,
    propietario VARCHAR(60) NOT NULL,
    marca VARCHAR(40) NOT NULL,
    servicio VARCHAR(80) NOT NULL,
    costo DECIMAL(8,2) NOT NULL,
    estado ENUM('Pendiente','En proceso','Finalizado') NOT NULL,
    fecha_ingreso DATE NOT NULL
);