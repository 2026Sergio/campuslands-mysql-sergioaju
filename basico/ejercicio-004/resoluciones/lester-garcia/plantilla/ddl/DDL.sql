DROP DATABASE IF EXISTS garaje_motos;
CREATE DATABASE garaje_motos;
USE garaje_motos;

CREATE TABLE propietarios (
    id_propietario INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(80) NOT NULL,
    dpi VARCHAR(20) NOT NULL UNIQUE,
    telefono VARCHAR(15) NOT NULL,
    ciudad VARCHAR(50) NOT NULL
);

CREATE TABLE marcas (
    id_marca INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(40) NOT NULL,
    pais_origen VARCHAR(40) NOT NULL
);

CREATE TABLE motos (
    id_moto INT AUTO_INCREMENT PRIMARY KEY,
    placa VARCHAR(10) NOT NULL UNIQUE,
    modelo VARCHAR(50) NOT NULL,
    anio YEAR NOT NULL,
    color VARCHAR(30) NOT NULL,
    cilindraje INT NOT NULL,
    id_marca INT NOT NULL,
    id_propietario INT NOT NULL,
    FOREIGN KEY (id_marca) REFERENCES marcas(id_marca),
    FOREIGN KEY (id_propietario) REFERENCES propietarios(id_propietario)
);

CREATE TABLE mantenimientos (
    id_mantenimiento INT AUTO_INCREMENT PRIMARY KEY,
    id_moto INT NOT NULL,
    fecha DATE NOT NULL,
    tipo_servicio VARCHAR(60) NOT NULL,
    costo DECIMAL(8,2) NOT NULL,
    observaciones VARCHAR(150),
    FOREIGN KEY (id_moto) REFERENCES motos(id_moto)
);