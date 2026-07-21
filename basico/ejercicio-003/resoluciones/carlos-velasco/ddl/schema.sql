-- Campuslands MySQL - basico ejercicio 003
-- Ejecuta este archivo antes de inserts.sql.

-- Tema: PRIMARY KEY

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS inventario_skins;

SET FOREIGN_KEY_CHECKS = 1;

CREATE TABLE inventario_skins (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_skin VARCHAR(100) NOT NULL,
    arma VARCHAR(80) NOT NULL,
    rareza ENUM('Comun','Rara','Epica','Legendaria') NOT NULL,
    precio DECIMAL(8,2) NOT NULL,
    disponible BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_ingreso DATE NOT NULL,

    CHECK (precio >= 0)
);
