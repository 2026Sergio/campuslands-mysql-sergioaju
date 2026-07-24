USE campuslands_mysql;

CREATE TABLE IF NOT EXISTS equipos_esports_moba (
    equipo_id INT NOT NULL AUTO_INCREMENT,
    nombre_equipo VARCHAR(100) NOT NULL,
    region VARCHAR(50) NOT NULL,
    puntos INT NOT NULL,
    estado VARCHAR(30) NOT NULL,
    PRIMARY KEY (equipo_id)
);

CREATE TABLE IF NOT EXISTS movimientos_torneo_moba (
    movimiento_id INT NOT NULL AUTO_INCREMENT,
    equipo_id INT NOT NULL,
    tipo_movimiento VARCHAR(50) NOT NULL,
    puntos_movimiento INT NOT NULL,
    fecha_movimiento DATE NOT NULL,
    PRIMARY KEY (movimiento_id),
    FOREIGN KEY (equipo_id) REFERENCES equipos_esports_moba(equipo_id)
);