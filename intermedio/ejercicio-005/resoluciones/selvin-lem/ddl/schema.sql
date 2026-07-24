CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS taller_servicios_registro;

CREATE TABLE taller_servicios_registro (
  id_servicio INT AUTO_INCREMENT PRIMARY KEY,
  cliente VARCHAR(50) NOT NULL,
  mecanico VARCHAR(50) NOT NULL,
  tipo_servicio VARCHAR(60) NOT NULL,
  costo DECIMAL(8,2) NOT NULL DEFAULT 0.00,
  fecha_servicio DATE NOT NULL,
  estado ENUM('pendiente','en_proceso','finalizada') NOT NULL DEFAULT 'pendiente'
);