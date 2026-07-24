-- avanzado/ejercicio-012 - maria-montepeque
USE campuslands_mysql;

DROP TABLE IF EXISTS canciones_playlist_window;

CREATE TABLE canciones_playlist_window (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(120) NOT NULL,
    artista VARCHAR(80) NOT NULL,
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
    CONSTRAINT chk_duracion_playlist_window CHECK (duracion_segundos > 0),
    CONSTRAINT chk_reproducciones_playlist_window CHECK (reproducciones >= 0)
);
