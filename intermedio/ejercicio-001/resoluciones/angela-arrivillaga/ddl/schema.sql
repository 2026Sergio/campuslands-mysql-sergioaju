-- campuslands mysql - intermedio ejercicio 001
-- creacion de base de datos y tablas para torneo moba

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

-- eliminamos tablas viejas para evitar conflictos
DROP TABLE IF EXISTS jugadores;
DROP TABLE IF EXISTS equipos;

-- tabla 1: equipos del torneo
CREATE TABLE equipos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    region VARCHAR(50) NOT NULL,
    estado ENUM('activo', 'eliminado') NOT NULL DEFAULT 'activo'
);

-- tabla 2: jugadores registrados
CREATE TABLE jugadores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    equipo_id INT NOT NULL,
    nickname VARCHAR(80) NOT NULL,
    rol VARCHAR(50) NOT NULL,
    puntos DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    creado_en DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (equipo_id) REFERENCES equipos(id)
);