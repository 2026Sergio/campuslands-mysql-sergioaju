DROP DATABASE IF EXISTS db_taller_motos;
CREATE DATABASE db_taller_motos;
USE db_taller_motos;

CREATE TABLE mecanicos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    especialidad VARCHAR(40) NOT NULL,
    experiencia_anios INT UNSIGNED NOT NULL
);

CREATE TABLE reparaciones (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cliente VARCHAR(50) NOT NULL,
    moto VARCHAR(50) NOT NULL,
    costo DECIMAL(8,2) NOT NULL CHECK (costo >= 0.00),
    id_mecanico INT NOT NULL,
    FOREIGN KEY (id_mecanico) REFERENCES mecanicos(id) ON DELETE CASCADE
);