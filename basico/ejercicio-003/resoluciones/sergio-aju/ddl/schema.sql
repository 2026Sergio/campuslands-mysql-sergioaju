DROP DATABASE IF EXISTS db_inventario_skins;
CREATE DATABASE db_inventario_skins CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE db_inventario_skins;

CREATE TABLE skins (
    skin_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_skin VARCHAR(60) NOT NULL,
    arma VARCHAR(40) NOT NULL,
    rareza VARCHAR(30) NOT NULL,
    precio_dolares DECIMAL(6,2) UNSIGNED NOT NULL,
    disponible BOOLEAN DEFAULT TRUE,
    fecha_adquisicion DATETIME DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;