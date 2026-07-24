-- basico/ejercicio-012 - maria-montepeque
USE campuslands_mysql;

DROP TABLE IF EXISTS canciones_playlist_musical;

CREATE TABLE canciones_playlist_musical (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(120) NOT NULL,
    artista VARCHAR(80) NOT NULL,
    album VARCHAR(120) NOT NULL,
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
    favorita BOOLEAN NOT NULL DEFAULT FALSE,
    estado ENUM(
        'activa',
        'archivada'
    ) NOT NULL DEFAULT 'activa',
    fecha_agregada DATE NOT NULL,
    CONSTRAINT chk_duracion_playlist CHECK (duracion_segundos > 0),
    CONSTRAINT chk_reproducciones_playlist CHECK (reproducciones >= 0),
    CONSTRAINT uq_titulo_artista_playlist UNIQUE (titulo, artista)
);
