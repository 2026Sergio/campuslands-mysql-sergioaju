-- basico/ejercicio-009 - maria-montepeque
USE campuslands_mysql;

DROP TABLE IF EXISTS peleadores_kickboxing;

CREATE TABLE peleadores_kickboxing (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(80) NOT NULL UNIQUE,
    categoria_peso ENUM(
        'pluma',
        'ligero',
        'medio',
        'pesado'
    ) NOT NULL,
    gimnasio VARCHAR(80) NOT NULL,
    peleas_ganadas INT NOT NULL DEFAULT 0,
    peleas_perdidas INT NOT NULL DEFAULT 0,
    estado ENUM(
        'activo',
        'retirado',
        'descalificado'
    ) NOT NULL DEFAULT 'activo',
    fecha_inscripcion DATE NOT NULL,
    CONSTRAINT chk_peleas_ganadas_kickboxing CHECK (peleas_ganadas >= 0)
);
