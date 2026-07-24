CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS premios_temporada;
DROP TABLE IF EXISTS jugadores_ranking;

CREATE TABLE jugadores_ranking (
  id_jugador INT AUTO_INCREMENT PRIMARY KEY,
  nombre_jugador VARCHAR(50) NOT NULL UNIQUE,
  plataforma ENUM('pc','consola','movil') NOT NULL,
  puntos_ranking INT UNSIGNED NOT NULL DEFAULT 0,
  temporada VARCHAR(20) NOT NULL,
  estado ENUM('activo','inactivo') NOT NULL DEFAULT 'activo'
);

CREATE TABLE premios_temporada (
  id_premio INT AUTO_INCREMENT PRIMARY KEY,
  id_jugador INT NOT NULL,
  nombre_premio VARCHAR(60) NOT NULL,
  monto DECIMAL(8,2) NOT NULL DEFAULT 0.00,
  fecha_entrega DATE NOT NULL,
  CONSTRAINT fk_premio_jugador FOREIGN KEY (id_jugador) REFERENCES jugadores_ranking(id_jugador)
);