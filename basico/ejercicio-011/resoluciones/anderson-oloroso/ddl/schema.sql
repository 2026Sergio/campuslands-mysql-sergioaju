USE campuslands_mysql;

CREATE TABLE IF NOT EXISTS jugadores_pingpong (
    jugador_id INT NOT NULL AUTO_INCREMENT,
    nombre_jugador VARCHAR(100) NOT NULL,
    edad INT NOT NULL,
    ranking INT NOT NULL,
    partidos_ganados INT NOT NULL,
    partidos_perdidos INT NOT NULL,
    PRIMARY KEY (jugador_id)
);