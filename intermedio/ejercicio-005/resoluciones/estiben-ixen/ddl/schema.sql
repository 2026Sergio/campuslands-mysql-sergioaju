CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS servicios;

CREATE TABLE servicios(
    id_servicio INT AUTO_INCREMENT PRIMARY KEY,
    placa VARCHAR(10) NOT NULL UNIQUE,
    propietario VARCHAR(60) NOT NULL,
    marca VARCHAR(30) NOT NULL,
    servicio VARCHAR(30) NOT NULL,
    costo DECIMAL(8,2) NOT NULL,
    estado ENUM('Pendiente','En proceso','Finalizado') DEFAULT 'Pendiente'
);