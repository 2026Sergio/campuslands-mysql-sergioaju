USE campuslands_mysql;

CREATE TABLE IF NOT EXISTS liga_futbol (
    equipo_id INT NOT NULL AUTO_INCREMENT,
    nombre_equipo VARCHAR(100) NOT NULL,
    ciudad VARCHAR(50) NOT NULL,
    partidos_jugados INT NOT NULL,
    partidos_ganados INT NOT NULL,
    goles_favor INT NOT NULL,
    puntos INT NOT NULL,
    PRIMARY KEY (equipo_id)
);