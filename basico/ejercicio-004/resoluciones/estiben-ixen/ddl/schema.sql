-- Campuslands MySQL - Básico Ejercicio 004
-- Tema: Garage de Motos
-- Ejecutar este archivo antes de inserts.sql

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS garage_motos;

CREATE TABLE garage_motos (
    id_moto INT AUTO_INCREMENT PRIMARY KEY,
    placa VARCHAR(50) NOT NULL,
    nombre_propietario VARCHAR(60) NOT NULL,
    espacio_parqueo VARCHAR(50) UNIQUE NOT NULL,
    fecha_ingreso DATETIME DEFAULT CURRENT_TIMESTAMP
);