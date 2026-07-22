-- basico/ejercicio-001 - maria-montepeque
USE campuslands_mysql;

DROP TABLE IF EXISTS jugadores_torneo_moba;

CREATE TABLE jugadores_torneo_moba (
    id INT AUTO_INCREMENT PRIMARY KEY,
    gamer_tag VARCHAR(40) NOT NULL UNIQUE,
    equipo VARCHAR(80) NOT NULL,
    rol ENUM(
        'top',
        'jungla',
        'medio',
        'tirador',
        'soporte'
    ) NOT NULL,
    region VARCHAR(60) NOT NULL,
    partidas_jugadas INT NOT NULL DEFAULT 0,
    victorias INT NOT NULL DEFAULT 0,
    mvp_count INT NOT NULL DEFAULT 0,
    kda DECIMAL(5, 2) NOT NULL DEFAULT 0,
    estado ENUM(
        'activo',
        'suspendido',
        'retirado'
    ) NOT NULL DEFAULT 'activo',
    CONSTRAINT chk_victorias CHECK (victorias <= partidas_jugadas)
);