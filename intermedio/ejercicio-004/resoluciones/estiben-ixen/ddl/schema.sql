CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS motos;

CREATE TABLE motos(
    id_moto INT AUTO_INCREMENT PRIMARY KEY,
    placa VARCHAR(10) NOT NULL UNIQUE,
    propietario VARCHAR(60) NOT NULL,
    marca VARCHAR(30) NOT NULL,
    tipo_servicio ENUM('Mantenimiento','Reparacion','Diagnostico') NOT NULL,
    costo DECIMAL(8,2) NOT NULL,
    estado ENUM('Pendiente','En proceso','Finalizado') DEFAULT 'Pendiente'
);