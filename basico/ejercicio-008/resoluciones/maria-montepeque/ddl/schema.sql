-- basico/ejercicio-008 - maria-montepeque
USE campuslands_mysql;

DROP TABLE IF EXISTS jugadores_futbol_sala;

CREATE TABLE jugadores_futbol_sala (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(80) NOT NULL UNIQUE,
    equipo VARCHAR(80) NOT NULL,
    posicion ENUM(
        'portero',
        'cierre',
        'ala',
        'pivote'
    ) NOT NULL,
    goles INT NOT NULL DEFAULT 0,
    tarjetas_amarillas INT NOT NULL DEFAULT 0,
    tarjetas_rojas INT NOT NULL DEFAULT 0,
    estado ENUM(
        'activo',
        'lesionado',
        'suspendido'
    ) NOT NULL DEFAULT 'activo',
    fecha_registro DATE NOT NULL,
    CONSTRAINT chk_goles_futbol_sala CHECK (goles >= 0)
);
