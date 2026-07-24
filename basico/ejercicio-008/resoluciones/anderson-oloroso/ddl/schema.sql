USE campuslands_mysql;

CREATE TABLE IF NOT EXISTS futbol_sala (
    jugador_id INT NOT NULL AUTO_INCREMENT,
    nombre_jugador VARCHAR(100) NOT NULL,
    equipo VARCHAR(100) NOT NULL,
    posicion VARCHAR(50) NOT NULL,
    goles INT NOT NULL,
    asistencias INT NOT NULL,
    estado VARCHAR(30) NOT NULL,
    PRIMARY KEY (jugador_id)
);