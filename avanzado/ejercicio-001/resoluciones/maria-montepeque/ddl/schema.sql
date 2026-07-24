-- avanzado/ejercicio-001 - maria-montepeque
USE campuslands_mysql;

DROP TABLE IF EXISTS inscripciones_torneo_moba;
DROP TABLE IF EXISTS jugadores_saldo_moba;

CREATE TABLE jugadores_saldo_moba (
    id INT AUTO_INCREMENT PRIMARY KEY,
    gamer_tag VARCHAR(40) NOT NULL UNIQUE,
    saldo_creditos DECIMAL(10, 2) NOT NULL DEFAULT 0,
    CONSTRAINT chk_saldo_no_negativo_moba CHECK (saldo_creditos >= 0)
);

CREATE TABLE inscripciones_torneo_moba (
    id INT AUTO_INCREMENT PRIMARY KEY,
    jugador_id INT NOT NULL,
    torneo_nombre VARCHAR(100) NOT NULL,
    costo_creditos DECIMAL(10, 2) NOT NULL,
    fecha_inscripcion DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_inscripciones_jugador
        FOREIGN KEY (jugador_id)
        REFERENCES jugadores_saldo_moba(id),
    CONSTRAINT chk_costo_inscripcion_moba CHECK (costo_creditos > 0)
);
