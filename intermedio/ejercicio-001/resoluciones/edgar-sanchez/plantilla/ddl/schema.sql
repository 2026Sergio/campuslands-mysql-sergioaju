CREATE TABLE equipos (
    equipo_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_equipo VARCHAR(50) NOT NULL UNIQUE,
    tag VARCHAR(5) NOT NULL UNIQUE,
    region VARCHAR(20) NOT NULL CHECK (region IN ('NA', 'EUW', 'EUNE', 'KR', 'CN', 'LAS', 'LAN')),
    fecha_creacion DATE NOT NULL
);

CREATE TABLE jugadores (
    jugador_id INT AUTO_INCREMENT PRIMARY KEY,
    equipo_id INT NOT NULL,
    nickname VARCHAR(50) NOT NULL UNIQUE,
    rol VARCHAR(20) NOT NULL CHECK (rol IN ('Top', 'Jungle', 'Mid', 'ADC', 'Support')),
    kda_promedio DECIMAL(4,2) NOT NULL DEFAULT 0.00 CHECK (kda_promedio >= 0.00),
    salario_mensual DECIMAL(10,2) NOT NULL CHECK (salario_mensual >= 0.00),
    CONSTRAINT fk_jugadores_equipos 
        FOREIGN KEY (equipo_id) REFERENCES equipos(equipo_id) 
        ON DELETE CASCADE ON UPDATE CASCADE
);