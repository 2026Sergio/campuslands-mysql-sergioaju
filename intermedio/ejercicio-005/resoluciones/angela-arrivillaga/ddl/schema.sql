-- campuslands mysql - intermedio ejercicio 005
-- creacion de la base de datos y la tabla reparaciones para el taller mecanico

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

-- eliminamos la tabla si ya existe para evitar errores
DROP TABLE IF EXISTS reparaciones;

-- tabla principal para gestionar los servicios del taller
CREATE TABLE reparaciones (
    id INT AUTO_INCREMENT PRIMARY KEY,
    moto VARCHAR(100) NOT NULL,
    tipo_servicio VARCHAR(80) NOT NULL,
    costo DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    estado ENUM('pendiente', 'en_proceso', 'completado') NOT NULL DEFAULT 'pendiente',
    fecha_ingreso DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);