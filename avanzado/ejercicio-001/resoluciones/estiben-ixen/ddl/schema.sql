CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS participantes;
DROP TABLE IF EXISTS escuadras;

CREATE TABLE escuadras (
    id_escuadra INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    region VARCHAR(30) NOT NULL,
    estado ENUM('Activo','Inactivo') DEFAULT 'Activo'
);

CREATE TABLE participantes (
    id_participante INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    nickname VARCHAR(30) NOT NULL UNIQUE,
    rol VARCHAR(20) NOT NULL,
    id_escuadra INT NOT NULL,
    puntaje DECIMAL(6,2) DEFAULT 0,
    FOREIGN KEY (id_escuadra) REFERENCES escuadras(id_escuadra)
);

START TRANSACTION;