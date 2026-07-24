DROP DATABASE IF EXISTS taller_mecanico_motos;
CREATE DATABASE taller_mecanico_motos;
USE taller_mecanico_motos;

CREATE TABLE clientes(
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(80) NOT NULL,
    dpi VARCHAR(20) NOT NULL UNIQUE,
    telefono VARCHAR(20),
    correo VARCHAR(100),
    direccion VARCHAR(150),
    fecha_registro DATE
);

CREATE TABLE motos(
    id_moto INT AUTO_INCREMENT PRIMARY KEY,
    placa VARCHAR(15) NOT NULL UNIQUE,
    marca VARCHAR(50) NOT NULL,
    modelo VARCHAR(50) NOT NULL,
    anio INT,
    color VARCHAR(30),
    kilometraje INT,
    id_cliente INT NOT NULL,
    FOREIGN KEY(id_cliente)
        REFERENCES clientes(id_cliente)
);

CREATE TABLE mecanicos(
    id_mecanico INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(80) NOT NULL,
    especialidad VARCHAR(60),
    telefono VARCHAR(20),
    salario DECIMAL(10,2)
);

CREATE TABLE servicios(
    id_servicio INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(80) NOT NULL,
    descripcion VARCHAR(200),
    precio DECIMAL(10,2)
);

CREATE TABLE ordenes_servicio(
    id_orden INT AUTO_INCREMENT PRIMARY KEY,
    id_moto INT NOT NULL,
    id_mecanico INT NOT NULL,
    id_servicio INT NOT NULL,
    fecha_ingreso DATE,
    fecha_salida DATE,
    estado ENUM('Pendiente','En Proceso','Finalizado'),
    total DECIMAL(10,2),
    FOREIGN KEY(id_moto)
        REFERENCES motos(id_moto),
    FOREIGN KEY(id_mecanico)
        REFERENCES mecanicos(id_mecanico),
    FOREIGN KEY(id_servicio)
        REFERENCES servicios(id_servicio)
);
