-- DDL: Tabla de Inventario de Skins para análisis con GROUP BY
CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS inventario_skins_intermedio;

CREATE TABLE inventario_skins_intermedio (
    skin_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_skin VARCHAR(50) NOT NULL,
    categoria_arma ENUM('Rifle', 'Sniper', 'Pistola', 'Subfusil', 'Cuchillo') NOT NULL,
    rareza ENUM('Común', 'Rara', 'Épica', 'Legendaria') NOT NULL,
    precio_mercado DECIMAL(8, 2) NOT NULL CHECK (precio_mercado >= 0.00),
    stock_disponible INT NOT NULL DEFAULT 1 CHECK (stock_disponible >= 0),
    estado ENUM('en_venta', 'agotado', 'descatalogado') NOT NULL DEFAULT 'en_venta'
) ENGINE=InnoDB;
