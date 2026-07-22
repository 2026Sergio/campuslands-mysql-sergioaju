-- intermedio/ejercicio-012 - maria-montepeque
USE campuslands_mysql;

INSERT INTO artistas_playlist_reportes
    (nombre, pais)
VALUES
    ('Nova Sound', 'Suecia'),
    ('Ana Rios', 'Espana'),
    ('Riff Storm', 'Estados Unidos'),
    ('DJ Kairo', 'Colombia'),
    ('Miles Ortega', 'Argentina'),
    ('Luna Vega', 'Mexico');

INSERT INTO canciones_playlist_reportes
    (titulo, artista_id, genero, duracion_segundos, anio_lanzamiento, reproducciones)
VALUES
    ('Luces de Neon', (SELECT id FROM artistas_playlist_reportes WHERE nombre = 'Nova Sound'), 'electronica', 214, 2023, 15400),
    ('Vibra Nocturna', (SELECT id FROM artistas_playlist_reportes WHERE nombre = 'Nova Sound'), 'electronica', 221, 2023, 12700),
    ('Corazon de Vinilo', (SELECT id FROM artistas_playlist_reportes WHERE nombre = 'Ana Rios'), 'pop', 198, 2022, 22300),
    ('Bajo la Lluvia', (SELECT id FROM artistas_playlist_reportes WHERE nombre = 'Ana Rios'), 'pop', 203, 2022, 18900),
    ('Eco de Ayer', (SELECT id FROM artistas_playlist_reportes WHERE nombre = 'Ana Rios'), 'pop', 210, 2024, 9800),
    ('Tormenta Electrica', (SELECT id FROM artistas_playlist_reportes WHERE nombre = 'Riff Storm'), 'rock', 245, 2021, 9800),
    ('Motor en Marcha', (SELECT id FROM artistas_playlist_reportes WHERE nombre = 'Riff Storm'), 'rock', 232, 2021, 7600),
    ('Ritmo del Barrio', (SELECT id FROM artistas_playlist_reportes WHERE nombre = 'DJ Kairo'), 'reggaeton', 187, 2024, 31200),
    ('Solo Contigo', (SELECT id FROM artistas_playlist_reportes WHERE nombre = 'DJ Kairo'), 'reggaeton', 195, 2024, 27500),
    ('Fuego Cruzado', (SELECT id FROM artistas_playlist_reportes WHERE nombre = 'DJ Kairo'), 'reggaeton', 180, 2025, 19500),
    ('Noche de Saxo', (SELECT id FROM artistas_playlist_reportes WHERE nombre = 'Miles Ortega'), 'jazz', 260, 2020, 4300),
    ('Cafe y Piano', (SELECT id FROM artistas_playlist_reportes WHERE nombre = 'Miles Ortega'), 'jazz', 275, 2020, 3100),
    ('Estrella Fugaz', (SELECT id FROM artistas_playlist_reportes WHERE nombre = 'Luna Vega'), 'pop', 205, 2025, 25600);
