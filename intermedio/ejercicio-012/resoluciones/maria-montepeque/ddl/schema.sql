-- intermedio/ejercicio-012 - maria-montepeque
USE campuslands_mysql;

DROP TABLE IF EXISTS canciones_playlist_reportes;
DROP TABLE IF EXISTS artistas_playlist_reportes;

CREATE TABLE artistas_playlist_reportes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(80) NOT NULL UNIQUE,
    pais VARCHAR(60) NOT NULL
);

CREATE TABLE canciones_playlist_reportes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(120) NOT NULL,
    artista_id INT NOT NULL,
    genero ENUM(
        'pop',
        'rock',
        'electronica',
        'reggaeton',
        'jazz'
    ) NOT NULL,
    duracion_segundos INT NOT NULL,
    anio_lanzamiento YEAR NOT NULL,
    reproducciones INT NOT NULL DEFAULT 0,
    CONSTRAINT fk_canciones_artista_reportes
        FOREIGN KEY (artista_id)
        REFERENCES artistas_playlist_reportes(id),
    CONSTRAINT uq_titulo_artista_reportes UNIQUE (titulo, artista_id),
    CONSTRAINT chk_duracion_playlist_reportes CHECK (duracion_segundos > 0),
    CONSTRAINT chk_reproducciones_playlist_reportes CHECK (reproducciones >= 0)
);
