-- Campuslands MySQL - avanzado ejercicio 005
-- Contexto: Modulo de datos para taller mecanico de motos (Indices).
CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS avanzado_ejercicio_005_reparaciones;
DROP TABLE IF EXISTS avanzado_ejercicio_005_clientes;

CREATE TABLE avanzado_ejercicio_005_clientes (
  id INT AUTO_INCREMENT PRIMARY KEY,
  documento VARCHAR(20) NOT NULL UNIQUE,
  nombre VARCHAR(100) NOT NULL,
  telefono VARCHAR(20) NOT NULL,
  creado_en DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE avanzado_ejercicio_005_reparaciones (
  id INT AUTO_INCREMENT PRIMARY KEY,
  cliente_id INT NOT NULL,
  placa VARCHAR(15) NOT NULL,
  descripcion VARCHAR(200) NOT NULL,
  costo DECIMAL(10,2) NOT NULL,
  estado ENUM('pendiente','proceso','completado') NOT NULL DEFAULT 'pendiente',
  creado_en DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (cliente_id) REFERENCES avanzado_ejercicio_005_clientes(id)
);

-- Creacion de indices para optimizar busquedas
CREATE INDEX idx_reparaciones_placa ON avanzado_ejercicio_005_reparaciones(placa);
CREATE INDEX idx_reparaciones_estado_costo ON avanzado_ejercicio_005_reparaciones(estado, costo);