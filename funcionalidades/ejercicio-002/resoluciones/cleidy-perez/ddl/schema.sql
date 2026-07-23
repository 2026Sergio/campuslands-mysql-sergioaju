-- Campuslands MySQL - funcionalidades ejercicio 002
-- Ejecuta este archivo antes de inserts.sql.

-- ==============================================================================
-- Funcionalidad 002: Tipos de Datos MySQL
-- Temática: Carreras Urbanas (Street Racing & Tuning)
-- Estudiante: Cleidy Pérez
-- ==============================================================================

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

-- Limpieza preventiva de tablas
DROP TABLE IF EXISTS telemetria_carrera;
DROP TABLE IF EXISTS vehiculos;
DROP TABLE IF EXISTS pilotos;

-- ==============================================================================
-- Tabla 1: Pilotos
-- Demuestra: INT (PK), VARCHAR (Textos variables), ENUM (Opciones fijas)
-- ==============================================================================
CREATE TABLE pilotos (
    id_piloto INT AUTO_INCREMENT PRIMARY KEY,
    alias VARCHAR(50) NOT NULL UNIQUE,          -- Nombres cortos/apodos
    patrocinador VARCHAR(100) DEFAULT 'Independiente',
    categoria ENUM('Amateur', 'Pro', 'Leyenda') NOT NULL DEFAULT 'Amateur',
    licencia_activa BOOLEAN NOT NULL DEFAULT TRUE
);

-- ==============================================================================
-- Tabla 2: Vehiculos
-- Demuestra: CHAR (Código fijo), VARCHAR, INT, DECIMAL (Precisión numérica)
-- ==============================================================================
CREATE TABLE vehiculos (
    id_vehiculo INT AUTO_INCREMENT PRIMARY KEY,
    vin_carreras CHAR(8) NOT NULL UNIQUE,        -- Código alfanumérico fijo de 8 caracteres (ej. 'RAC-9021')
    id_piloto INT NOT NULL,
    modelo VARCHAR(60) NOT NULL,
    potencia_hp INT UNSIGNED NOT NULL,           -- Solo valores positivos
    peso_kg DECIMAL(6,2) NOT NULL,               -- Precisión exacta en kilogramos (ej. 1250.50)
    CONSTRAINT fk_vehiculos_pilotos 
        FOREIGN KEY (id_piloto) 
        REFERENCES pilotos(id_piloto) 
        ON DELETE CASCADE
);

-- ==============================================================================
-- Tabla 3: Telemetria de Carrera
-- Demuestra: DATETIME, TIME, DECIMAL (Tiempos exactos) y JSON (Estructuras flexibles)
-- ==============================================================================
CREATE TABLE telemetria_carrera (
    id_registro INT AUTO_INCREMENT PRIMARY KEY,
    id_vehiculo INT NOT NULL,
    fecha_evento DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP, -- Fecha y hora exacta
    tiempo_vuelta TIME NOT NULL,                             -- Almacena intervalos HH:MM:SS.uuuuuu
    velocidad_max_kmh DECIMAL(5,2) NOT NULL,                  -- Velocidad en km/h con 2 decimales
    metricas_sensores JSON NOT NULL,                          -- Almacenamiento flexible JSON
    CONSTRAINT fk_telemetria_vehiculos 
        FOREIGN KEY (id_vehiculo) 
        REFERENCES vehiculos(id_vehiculo) 
        ON DELETE CASCADE
);