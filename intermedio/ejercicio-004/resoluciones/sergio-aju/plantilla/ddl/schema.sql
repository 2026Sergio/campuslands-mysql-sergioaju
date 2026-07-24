DROP DATABASE IF EXISTS db_garaje_motos;
CREATE DATABASE db_garaje_motos;
USE db_garaje_motos;

CREATE TABLE motos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    marca VARCHAR(40) NOT NULL,
    modelo VARCHAR(50) NOT NULL,
    cilindrada INT UNSIGNED NOT NULL,
    precio_reparacion DECIMAL(8,2) NOT NULL CHECK (precio_reparacion >= 0.00),
    estado ENUM('Pendiente', 'En Reparación', 'Finalizada') DEFAULT 'Pendiente'
);