-- campuslands mysql - intermedio ejercicio 002
-- creacion de base de datos y tablas para ranking battle royale

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

-- eliminamos tablas si existen para evitar conflictos
DROP TABLE IF EXISTS partidas;
DROP TABLE IF EXISTS jugadores;

-- tabla 1: jugadores registrados
CREATE TABLE jugadores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nickname VARCHAR(80) NOT NULL,
    rango VARCHAR(50) NOT NULL DEFAULT 'bronce',
    nivel INT NOT NULL DEFAULT 1,
    creado_en DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- tabla 2: partidas jugadas
CREATE TABLE partidas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    jugador_id INT NOT NULL,
    bajas INT NOT NULL DEFAULT 0,
    posicion_final INT NOT NULL,
    puntos_ganados DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    fecha_partida DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (jugador_id) REFERENCES jugadores(id)
);