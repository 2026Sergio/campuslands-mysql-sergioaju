-- basico/ejercicio-002 - maria-montepeque
USE campuslands_mysql;

DROP TABLE IF EXISTS jugadores_ranking_battle_royale;

CREATE TABLE jugadores_ranking_battle_royale (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nickname VARCHAR(40) NOT NULL UNIQUE,
    escuadra VARCHAR(80) NOT NULL,
    plataforma ENUM(
        'pc',
        'consola',
        'movil'
    ) NOT NULL,
    partidas_jugadas INT NOT NULL DEFAULT 0,
    victorias INT NOT NULL DEFAULT 0,
    eliminaciones INT NOT NULL DEFAULT 0,
    puntaje_temporada DECIMAL(8, 2) NOT NULL DEFAULT 0,
    estado ENUM(
        'activo',
        'inactivo',
        'baneado'
    ) NOT NULL DEFAULT 'activo',
    fecha_ultima_partida DATE NOT NULL,
    CONSTRAINT chk_victorias_ranking_br CHECK (victorias <= partidas_jugadas)
);
