-- campuslands mysql - intermedio ejercicio 004
-- creacion de la base de datos y la tabla motos para el garaje

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

-- eliminamos la tabla si ya existe para evitar errores
DROP TABLE IF EXISTS motos;

-- tabla principal para registrar las motos del garaje
CREATE TABLE motos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    marca VARCHAR(80) NOT NULL,
    modelo VARCHAR(80) NOT NULL,
    cilindraje INT NOT NULL,
    precio DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    estado ENUM('disponible', 'mantenimiento', 'vendida') NOT NULL DEFAULT 'disponible',
    creado_en DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);