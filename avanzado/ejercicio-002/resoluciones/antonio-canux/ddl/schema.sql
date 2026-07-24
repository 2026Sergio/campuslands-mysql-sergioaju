-- Campuslands MySQL - avanzado ejercicio 002
-- Contexto: Modulo de datos para ranking battle royale (Procedimientos Almacenados).
CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS avanzado_ejercicio_002_partidas;
DROP TABLE IF EXISTS avanzado_ejercicio_002_jugadores;

CREATE TABLE avanzado_ejercicio_002_jugadores (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nickname VARCHAR(50) NOT NULL,
  nivel INT NOT NULL DEFAULT 1,
  puntos_rango INT NOT NULL DEFAULT 0,
  creado_en DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE avanzado_ejercicio_002_partidas (
  id INT AUTO_INCREMENT PRIMARY KEY,
  jugador_id INT NOT NULL,
  posicion INT NOT NULL,
  eliminaciones INT NOT NULL DEFAULT 0,
  puntos_obtenidos INT NOT NULL DEFAULT 0,
  creado_en DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (jugador_id) REFERENCES avanzado_ejercicio_002_jugadores(id)
);