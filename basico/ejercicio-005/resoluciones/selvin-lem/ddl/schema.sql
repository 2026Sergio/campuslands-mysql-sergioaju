CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS taller_ordenes_servicio;

CREATE TABLE taller_ordenes_servicio (
  id_orden INT AUTO_INCREMENT PRIMARY KEY,
  cliente VARCHAR(50) NOT NULL,
  mecanico VARCHAR(50) NOT NULL,
  tipo_servicio VARCHAR(60) NOT NULL,
  horas_trabajo DECIMAL(4,1) NOT NULL,
  costo_total DECIMAL(8,2) NOT NULL DEFAULT 0.00,
  fecha_orden DATE NOT NULL,
  garantia BOOLEAN NOT NULL DEFAULT FALSE,
  estado ENUM('pendiente','en_proceso','finalizada','entregada') NOT NULL DEFAULT 'pendiente'
);