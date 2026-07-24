DROP DATABASE IF EXISTS db_garaje_motos_triggers;
CREATE DATABASE db_garaje_motos_triggers;
USE db_garaje_motos_triggers;

CREATE TABLE motos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    marca VARCHAR(40) NOT NULL,
    modelo VARCHAR(50) NOT NULL,
    cilindrada INT UNSIGNED NOT NULL,
    precio_reparacion DECIMAL(8,2) NOT NULL,
    estado ENUM('Pendiente', 'En Reparación', 'Finalizada') DEFAULT 'Pendiente'
);

CREATE TABLE bitacora_motos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_moto INT NOT NULL,
    detalle VARCHAR(255) NOT NULL,
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);