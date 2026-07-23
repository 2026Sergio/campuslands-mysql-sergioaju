CREATE TABLE equipos (
    equipo_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_equipo VARCHAR(50) NOT NULL UNIQUE,
    tag VARCHAR(5) NOT NULL UNIQUE,
    presupuesto_fichajes DECIMAL(12,2) NOT NULL DEFAULT 0.00 CHECK (presupuesto_fichajes >= 0.00),
    estado VARCHAR(20) NOT NULL DEFAULT 'Activo' CHECK (estado IN ('Activo', 'Inactivo', 'Suspendido'))
) ENGINE=InnoDB;

CREATE TABLE jugadores (
    jugador_id INT AUTO_INCREMENT PRIMARY KEY,
    equipo_id INT NULL,
    nickname VARCHAR(50) NOT NULL UNIQUE,
    rol VARCHAR(20) NOT NULL CHECK (rol IN ('Top', 'Jungle', 'Mid', 'ADC', 'Support')),
    clausula_rescision DECIMAL(12,2) NOT NULL CHECK (clausula_rescision >= 0.00),
    salario_mensual DECIMAL(10,2) NOT NULL CHECK (salario_mensual >= 0.00),
    estado_fichable BOOLEAN NOT NULL DEFAULT TRUE,
    CONSTRAINT fk_jugadores_equipos 
        FOREIGN KEY (equipo_id) REFERENCES equipos(equipo_id) 
        ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE TABLE fichajes_historial (
    fichaje_id INT AUTO_INCREMENT PRIMARY KEY,
    jugador_id INT NOT NULL,
    equipo_origen_id INT NULL,
    equipo_destino_id INT NOT NULL,
    monto_monto_transaccion DECIMAL(12,2) NOT NULL CHECK (monto_monto_transaccion >= 0.00),
    fecha_fichaje DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_fichajes_jugadores FOREIGN KEY (jugador_id) REFERENCES jugadores(jugador_id) ON DELETE CASCADE,
    CONSTRAINT fk_fichajes_origen FOREIGN KEY (equipo_origen_id) REFERENCES equipos(equipo_id) ON DELETE SET NULL,
    CONSTRAINT fk_fichajes_destino FOREIGN KEY (equipo_destino_id) REFERENCES equipos(equipo_id) ON DELETE RESTRICT
) ENGINE=InnoDB;