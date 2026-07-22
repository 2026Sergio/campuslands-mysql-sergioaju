-- intermedio/ejercicio-001 - maria-montepeque
USE campuslands_mysql;

DROP TABLE IF EXISTS jugadores_escuadra_moba;
DROP TABLE IF EXISTS escuadras_torneo_moba;

CREATE TABLE escuadras_torneo_moba (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(80) NOT NULL UNIQUE,
    region VARCHAR(60) NOT NULL,
    entrenador VARCHAR(80) NOT NULL,
    fecha_fundacion DATE NOT NULL
);

CREATE TABLE jugadores_escuadra_moba (
    id INT AUTO_INCREMENT PRIMARY KEY,
    gamer_tag VARCHAR(40) NOT NULL UNIQUE,
    escuadra_id INT NOT NULL,
    rol ENUM(
        'top',
        'jungla',
        'medio',
        'tirador',
        'soporte'
    ) NOT NULL,
    partidas_jugadas INT NOT NULL DEFAULT 0,
    victorias INT NOT NULL DEFAULT 0,
    kda DECIMAL(5, 2) NOT NULL DEFAULT 0,
    estado ENUM(
        'activo',
        'suplente',
        'retirado'
    ) NOT NULL DEFAULT 'activo',
    CONSTRAINT fk_jugadores_escuadra
        FOREIGN KEY (escuadra_id)
        REFERENCES escuadras_torneo_moba(id),
    CONSTRAINT chk_victorias_escuadra_moba CHECK (victorias <= partidas_jugadas),
    CONSTRAINT chk_kda_escuadra_moba CHECK (kda >= 0)
);
