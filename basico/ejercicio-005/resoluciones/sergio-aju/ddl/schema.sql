DROP DATABASE IF EXISTS db_taller_motos;
CREATE DATABASE db_taller_motos CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE db_taller_motos;

CREATE TABLE reparaciones (
    reparacion_id INT AUTO_INCREMENT PRIMARY KEY,
    cliente VARCHAR(60) NOT NULL,
    moto_modelo VARCHAR(50) NOT NULL,
    servicio VARCHAR(50) NOT NULL,
    costo_mano_obra DECIMAL(7,2) UNSIGNED NOT NULL,
    estado VARCHAR(30) NOT NULL,
    fecha_ingreso DATETIME DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;