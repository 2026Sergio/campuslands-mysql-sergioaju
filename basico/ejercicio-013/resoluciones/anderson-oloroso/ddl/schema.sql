USE campuslands_mysql;

CREATE TABLE IF NOT EXISTS catalogo_peliculas_miedo (
    pelicula_id INT NOT NULL AUTO_INCREMENT,
    titulo VARCHAR(100) NOT NULL,
    director VARCHAR(100) NOT NULL,
    anio_estreno INT NOT NULL,
    subgenero VARCHAR(50) NOT NULL,
    duracion_minutos INT NOT NULL,
    estado VARCHAR(30) NOT NULL,
    PRIMARY KEY (pelicula_id)
);