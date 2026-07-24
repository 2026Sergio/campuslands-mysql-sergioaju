-- intermedio/ejercicio-013 - maria-montepeque
-- Objetivo: tablas puente (relacion muchos a muchos).
-- Una pelicula tiene varios actores y un actor puede aparecer en varias
-- peliculas. Esa relacion N:M no se puede modelar con una sola FK en
-- ninguna de las dos tablas, por eso se usa una tercera tabla (puente)
-- que conecta ambas mediante dos FK.
USE campuslands_mysql;

DROP TABLE IF EXISTS reparto_pelicula_miedo;
DROP TABLE IF EXISTS peliculas_miedo_puente;
DROP TABLE IF EXISTS actores_miedo;

CREATE TABLE peliculas_miedo_puente (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(120) NOT NULL UNIQUE,
    anio_estreno YEAR NOT NULL,
    duracion_minutos INT NOT NULL,
    calificacion DECIMAL(3, 1) NOT NULL DEFAULT 0,
    CONSTRAINT chk_duracion_peliculas_puente CHECK (duracion_minutos > 0),
    CONSTRAINT chk_calificacion_peliculas_puente CHECK (calificacion BETWEEN 0 AND 10)
);

CREATE TABLE actores_miedo (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(80) NOT NULL UNIQUE,
    nacionalidad VARCHAR(60) NOT NULL
);

-- Tabla puente: cada fila conecta una pelicula con un actor y guarda el
-- personaje que interpreto (dato propio de la relacion, no de la pelicula
-- ni del actor por separado).
CREATE TABLE reparto_pelicula_miedo (
    id INT AUTO_INCREMENT PRIMARY KEY,
    pelicula_id INT NOT NULL,
    actor_id INT NOT NULL,
    personaje VARCHAR(80) NOT NULL,
    CONSTRAINT fk_reparto_pelicula
        FOREIGN KEY (pelicula_id)
        REFERENCES peliculas_miedo_puente(id),
    CONSTRAINT fk_reparto_actor
        FOREIGN KEY (actor_id)
        REFERENCES actores_miedo(id),
    CONSTRAINT uq_pelicula_actor UNIQUE (pelicula_id, actor_id)
);
