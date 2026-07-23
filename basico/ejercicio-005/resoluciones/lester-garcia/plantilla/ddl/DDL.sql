DROP DATABASE IF EXISTS taller_mecanico_motos;
CREATE DATABASE taller_mecanico_motos;
USE taller_mecanico_motos;

CREATE TABLE clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(80) NOT NULL,
    telefono VARCHAR(15) NOT NULL,
    ciudad VARCHAR(50) NOT NULL
);

CREATE TABLE mecanicos (
    id_mecanico INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(80) NOT NULL,
    especialidad VARCHAR(50) NOT NULL,
    experiencia_anios INT NOT NULL
);

CREATE TABLE motocicletas (
    id_motocicleta INT AUTO_INCREMENT PRIMARY KEY,
    placa VARCHAR(10) NOT NULL UNIQUE,
    marca VARCHAR(40) NOT NULL,
    modelo VARCHAR(50) NOT NULL,
    anio YEAR NOT NULL,
    id_cliente INT NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);

CREATE TABLE reparaciones (
    id_reparacion INT AUTO_INCREMENT PRIMARY KEY,
    id_motocicleta INT NOT NULL,
    id_mecanico INT NOT NULL,
    fecha DATE NOT NULL,
    servicio VARCHAR(80) NOT NULL,
    costo DECIMAL(8,2) NOT NULL,
    estado ENUM('Pendiente','En proceso','Finalizada') NOT NULL,
    FOREIGN KEY (id_motocicleta) REFERENCES motocicletas(id_motocicleta),
    FOREIGN KEY (id_mecanico) REFERENCES mecanicos(id_mecanico)
);