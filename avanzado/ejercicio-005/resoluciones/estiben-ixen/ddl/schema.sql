CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

DROP TABLE IF EXISTS ordenes_servicio;
DROP TABLE IF EXISTS motos;


CREATE TABLE motos (
    id_moto INT AUTO_INCREMENT PRIMARY KEY,
    placa VARCHAR(10) NOT NULL UNIQUE,
    marca VARCHAR(50) NOT NULL,
    modelo VARCHAR(50) NOT NULL,
    cilindrada INT NOT NULL,
    propietario VARCHAR(100) NOT NULL,
    telefono VARCHAR(20),
    fecha_registro DATETIME DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE ordenes_servicio (
    id_orden INT AUTO_INCREMENT PRIMARY KEY,
    id_moto INT NOT NULL,
    servicio VARCHAR(100) NOT NULL,
    mecanico VARCHAR(100) NOT NULL,
    costo DECIMAL(10,2) NOT NULL,
    estado ENUM('pendiente','en_proceso','finalizado') DEFAULT 'pendiente',
    fecha_ingreso DATE NOT NULL,
    fecha_entrega DATE NULL,

    CONSTRAINT fk_orden_moto
    FOREIGN KEY(id_moto)
    REFERENCES motos(id_moto)
);


CREATE INDEX idx_moto_placa
ON motos(placa);


CREATE INDEX idx_moto_marca
ON motos(marca);


CREATE INDEX idx_orden_estado
ON ordenes_servicio(estado);


CREATE INDEX idx_orden_fecha_ingreso
ON ordenes_servicio(fecha_ingreso);


CREATE INDEX idx_orden_moto_estado
ON ordenes_servicio(id_moto, estado);