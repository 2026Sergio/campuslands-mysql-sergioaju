CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

-- Eliminar tabla previa para garantizar una ejecución limpia desde cero
DROP TABLE IF EXISTS skins_shooter_groupby;

-- Creación de la tabla con tipos de datos estrictos y restricciones de validación
CREATE TABLE skins_shooter_groupby (
  id INT AUTO_INCREMENT PRIMARY KEY,
  codigo_skin VARCHAR(50) NOT NULL UNIQUE,
  nombre_skin VARCHAR(100) NOT NULL,
  arma_asociada VARCHAR(60) NOT NULL,
  rareza ENUM('Común', 'Rara', 'Épica', 'Legendaria', 'Contrabando') NOT NULL,
  precio_mercado DECIMAL(10,2) NOT NULL DEFAULT 0.00,
  desgaste ENUM('Factory New', 'Minimal Wear', 'Field-Tested', 'Well-Worn', 'Battle-Scarred') NOT NULL,
  estado_inventario ENUM('disponible', 'equipado', 'en_venta', 'archivado') NOT NULL DEFAULT 'disponible',
  CONSTRAINT chk_precio_groupby CHECK (precio_mercado >= 0.00)
);