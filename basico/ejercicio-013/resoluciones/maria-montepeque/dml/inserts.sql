-- basico/ejercicio-013 - maria-montepeque
USE campuslands_mysql;

INSERT INTO catalogo_peliculas_miedo
    (titulo, director, subgenero, anio_estreno, duracion_minutos, calificacion, estado, fecha_agregada)
VALUES
    ('Sombra en el Atico', 'Elena Vasquez', 'paranormal', 2022, 102, 8.2, 'disponible', '2026-01-10'),
    ('Cuchilla Silenciosa', 'Marco Duval', 'slasher', 2019, 95, 7.5, 'disponible', '2026-01-15'),
    ('Mente Fracturada', 'Elena Vasquez', 'psicologico', 2023, 110, 8.9, 'disponible', '2026-02-01'),
    ('Amanecer Muerto', 'Ivan Torres', 'zombis', 2021, 118, 7.1, 'disponible', '2026-02-10'),
    ('El Ultimo Experimento', 'Sara Blume', 'monstruos', 2024, 105, 6.8, 'proximamente', '2026-06-01'),
    ('Vinculo Oscuro', 'Ivan Torres', 'paranormal', 2025, 99, 7.9, 'proximamente', '2026-06-20'),
    ('Camino sin Retorno', 'Marco Duval', 'slasher', 2017, 90, 6.5, 'retirado', '2025-05-01'),
    ('Ecos del Manicomio', 'Sara Blume', 'psicologico', 2018, 108, 7.3, 'retirado', '2025-06-15'),
    ('Brote Nocturno', 'Elena Vasquez', 'zombis', 2020, 112, 7.7, 'disponible', '2026-03-05'),
    ('Presencia Invisible', 'Ivan Torres', 'paranormal', 2026, 100, 0.0, 'en_revision', '2026-07-18');
