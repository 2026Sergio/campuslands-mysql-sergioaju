CREATE TABLE divisiones (
    division_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_division VARCHAR(50) NOT NULL UNIQUE,
    puntos_minimos INT NOT NULL CHECK (puntos_minimos >= 0),
    puntos_maximos INT NOT NULL CHECK (puntos_maximos > puntos_minimos)
);

CREATE TABLE jugadores (
    jugador_id INT AUTO_INCREMENT PRIMARY KEY,
    division_id INT NOT NULL,
    nickname VARCHAR(50) NOT NULL UNIQUE,
    puntos_mrr INT NOT NULL DEFAULT 1000 CHECK (puntos_mrr >= 0),
    partidas_jugadas INT NOT NULL DEFAULT 0 CHECK (partidas_jugadas >= 0),
    victorias INT NOT NULL DEFAULT 0 CHECK (victorias >= 0),
    bajas_totales INT NOT NULL DEFAULT 0 CHECK (bajas_totales >= 0),
    CONSTRAINT fk_jugadores_divisiones 
        FOREIGN KEY (division_id) REFERENCES divisiones(division_id) 
        ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE historial_partidas (
    partida_id INT AUTO_INCREMENT PRIMARY KEY,
    jugador_id INT NOT NULL,
    posicion_final INT NOT NULL CHECK (posicion_final BETWEEN 1 AND 100),
    bajas INT NOT NULL DEFAULT 0 CHECK (bajas >= 0),
    puntos_ganados_perdidos INT NOT NULL,
    fecha_partida DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_historial_jugadores 
        FOREIGN KEY (jugador_id) REFERENCES jugadores(jugador_id) 
        ON DELETE CASCADE
);