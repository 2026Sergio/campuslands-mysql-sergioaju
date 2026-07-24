USE campuslands_mysql;

CREATE TABLE IF NOT EXISTS jugadores_battle_royale (
    jugador_id INT NOT NULL AUTO_INCREMENT,
    nombre_jugador VARCHAR(100) NOT NULL,
    region VARCHAR(50) NOT NULL,
    nivel INT NOT NULL,
    PRIMARY KEY (jugador_id)
);

CREATE TABLE IF NOT EXISTS ranking_battle_royale (
    ranking_id INT NOT NULL AUTO_INCREMENT,
    jugador_id INT NOT NULL,
    puesto INT NOT NULL,
    puntos INT NOT NULL,
    temporada VARCHAR(50) NOT NULL,
    PRIMARY KEY (ranking_id),
    FOREIGN KEY (jugador_id) REFERENCES jugadores_battle_royale(jugador_id)
);