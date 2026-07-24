-- avanzado/ejercicio-013 - maria-montepeque
USE campuslands_mysql;

INSERT INTO peliculas_miedo_json
    (titulo, anio_estreno, calificacion, detalles)
VALUES
    ('Sombra en el Atico', 2022, 8.2, JSON_OBJECT(
        'duracion_minutos', 102,
        'director', 'Elena Vasquez',
        'subgeneros', JSON_ARRAY('paranormal', 'casa_embrujada'),
        'reparto', JSON_ARRAY('Elena Vasquez', 'Marco Duval', 'Diego Palma'),
        'premios', JSON_ARRAY(JSON_OBJECT('nombre', 'Festival Sombras', 'anio', 2022))
    )),
    ('Mente Fracturada', 2023, 8.9, JSON_OBJECT(
        'duracion_minutos', 110,
        'director', 'Sara Blume',
        'subgeneros', JSON_ARRAY('psicologico', 'thriller'),
        'reparto', JSON_ARRAY('Elena Vasquez', 'Sara Blume', 'Ivan Torres'),
        'premios', JSON_ARRAY(
            JSON_OBJECT('nombre', 'Premio Nocturno', 'anio', 2023),
            JSON_OBJECT('nombre', 'Festival Sombras', 'anio', 2023)
        )
    )),
    ('Amanecer Muerto', 2021, 7.1, JSON_OBJECT(
        'duracion_minutos', 118,
        'director', 'Ivan Torres',
        'subgeneros', JSON_ARRAY('zombis', 'accion'),
        'reparto', JSON_ARRAY('Ivan Torres', 'Carla Nunez', 'Ruben Casal'),
        'premios', JSON_ARRAY()
    )),
    ('Brote Nocturno', 2020, 7.7, JSON_OBJECT(
        'duracion_minutos', 112,
        'director', 'Elena Vasquez',
        'subgeneros', JSON_ARRAY('zombis', 'paranormal'),
        'reparto', JSON_ARRAY('Elena Vasquez', 'Carla Nunez'),
        'premios', JSON_ARRAY()
    )),
    ('Ecos del Manicomio', 2018, 7.3, JSON_OBJECT(
        'duracion_minutos', 108,
        'director', 'Sara Blume',
        'subgeneros', JSON_ARRAY('psicologico', 'casa_embrujada'),
        'reparto', JSON_ARRAY('Sara Blume', 'Marco Duval', 'Diego Palma'),
        'premios', JSON_ARRAY(JSON_OBJECT('nombre', 'Premio Nocturno', 'anio', 2018))
    ));
