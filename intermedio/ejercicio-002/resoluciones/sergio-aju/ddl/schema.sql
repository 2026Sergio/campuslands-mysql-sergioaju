DROP DATABASE IF EXISTS db_battle_royale;
CREATE DATABASE db_battle_royale;
USE db_battle_royale;

CREATE TABLE clanes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL UNIQUE,
    region VARCHAR(30) NOT NULL
);

CREATE TABLE jugadores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    alias VARCHAR(40) NOT NULL UNIQUE,
    eliminaciones INT UNSIGNED DEFAULT 0,
    puntos_ranking DECIMAL(6,2) NOT NULL,
    id_clan INT NULL,
    FOREIGN KEY (id_clan) REFERENCES clanes(id) ON DELETE SET NULL
);