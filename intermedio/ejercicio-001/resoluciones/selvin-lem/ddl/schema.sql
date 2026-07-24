CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS jugadores_torneo;
DROP TABLE IF EXISTS equipos;

CREATE TABLE equipos (
  id_equipo INT AUTO_INCREMENT PRIMARY KEY,
  nombre_equipo VARCHAR(60) NOT NULL UNIQUE,
  region VARCHAR(40) NOT NULL,
  fecha_fundacion DATE NOT NULL,
  estado ENUM('activo','retirado') NOT NULL DEFAULT 'activo'
);

CREATE TABLE jugadores_torneo (
  id_jugador INT AUTO_INCREMENT PRIMARY KEY,
  id_equipo INT NOT NULL,
  nombre_jugador VARCHAR(50) NOT NULL,
  rol ENUM('top','jungla','mid','adc','support') NOT NULL,
  puntaje DECIMAL(5,2) NOT NULL DEFAULT 0.00,
  estado ENUM('activo','banca','inactivo') NOT NULL DEFAULT 'activo',
  CONSTRAINT fk_jugador_equipo FOREIGN KEY (id_equipo) REFERENCES equipos(id_equipo)
);