-- basico/ejercicio-011 - maria-montepeque
USE campuslands_mysql;

DROP TABLE IF EXISTS jugadores_pingpong;

CREATE TABLE jugadores_pingpong (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(80) NOT NULL UNIQUE,
    club VARCHAR(80) NOT NULL,
    categoria ENUM(
        'infantil',
        'juvenil',
        'adulto',
        'veterano'
    ) NOT NULL,
    mano_dominante ENUM(
        'diestra',
        'zurda'
    ) NOT NULL DEFAULT 'diestra',
    ranking_puntos INT NOT NULL DEFAULT 1000,
    partidos_jugados INT NOT NULL DEFAULT 0,
    partidos_ganados INT NOT NULL DEFAULT 0,
    estado ENUM(
        'activo',
        'inactivo'
    ) NOT NULL DEFAULT 'activo',
    fecha_afiliacion DATE NOT NULL,
    CONSTRAINT chk_ranking_pingpong CHECK (ranking_puntos >= 0),
    CONSTRAINT chk_ganados_pingpong CHECK (partidos_ganados <= partidos_jugados)
);
