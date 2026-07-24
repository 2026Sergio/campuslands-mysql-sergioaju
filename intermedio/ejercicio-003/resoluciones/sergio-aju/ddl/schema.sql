DROP DATABASE IF EXISTS db_shooter_skins;
CREATE DATABASE db_shooter_skins;
USE db_shooter_skins;

CREATE TABLE skins (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL UNIQUE,
    arma VARCHAR(40) NOT NULL,
    rareza ENUM('Común', 'Rara', 'Épica', 'Legendaria', 'Mítica') NOT NULL,
    precio DECIMAL(8,2) NOT NULL CHECK (precio >= 0.00),
    estado ENUM('Disponible', 'Agotada', 'Exclusiva') DEFAULT 'Disponible'
);