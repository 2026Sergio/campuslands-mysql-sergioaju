-- Campuslands MySQL - intermedio ejercicio 002
-- Contexto: Modulo de datos para ranking battle royale (Escuadrones y Jugadores).
CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS intermedio_ejercicio_002_jugadores;
DROP TABLE IF EXISTS intermedio_ejercicio_002_escuadrones;

CREATE TABLE intermedio_ejercicio_002_escuadrones (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(50) NOT NULL,
  region VARCHAR(50) NOT NULL,
  creado_en DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE intermedio_ejercicio_002_jugadores (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nickname VARCHAR(50) NOT NULL,
  nivel INT NOT NULL DEFAULT 1,
  escuadron_id INT,
  FOREIGN KEY (escuadron_id) REFERENCES intermedio_ejercicio_002_escuadrones(id)
);