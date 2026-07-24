CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS garaje_reparaciones;

CREATE TABLE garaje_reparaciones (
  id_reparacion INT AUTO_INCREMENT PRIMARY KEY,
  propietario VARCHAR(50) NOT NULL,
  marca VARCHAR(40) NOT NULL,
  tipo_servicio VARCHAR(60) NOT NULL,
  costo DECIMAL(8,2) NOT NULL DEFAULT 0.00,
  fecha_servicio DATE NOT NULL,
  estado ENUM('pendiente','en_proceso','finalizada') NOT NULL DEFAULT 'pendiente'
);