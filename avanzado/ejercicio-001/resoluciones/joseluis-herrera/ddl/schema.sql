CREATE TABLE juegos (
    id_juego INT AUTO_INCREMENT PRIMARY KEY,
    nombre_juego VARCHAR(50) NOT NULL
);

CREATE TABLE equipos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    victorias INT NOT NULL, 
    derrotas INT NOT NULL, 
    puntuaje INT NOT NULL, 
    fecha_registro DATE NOT NULL, 
    id_juego INT,
    UNIQUE(nombre),
    CONSTRAINT fk_equipo_juego FOREIGN KEY (id_juego) REFERENCES juegos(id_juego)
);
