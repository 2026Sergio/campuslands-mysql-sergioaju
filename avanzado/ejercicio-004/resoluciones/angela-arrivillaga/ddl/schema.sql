-- campuslands mysql - avanzado ejercicio 004
-- ddl/schema.sql

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

-- desactivamos temporales de llaves foraneas por limpieza
SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS historial_motos;
DROP TABLE IF EXISTS motos;
SET FOREIGN_KEY_CHECKS = 1;

-- 1. Tabla principal: inventario de motos en el garaje
CREATE TABLE motos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    marca VARCHAR(80) NOT NULL,
    modelo VARCHAR(80) NOT NULL,
    cilindraje INT NOT NULL,
    precio DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    estado ENUM('disponible', 'mantenimiento', 'vendida') NOT NULL DEFAULT 'disponible',
    creado_en DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;

-- 2. Tabla de auditoria/historial
CREATE TABLE historial_motos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    moto_id INT NOT NULL,
    mensaje VARCHAR(255) NOT NULL,
    fecha DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (moto_id) REFERENCES motos(id) ON DELETE CASCADE
) ENGINE=InnoDB;