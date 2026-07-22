-- intermedio/ejercicio-009 - maria-montepeque
USE campuslands_mysql;

DROP TABLE IF EXISTS peleadores_kickboxing;
DROP TABLE IF EXISTS gimnasios_kickboxing;

CREATE TABLE gimnasios_kickboxing (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(80) NOT NULL UNIQUE,
    ciudad VARCHAR(60) NOT NULL,
    fecha_apertura DATE NOT NULL
);

CREATE TABLE peleadores_kickboxing (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(80) NOT NULL UNIQUE,
    gimnasio_id INT NOT NULL,
    categoria_peso ENUM(
        'pluma',
        'ligero',
        'medio',
        'pesado'
    ) NOT NULL,
    peleas_ganadas INT NOT NULL DEFAULT 0,
    peleas_perdidas INT NOT NULL DEFAULT 0,
    estado ENUM(
        'activo',
        'retirado'
    ) NOT NULL DEFAULT 'activo',
    -- ON DELETE RESTRICT: no se puede borrar un gimnasio mientras tenga
    -- peleadores registrados (evita dejar peleadores huerfanos).
    -- ON UPDATE CASCADE: si el id del gimnasio cambiara, se actualiza solo.
    CONSTRAINT fk_peleadores_gimnasio
        FOREIGN KEY (gimnasio_id)
        REFERENCES gimnasios_kickboxing(id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,
    CONSTRAINT chk_peleas_ganadas_kickboxing_fk CHECK (peleas_ganadas >= 0)
);
