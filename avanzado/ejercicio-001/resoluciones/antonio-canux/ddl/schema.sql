-- Campuslands MySQL - avanzado ejercicio 001
-- Contexto: Modulo de datos para torneo esports MOBA (Equipos y Jugadores con Presupuesto).
CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS avanzado_ejercicio_001_jugadores;
DROP TABLE IF EXISTS avanzado_ejercicio_001_equipos;

CREATE TABLE avanzado_ejercicio_001_equipos (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(50) NOT NULL,
  region VARCHAR(50) NOT NULL,
  presupuesto DECIMAL(12,2) NOT NULL DEFAULT 0,
  creado_en DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE avanzado_ejercicio_001_jugadores (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nickname VARCHAR(50) NOT NULL,
  rol VARCHAR(50) NOT NULL,
  equipo_id INT,
  FOREIGN KEY (equipo_id) REFERENCES avanzado_ejercicio_001_equipos(id)
);