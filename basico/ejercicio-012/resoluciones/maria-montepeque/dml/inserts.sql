-- basico/ejercicio-012 - maria-montepeque
USE campuslands_mysql;

INSERT INTO canciones_playlist_musical
    (titulo, artista, album, genero, duracion_segundos, anio_lanzamiento, reproducciones, favorita, estado, fecha_agregada)
VALUES
    ('Luces de Neon', 'Nova Sound', 'Horizonte', 'electronica', 214, 2023, 15400, TRUE, 'activa', '2026-01-05'),
    ('Corazon de Vinilo', 'Ana Rios', 'Retrato', 'pop', 198, 2022, 22300, TRUE, 'activa', '2026-01-10'),
    ('Tormenta Electrica', 'Riff Storm', 'Voltaje', 'rock', 245, 2021, 9800, FALSE, 'activa', '2026-02-01'),
    ('Ritmo del Barrio', 'DJ Kairo', 'Calle Viva', 'reggaeton', 187, 2024, 31200, TRUE, 'activa', '2026-02-14'),
    ('Noche de Saxo', 'Miles Ortega', 'Azul Profundo', 'jazz', 260, 2020, 4300, FALSE, 'archivada', '2025-11-20'),
    ('Bajo la Lluvia', 'Ana Rios', 'Retrato', 'pop', 203, 2022, 18900, FALSE, 'activa', '2026-01-10'),
    ('Motor en Marcha', 'Riff Storm', 'Voltaje', 'rock', 232, 2021, 7600, FALSE, 'activa', '2026-02-01'),
    ('Vibra Nocturna', 'Nova Sound', 'Horizonte', 'electronica', 221, 2023, 12700, FALSE, 'activa', '2026-01-05'),
    ('Solo Contigo', 'DJ Kairo', 'Calle Viva', 'reggaeton', 195, 2024, 27500, TRUE, 'activa', '2026-02-14'),
    ('Cafe y Piano', 'Miles Ortega', 'Azul Profundo', 'jazz', 275, 2020, 3100, FALSE, 'archivada', '2025-11-20');
