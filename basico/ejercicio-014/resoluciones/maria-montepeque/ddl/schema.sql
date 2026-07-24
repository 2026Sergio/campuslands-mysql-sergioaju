-- basico/ejercicio-014 - maria-montepeque
USE campuslands_mysql;

DROP TABLE IF EXISTS peliculas_saga_ciencia_ficcion;

CREATE TABLE peliculas_saga_ciencia_ficcion (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(120) NOT NULL UNIQUE,
    saga VARCHAR(80) NOT NULL,
    episodio INT NOT NULL,
    fecha_estreno DATE NOT NULL,
    duracion_minutos INT NOT NULL,
    recaudacion_millones DECIMAL(10, 2) NOT NULL DEFAULT 0,
    estado ENUM(
        'estrenada',
        'en_produccion',
        'cancelada'
    ) NOT NULL DEFAULT 'en_produccion',
    CONSTRAINT chk_duracion_saga_ciencia_ficcion CHECK (duracion_minutos > 0),
    CONSTRAINT chk_episodio_saga_ciencia_ficcion CHECK (episodio > 0)
);
