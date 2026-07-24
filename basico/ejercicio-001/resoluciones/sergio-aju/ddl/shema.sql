DROP DATABASE IF EXISTS db_guatemala;
CREATE DATABASE db_guatemala;
USE db_guatemala;

CREATE TABLE personas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    edad INT NOT NULL,
    departamento VARCHAR(50) NOT NULL,
    puntos INT DEFAULT 0,
    activo BOOLEAN DEFAULT TRUE
);