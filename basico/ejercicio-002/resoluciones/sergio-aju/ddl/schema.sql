DROP DATABASE IF EXISTS db_battle_royale;
CREATE DATABASE db_battle_royale CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE db_battle_royale;

CREATE TABLE jugadores_br (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_jugador VARCHAR(50) NOT NULL,
    nivel INT UNSIGNED NOT NULL,
    partidas_jugadas INT UNSIGNED DEFAULT 0,
    victorias INT UNSIGNED DEFAULT 0,
    precision_disparo DECIMAL(5,2) UNSIGNED DEFAULT 0.00,
    rango VARCHAR(30) NOT NULL,
    activo BOOLEAN DEFAULT TRUE,
    fecha_registro DATETIME DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;