USE campuslands_mysql;

CREATE TABLE IF NOT EXISTS carreras_urbanas (
    carrera_id INT NOT NULL AUTO_INCREMENT,
    nombre_carrera VARCHAR(100) NOT NULL,
    ciudad VARCHAR(50) NOT NULL,
    cantidad_participantes INT NOT NULL,
    premio_total DECIMAL(12,2) NOT NULL,
    estado VARCHAR(30) NOT NULL,
    PRIMARY KEY (carrera_id)
);