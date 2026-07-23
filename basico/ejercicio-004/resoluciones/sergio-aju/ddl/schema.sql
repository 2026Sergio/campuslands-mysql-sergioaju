DROP DATABASE IF EXISTS db_garaje_motos;
CREATE DATABASE db_garaje_motos CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE db_garaje_motos;

CREATE TABLE motos (
    moto_id INT AUTO_INCREMENT PRIMARY KEY,
    marca VARCHAR(40) NOT NULL,
    modelo VARCHAR(50) NOT NULL,
    cilindrada INT UNSIGNED NOT NULL,
    precio_alquiler_dia DECIMAL(6,2) UNSIGNED NOT NULL,
    disponible BOOLEAN DEFAULT TRUE,
    fecha_ingreso DATETIME DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;