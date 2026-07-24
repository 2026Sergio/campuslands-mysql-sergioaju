-- Campuslands MySQL - avanzado ejercicio 003
-- Contexto: Modulo de datos para inventario de skins shooter (Funciones definidas por el usuario - UDF).
CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS avanzado_ejercicio_003_skins;
DROP TABLE IF EXISTS avanzado_ejercicio_003_colecciones;

CREATE TABLE avanzado_ejercicio_003_colecciones (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(50) NOT NULL,
  tematica VARCHAR(50) NOT NULL,
  creado_en DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE avanzado_ejercicio_003_skins (
  id INT AUTO_INCREMENT PRIMARY KEY,
  coleccion_id INT NOT NULL,
  nombre_arma VARCHAR(50) NOT NULL,
  precio_puntos INT NOT NULL,
  FOREIGN KEY (coleccion_id) REFERENCES avanzado_ejercicio_003_colecciones(id)
);