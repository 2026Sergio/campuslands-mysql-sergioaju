USE campuslands_mysql;

CREATE TABLE IF NOT EXISTS saga_ciencia_ficcion (
    pelicula_id INT NOT NULL AUTO_INCREMENT,
    titulo VARCHAR(100) NOT NULL,
    director VARCHAR(100) NOT NULL,
    fecha_estreno DATE NOT NULL,
    presupuesto DECIMAL(15,2) NOT NULL,
    estado VARCHAR(30) NOT NULL,
    PRIMARY KEY (pelicula_id)
);