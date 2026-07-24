CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS skins;

CREATE TABLE skins(
    id_skin INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    arma VARCHAR(40) NOT NULL,
    rareza ENUM('Comun','Rara','Epica','Legendaria') NOT NULL,
    precio DECIMAL(8,2) NOT NULL,
    estado ENUM('Disponible','Agotada') DEFAULT 'Disponible'
);