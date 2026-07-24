-- avanzado/ejercicio-012 - maria-montepeque
-- Se dejaron a proposito dos pares de canciones con la MISMA cantidad de
-- reproducciones (9800 y 22300), para poder mostrar la diferencia real
-- entre RANK() (deja huecos tras un empate) y DENSE_RANK() (no deja huecos).
USE campuslands_mysql;

INSERT INTO canciones_playlist_window
    (titulo, artista, genero, duracion_segundos, anio_lanzamiento, reproducciones)
VALUES
    ('Luces de Neon', 'Nova Sound', 'electronica', 214, 2023, 15400),
    ('Vibra Nocturna', 'Nova Sound', 'electronica', 221, 2023, 12700),
    ('Corazon de Vinilo', 'Ana Rios', 'pop', 198, 2022, 22300),
    ('Bajo la Lluvia', 'Ana Rios', 'pop', 203, 2022, 18900),
    ('Eco de Ayer', 'Ana Rios', 'pop', 210, 2024, 9800),
    ('Tormenta Electrica', 'Riff Storm', 'rock', 245, 2021, 9800),
    ('Motor en Marcha', 'Riff Storm', 'rock', 232, 2021, 7600),
    ('Ritmo del Barrio', 'DJ Kairo', 'reggaeton', 187, 2024, 31200),
    ('Solo Contigo', 'DJ Kairo', 'reggaeton', 195, 2024, 27500),
    ('Fuego Cruzado', 'DJ Kairo', 'reggaeton', 180, 2025, 19500),
    ('Noche de Saxo', 'Miles Ortega', 'jazz', 260, 2020, 4300),
    ('Cafe y Piano', 'Miles Ortega', 'jazz', 275, 2020, 3100),
    ('Estrella Fugaz', 'Luna Vega', 'pop', 205, 2025, 22300);
