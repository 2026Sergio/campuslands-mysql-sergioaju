USE campuslands_mysql;

CREATE TABLE IF NOT EXISTS playlist_musical (
    playlist_id INT NOT NULL AUTO_INCREMENT,
    nombre_playlist VARCHAR(100) NOT NULL,
    creador VARCHAR(100) NOT NULL,
    genero_principal VARCHAR(50) NOT NULL,
    cantidad_canciones INT NOT NULL,
    duracion_minutos INT NOT NULL,
    estado VARCHAR(30) NOT NULL,
    PRIMARY KEY (playlist_id)
);



