-- DDL: Identificación única con PRIMARY KEY para Inventario de Skins
CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS skins_basico;

CREATE TABLE skins_basico (
    skin_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_skin VARCHAR(50) NOT NULL,
    tipo_arma VARCHAR(30) NOT NULL,
    rareza ENUM('Común', 'Rara', 'Épica', 'Legendaria') NOT NULL DEFAULT 'Común',
    precio_usd DECIMAL(8, 2) NOT NULL CHECK (precio_usd >= 0.00),
    equipada BOOLEAN NOT NULL DEFAULT FALSE,
    estado ENUM('disponible', 'bloqueada') NOT NULL DEFAULT 'disponible'
) ENGINE=InnoDB;
