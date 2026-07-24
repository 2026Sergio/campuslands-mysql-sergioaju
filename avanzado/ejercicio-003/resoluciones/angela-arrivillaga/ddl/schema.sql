-- campuslands mysql - avanzado ejercicio 003
-- ddl/schema.sql

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

-- desactivamos temporales de llaves foraneas y borramos tabla previa
SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS skins;
SET FOREIGN_KEY_CHECKS = 1;

-- tabla principal: inventario de skins
CREATE TABLE skins (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    arma VARCHAR(50) NOT NULL,
    rareza ENUM('Comun', 'Rara', 'Epica', 'Legendaria') NOT NULL DEFAULT 'Comun',
    precio DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    estado ENUM('disponible', 'agotado', 'inactivo') NOT NULL DEFAULT 'disponible',
    creado_en DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;