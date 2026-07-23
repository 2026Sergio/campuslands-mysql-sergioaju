USE campuslands_mysql;

DROP TABLE IF EXISTS rankingBattleRoyale;

CREATE TABLE rankingBattleRoyale (
    id_jugador INT AUTO_INCREMENT PRIMARY KEY,
    nombre_jugador VARCHAR(100) NOT NULL,
    rango VARCHAR(50) NOT NULL,
    puntos INT NOT NULL,
    partidas_jugadas INT NOT NULL,
    victorias INT NOT NULL,
    porcentaje_victoria DECIMAL(5,2) NOT NULL,
    fecha_actualizacion DATE NOT NULL
);