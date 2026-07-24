-- DDL: Creación de tabla básica de Jugadores MOBA
CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS jugadores;

CREATE TABLE jugadores (
    jugador_id INT AUTO_INCREMENT PRIMARY KEY,
    nickname VARCHAR(30) NOT NULL UNIQUE,
    rol ENUM('Top', 'Jungle', 'Mid', 'ADC', 'Support') NOT NULL,
    nivel INT NOT NULL DEFAULT 1 CHECK (nivel >= 1),
    puntos_clasificacion INT NOT NULL DEFAULT 0 CHECK (puntos_clasificacion >= 0),
    kda DECIMAL(4, 2) NOT NULL DEFAULT 0.00 CHECK (kda >= 0.00),
    estado ENUM('activo', 'inactivo', 'suspendido') NOT NULL DEFAULT 'activo',
    fecha_registro DATE DEFAULT (CURRENT_DATE)
) ENGINE=InnoDB;
