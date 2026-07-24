-- Campuslands MySQL - intermedio ejercicio 001
-- Contexto: Modulo de datos para ranking battle royale.
CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

DROP TABLE IF EXISTS intermedio_ejercicio_001_partidas;
DROP TABLE IF EXISTS intermedio_ejercicio_001_jugadores;

CREATE TABLE intermedio_ejercicio_001_jugadores (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nickname VARCHAR(50) NOT NULL,
  rango VARCHAR(50) NOT NULL,
  creado_en DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE intermedio_ejercicio_001_partidas (
  id INT AUTO_INCREMENT PRIMARY KEY,
  jugador_id INT,
  posicion INT NOT NULL,
  eliminaciones INT NOT NULL DEFAULT 0,
  FOREIGN KEY (jugador_id) REFERENCES intermedio_ejercicio_001_jugadores(id)
);