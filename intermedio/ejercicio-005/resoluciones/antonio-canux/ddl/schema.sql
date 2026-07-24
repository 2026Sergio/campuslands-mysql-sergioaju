-- Campuslands MySQL - intermedio ejercicio 005
-- Contexto: Modulo de datos para taller mecanico de motos (Clientes y Reparaciones).
CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS intermedio_ejercicio_005_reparaciones;
DROP TABLE IF EXISTS intermedio_ejercicio_005_clientes;

CREATE TABLE intermedio_ejercicio_005_clientes (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre_completo VARCHAR(100) NOT NULL,
  telefono VARCHAR(20) NOT NULL,
  creado_en DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE intermedio_ejercicio_005_reparaciones (
  id INT AUTO_INCREMENT PRIMARY KEY,
  cliente_id INT NOT NULL,
  moto_modelo VARCHAR(100) NOT NULL,
  descripcion VARCHAR(200) NOT NULL,
  costo DECIMAL(10,2) NOT NULL,
  estado ENUM('pendiente','en_proceso','completado') NOT NULL DEFAULT 'pendiente',
  FOREIGN KEY (cliente_id) REFERENCES intermedio_ejercicio_005_clientes(id)
);