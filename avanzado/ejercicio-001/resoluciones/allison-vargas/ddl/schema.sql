CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS transferencias_premios;
DROP TABLE IF EXISTS partidas;
DROP TABLE IF EXISTS equipos;

CREATE TABLE equipos (
    equipo_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL UNIQUE,
    region VARCHAR(20) NOT NULL,
    fondo_premios DECIMAL(12, 2) NOT NULL DEFAULT 0.00 CHECK (fondo_premios >= 0),
    estado ENUM('activo', 'descalificado', 'retirado') NOT NULL DEFAULT 'activo',
    fecha_registro DATETIME DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;

CREATE TABLE partidas (
    partida_id INT AUTO_INCREMENT PRIMARY KEY,
    equipo_azul_id INT NOT NULL,
    equipo_rojo_id INT NOT NULL,
    ganador_id INT,
    duracion_segundos INT NOT NULL CHECK (duracion_segundos > 0),
    fase VARCHAR(30) NOT NULL,
    fecha_partida DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (equipo_azul_id) REFERENCES equipos(equipo_id),
    FOREIGN KEY (equipo_rojo_id) REFERENCES equipos(equipo_id),
    FOREIGN KEY (ganador_id) REFERENCES equipos(equipo_id)
) ENGINE=InnoDB;

CREATE TABLE transferencias_premios (
    transferencia_id INT AUTO_INCREMENT PRIMARY KEY,
    equipo_origen_id INT,
    equipo_destino_id INT NOT NULL,
    monto DECIMAL(12, 2) NOT NULL CHECK (monto > 0),
    concepto VARCHAR(100) NOT NULL,
    fecha_transaccion DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (equipo_origen_id) REFERENCES equipos(equipo_id),
    FOREIGN KEY (equipo_destino_id) REFERENCES equipos(equipo_id)
) ENGINE=InnoDB;
