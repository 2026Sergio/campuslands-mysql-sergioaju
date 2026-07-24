DROP DATABASE IF EXISTS garaje_motos;

CREATE DATABASE garaje_motos;

USE garaje_motos;

CREATE TABLE propietarios (
    id_propietario INT AUTO_INCREMENT PRIMARY KEY,
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
    id_propietario INT NOT NULL,
    FOREIGN KEY (id_propietario) REFERENCES propietarios(id_propietario)
);

CREATE TABLE servicios (
    id_servicio INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(80) NOT NULL,
    costo DECIMAL(10,2) NOT NULL
);

CREATE TABLE historial_servicios (
    id_historial INT AUTO_INCREMENT PRIMARY KEY,
    id_moto INT NOT NULL,
    id_servicio INT NOT NULL,
    fecha DATE NOT NULL,
    cantidad INT NOT NULL,
    FOREIGN KEY (id_moto) REFERENCES motos(id_moto),
    FOREIGN KEY (id_servicio) REFERENCES servicios(id_servicio)
);