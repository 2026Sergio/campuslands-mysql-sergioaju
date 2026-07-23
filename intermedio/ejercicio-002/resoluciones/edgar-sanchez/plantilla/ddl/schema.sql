CREATE TABLE jugadores (
    jugador_id INT AUTO_INCREMENT PRIMARY KEY,
    nickname VARCHAR(50) NOT NULL UNIQUE,
    region VARCHAR(20) NOT NULL CHECK (region IN ('NA', 'EUW', 'KR', 'SA', 'ASIA')),
    rango_actual VARCHAR(20) NOT NULL DEFAULT 'Bronce' CHECK (rango_actual IN ('Bronce', 'Plata', 'Oro', 'Platino', 'Diamante', 'Corona', 'As')),
    fecha_registro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE partidas_clasificatorias (
    partida_id INT AUTO_INCREMENT PRIMARY KEY,
    jugador_id INT NOT NULL,
    puesto_final INT NOT NULL CHECK (puesto_final BETWEEN 1 AND 100),
    bajas INT NOT NULL DEFAULT 0 CHECK (bajas >= 0),
    puntos_obtenidos INT NOT NULL CHECK (puntos_obtenidos BETWEEN -50 AND 100),
    duracion_minutos DECIMAL(4,1) NOT NULL CHECK (duracion_minutos > 0.0),
    fecha_partida DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_partidas_jugadores 
        FOREIGN KEY (jugador_id) REFERENCES jugadores(jugador_id) 
        ON DELETE CASCADE ON UPDATE CASCADE
);