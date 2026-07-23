CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS basico_ejercicio_002;

CREATE TABLE basico_ejercicio_002 (
  id INT AUTO_INCREMENT PRIMARY KEY,
  jugador VARCHAR(50) NOT NULL,
  plataforma ENUM('pc','consola','movil') NOT NULL,
  kills TINYINT UNSIGNED NOT NULL DEFAULT 0,
  posicion_final SMALLINT UNSIGNED NOT NULL,
  tiempo_supervivencia TIME NOT NULL,
  premio_ganado DECIMAL(8,2) NOT NULL DEFAULT 0.00,
  es_victoria BOOLEAN NOT NULL DEFAULT FALSE,
  fecha_partida DATE NOT NULL,
  estado ENUM('valida','revision','descalificado') NOT NULL DEFAULT 'valida',
  CHECK (posicion_final >= 1)
);