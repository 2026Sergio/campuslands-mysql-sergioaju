CREATE TABLE ranking_royale (
    id_equipo INT AUTO_INCREMENT PRIMARY KEY,
    nombre_equipo VARCHAR(50) NOT NULL,
    partidas_jugadas INT UNSIGNED DEFAULT 0,
    victorias INT UNSIGNED DEFAULT 0,
    derrotas INT UNSIGNED DEFAULT 0,
    puntos_ranking INT DEFAULT 0,
    racha_actual VARCHAR(10) DEFAULT '0'
);