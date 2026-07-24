CREATE TABLE ranking_royale (
    id_equipo INT AUTO_INCREMENT PRIMARY KEY,
    nombre_equipo VARCHAR(50) NOT NULL,
    partidas_jugadas INT UNSIGNED DEFAULT 0,
    victorias INT UNSIGNED DEFAULT 0,
    derrotas INT UNSIGNED DEFAULT 0,
    puntos_ranking INT DEFAULT 0,
    racha_actual VARCHAR(10) DEFAULT '0'
);

CREATE TABLE patrocinadores (
    id_patrocinador INT AUTO_INCREMENT PRIMARY KEY,
    nombre_patrocinador VARCHAR(50) NOT NULL,
    id_equipo_patrocinado INT
);




