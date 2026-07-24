-- basico/ejercicio-007 - maria-montepeque
USE campuslands_mysql;

DROP TABLE IF EXISTS equipos_liga_futbol;

CREATE TABLE equipos_liga_futbol (
    id INT AUTO_INCREMENT PRIMARY KEY,
    equipo VARCHAR(80) NOT NULL UNIQUE,
    ciudad VARCHAR(60) NOT NULL,
    partidos_jugados INT NOT NULL DEFAULT 0,
    victorias INT NOT NULL DEFAULT 0,
    empates INT NOT NULL DEFAULT 0,
    derrotas INT NOT NULL DEFAULT 0,
    goles_favor INT NOT NULL DEFAULT 0,
    goles_contra INT NOT NULL DEFAULT 0,
    puntos INT NOT NULL DEFAULT 0,
    estado ENUM(
        'activo',
        'sancionado'
    ) NOT NULL DEFAULT 'activo',
    CONSTRAINT chk_partidos_liga_futbol CHECK (victorias + empates + derrotas <= partidos_jugados)
);
