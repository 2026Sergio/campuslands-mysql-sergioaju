USE campuslands_mysql;

CREATE TABLE IF NOT EXISTS biblioteca_gamer (
    juego_id INT NOT NULL AUTO_INCREMENT,
    titulo VARCHAR(100) NOT NULL,
    genero VARCHAR(50) NOT NULL,
    plataforma VARCHAR(50) NOT NULL,
    anio_lanzamiento INT NOT NULL,
    estado VARCHAR(30) NOT NULL,
    PRIMARY KEY (juego_id)
);

CREATE TABLE IF NOT EXISTS prestamos_gamer (
    prestamo_id INT NOT NULL AUTO_INCREMENT,
    juego_id INT NOT NULL,
    nombre_usuario VARCHAR(100) NOT NULL,
    fecha_prestamo DATE NOT NULL,
    fecha_devolucion DATE,
    estado VARCHAR(30) NOT NULL,
    PRIMARY KEY (prestamo_id),
    FOREIGN KEY (juego_id) REFERENCES biblioteca_gamer(juego_id)
);