-- basico/ejercicio-013 - maria-montepeque
USE campuslands_mysql;

DROP TABLE IF EXISTS catalogo_peliculas_miedo;

CREATE TABLE catalogo_peliculas_miedo (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(120) NOT NULL UNIQUE,
    director VARCHAR(80) NOT NULL,
    subgenero ENUM(
        'slasher',
        'paranormal',
        'psicologico',
        'zombis',
        'monstruos'
    ) NOT NULL,
    anio_estreno YEAR NOT NULL,
    duracion_minutos INT NOT NULL,
    calificacion DECIMAL(3, 1) NOT NULL DEFAULT 0,
    estado ENUM(
        'disponible',
        'proximamente',
        'retirado',
        'en_revision'
    ) NOT NULL DEFAULT 'en_revision',
    fecha_agregada DATE NOT NULL,
    CONSTRAINT chk_duracion_peliculas_miedo CHECK (duracion_minutos > 0),
    CONSTRAINT chk_calificacion_peliculas_miedo CHECK (calificacion BETWEEN 0 AND 10)
);
