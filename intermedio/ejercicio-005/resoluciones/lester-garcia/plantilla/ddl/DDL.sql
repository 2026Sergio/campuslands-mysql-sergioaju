DROP DATABASE IF EXISTS taller_mecanico_motos;

CREATE DATABASE taller_mecanico_motos;

USE taller_mecanico_motos;

CREATE TABLE clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(80) NOT NULL,
    documento VARCHAR(20) UNIQUE NOT NULL,
    telefono VARCHAR(20) NOT NULL
);

CREATE TABLE motos (
    id_moto INT AUTO_INCREMENT PRIMARY KEY,
    placa VARCHAR(10) UNIQUE NOT NULL,
    marca VARCHAR(50) NOT NULL,
    modelo VARCHAR(50) NOT NULL,
    anio YEAR NOT NULL,
    id_cliente INT NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);

CREATE TABLE mecanicos (
    id_mecanico INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(80) NOT NULL,
    especialidad VARCHAR(60) NOT NULL
);

CREATE TABLE reparaciones (
    id_reparacion INT AUTO_INCREMENT PRIMARY KEY,
    id_moto INT NOT NULL,
    id_mecanico INT NOT NULL,
    descripcion VARCHAR(120) NOT NULL,
    costo DECIMAL(10,2) NOT NULL,
    fecha DATE NOT NULL,
    FOREIGN KEY (id_moto) REFERENCES motos(id_moto),
    FOREIGN KEY (id_mecanico) REFERENCES mecanicos(id_mecanico)
);