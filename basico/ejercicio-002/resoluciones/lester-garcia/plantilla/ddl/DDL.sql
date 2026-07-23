
DROP DATABASE ranking_battle_royale;
CREATE DATABASE ranking_battle_royale;
USE ranking_battle_royale;

CREATE TABLE jugadores (
    id_jugador INT AUTO_INCREMENT PRIMARY KEY,
    nickname VARCHAR(40) NOT NULL UNIQUE,
    nombre VARCHAR(80) NOT NULL,
    edad TINYINT UNSIGNED NOT NULL,
    pais VARCHAR(40) NOT NULL,
    fecha_registro DATE NOT NULL,
    activo BOOLEAN NOT NULL DEFAULT TRUE
);

CREATE TABLE temporadas (
    id_temporada INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(40) NOT NULL,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE NOT NULL,
    estado ENUM('Activa','Finalizada') NOT NULL
);

CREATE TABLE partidas (
    id_partida INT AUTO_INCREMENT PRIMARY KEY,
    id_temporada INT NOT NULL,
    mapa ENUM('Isla','Desierto','Bosque','Ciudad') NOT NULL,
    fecha DATETIME NOT NULL,
    jugadores_participantes TINYINT UNSIGNED NOT NULL,
    duracion_minutos SMALLINT UNSIGNED NOT NULL,
    FOREIGN KEY (id_temporada) REFERENCES temporadas(id_temporada)
);

CREATE TABLE ranking (
    id_ranking INT AUTO_INCREMENT PRIMARY KEY,
    id_jugador INT NOT NULL,
    id_temporada INT NOT NULL,
    puntos INT NOT NULL,
    victorias SMALLINT UNSIGNED NOT NULL,
    eliminaciones SMALLINT UNSIGNED NOT NULL,
    precisión DECIMAL(5,2) NOT NULL,
    posicion SMALLINT UNSIGNED NOT NULL,
    FOREIGN KEY (id_jugador) REFERENCES jugadores(id_jugador),
    FOREIGN KEY (id_temporada) REFERENCES temporadas(id_temporada)
);