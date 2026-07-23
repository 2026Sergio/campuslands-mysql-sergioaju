CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS garaje_motos;

CREATE TABLE garaje_motos (
  id_moto INT AUTO_INCREMENT PRIMARY KEY,
  propietario VARCHAR(50) NOT NULL,
  marca VARCHAR(40) NOT NULL,
  modelo VARCHAR(40) NOT NULL,
  cilindraje SMALLINT UNSIGNED NOT NULL,
  costo_reparacion DECIMAL(8,2) NOT NULL DEFAULT 0.00,
  fecha_ingreso DATE NOT NULL,
  lista_para_entrega BOOLEAN NOT NULL DEFAULT FALSE,
  estado ENUM('en_reparacion','esperando_repuesto','lista','entregada') NOT NULL DEFAULT 'en_reparacion'
);