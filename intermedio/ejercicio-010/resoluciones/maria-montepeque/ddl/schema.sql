-- intermedio/ejercicio-010 - maria-montepeque
USE campuslands_mysql;

DROP TABLE IF EXISTS pilotos_carreras_urbanas;

CREATE TABLE pilotos_carreras_urbanas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    -- "nombre" NO es UNIQUE a proposito: dos pilotos reales distintos pueden
    -- llamarse igual (homonimos). Lo que si identifica a cada piloto de forma
    -- unica es su alias de carrera y su numero de licencia.
    nombre VARCHAR(80) NOT NULL,
    alias VARCHAR(40) NOT NULL UNIQUE,
    licencia_piloto VARCHAR(20) NOT NULL UNIQUE,
    vehiculo VARCHAR(80) NOT NULL,
    circuito_local VARCHAR(80) NOT NULL,
    puntos_temporada INT NOT NULL DEFAULT 0,
    estado ENUM(
        'activo',
        'suspendido',
        'retirado'
    ) NOT NULL DEFAULT 'activo',
    -- UNIQUE compuesto: evita registrar accidentalmente dos veces al mismo
    -- piloto con el mismo vehiculo (aunque el nombre por si solo se repita).
    CONSTRAINT uq_nombre_vehiculo_carreras UNIQUE (nombre, vehiculo),
    CONSTRAINT chk_puntos_carreras_urbanas CHECK (puntos_temporada >= 0)
);
