-- campuslands mysql - intermedio ejercicio 003
-- creacion de base de datos y tabla para inventario de skins shooter

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

-- eliminamos la tabla si existe para evitar conflictos
DROP TABLE IF EXISTS skins;

-- tabla de inventario de skins
CREATE TABLE skins (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    tipo_arma VARCHAR(50) NOT NULL,
    rareza ENUM('comun', 'raro', 'epico', 'legendario') NOT NULL DEFAULT 'comun',
    precio DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    estado ENUM('disponible', 'bloqueado', 'descatalogado') NOT NULL DEFAULT 'disponible',
    creado_en DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);