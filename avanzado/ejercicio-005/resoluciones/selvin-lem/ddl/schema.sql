CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS taller_servicios_indexados;

CREATE TABLE taller_servicios_indexados (
  id_servicio INT AUTO_INCREMENT PRIMARY KEY,
  cliente VARCHAR(50) NOT NULL,
  mecanico VARCHAR(50) NOT NULL,
  tipo_servicio VARCHAR(60) NOT NULL,
  costo DECIMAL(8,2) NOT NULL DEFAULT 0.00,
  fecha_servicio DATE NOT NULL,
  estado ENUM('pendiente','en_proceso','finalizada') NOT NULL DEFAULT 'pendiente'
);

-- Indice simple: acelera busquedas y filtros por mecanico
CREATE INDEX idx_mecanico ON taller_servicios_indexados (mecanico);

-- Indice compuesto: acelera consultas que filtran por estado y ordenan por fecha
CREATE INDEX idx_estado_fecha ON taller_servicios_indexados (estado, fecha_servicio);

-- Indice unico: evita que un mismo cliente tenga dos servicios en la misma fecha exacta con el mismo tipo
CREATE UNIQUE INDEX idx_unico_cliente_servicio_fecha ON taller_servicios_indexados (cliente, tipo_servicio, fecha_servicio);