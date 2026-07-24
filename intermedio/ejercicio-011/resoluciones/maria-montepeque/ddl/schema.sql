-- intermedio/ejercicio-011 - maria-montepeque
USE campuslands_mysql;

DROP TABLE IF EXISTS jugadores_pingpong_intermedio;

CREATE TABLE jugadores_pingpong_intermedio (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(80) NOT NULL UNIQUE,
    edad INT NOT NULL,
    categoria ENUM(
        'infantil',
        'juvenil',
        'adulto',
        'veterano'
    ) NOT NULL,
    ranking_puntos INT NOT NULL DEFAULT 1000,
    partidos_jugados INT NOT NULL DEFAULT 0,
    partidos_ganados INT NOT NULL DEFAULT 0,
    sets_favor INT NOT NULL DEFAULT 0,
    sets_contra INT NOT NULL DEFAULT 0,
    -- Rango de edad realista para un jugador federado
    CONSTRAINT chk_edad_pingpong CHECK (edad BETWEEN 6 AND 90),
    -- Rango del sistema de puntos de ranking del club
    CONSTRAINT chk_ranking_pingpong_ck CHECK (ranking_puntos BETWEEN 0 AND 3000),
    -- CHECK relacional entre dos columnas: no se puede ganar mas partidos de los jugados
    CONSTRAINT chk_ganados_pingpong_ck CHECK (partidos_ganados <= partidos_jugados),
    CONSTRAINT chk_sets_favor_pingpong CHECK (sets_favor >= 0),
    CONSTRAINT chk_sets_contra_pingpong CHECK (sets_contra >= 0)
);
