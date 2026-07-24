DROP DATABASE IF EXISTS garaje_motos;
CREATE DATABASE garaje_motos;
USE garaje_motos;

CREATE TABLE clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(80) NOT NULL,
    telefono VARCHAR(20),
    correo VARCHAR(100),
    fecha_registro DATE
);

CREATE TABLE motos (
    id_moto INT AUTO_INCREMENT PRIMARY KEY,
    placa VARCHAR(15) NOT NULL UNIQUE,
    marca VARCHAR(50),
    modelo VARCHAR(50),
    anio INT,
    id_cliente INT,
    FOREIGN KEY (id_cliente)
        REFERENCES clientes(id_cliente)
);

CREATE TABLE servicios (
    id_servicio INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(80) NOT NULL,
    precio DECIMAL(10,2) NOT NULL
);

CREATE TABLE ordenes_servicio (
    id_orden INT AUTO_INCREMENT PRIMARY KEY,
    id_moto INT NOT NULL,
    id_servicio INT NOT NULL,
    fecha_ingreso DATE,
    estado ENUM('Pendiente','En Proceso','Finalizado'),
    FOREIGN KEY (id_moto)
        REFERENCES motos(id_moto),
    FOREIGN KEY (id_servicio)
        REFERENCES servicios(id_servicio)
);

CREATE TABLE auditoria_ordenes (
    id_auditoria INT AUTO_INCREMENT PRIMARY KEY,
    accion VARCHAR(20),
    id_orden INT,
    descripcion VARCHAR(255),
    fecha DATETIME
);