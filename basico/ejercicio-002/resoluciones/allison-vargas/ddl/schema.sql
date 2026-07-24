-- DDL: Definición de tabla con tipos de datos precisos para Ranking Battle Royale
CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS estadisticas_br;

CREATE TABLE estadisticas_br (
    jugador_id INT AUTO_INCREMENT PRIMARY KEY,
    tag_jugador VARCHAR(20) NOT NULL UNIQUE,
    nivel_cuenta INT NOT NULL DEFAULT 1 CHECK (nivel_cuenta >= 1),
    porcentaje_precisión DECIMAL(5, 2) NOT NULL CHECK (porcentaje_precisión BETWEEN 0.00 AND 100.00),
    puntuacion_temporada DECIMAL(8, 2) NOT NULL DEFAULT 0.00 CHECK (puntuacion_temporada >= 0.00),
    modo_preferido ENUM('Solo', 'Duos', 'Squads') NOT NULL DEFAULT 'Solo',
    pase_batalla_activo BOOLEAN NOT NULL DEFAULT FALSE,
    ultima_conexion DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    estado ENUM('activo', 'inactivo', 'penalizado') NOT NULL DEFAULT 'activo'
) ENGINE=InnoDB;
