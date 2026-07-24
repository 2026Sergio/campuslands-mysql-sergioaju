-- intermedio/ejercicio-013 - maria-montepeque
USE campuslands_mysql;

INSERT INTO peliculas_miedo_puente
    (titulo, anio_estreno, duracion_minutos, calificacion)
VALUES
    ('Sombra en el Atico', 2022, 102, 8.2),
    ('Mente Fracturada', 2023, 110, 8.9),
    ('Amanecer Muerto', 2021, 118, 7.1),
    ('Brote Nocturno', 2020, 112, 7.7),
    ('Ecos del Manicomio', 2018, 108, 7.3);

INSERT INTO actores_miedo
    (nombre, nacionalidad)
VALUES
    ('Elena Vasquez', 'Mexico'),
    ('Marco Duval', 'Francia'),
    ('Ivan Torres', 'Argentina'),
    ('Sara Blume', 'Estados Unidos'),
    ('Diego Palma', 'Colombia'),
    ('Carla Nunez', 'Espana'),
    ('Ruben Casal', 'Chile');

INSERT INTO reparto_pelicula_miedo
    (pelicula_id, actor_id, personaje)
VALUES
    ((SELECT id FROM peliculas_miedo_puente WHERE titulo = 'Sombra en el Atico'), (SELECT id FROM actores_miedo WHERE nombre = 'Elena Vasquez'), 'Laura'),
    ((SELECT id FROM peliculas_miedo_puente WHERE titulo = 'Sombra en el Atico'), (SELECT id FROM actores_miedo WHERE nombre = 'Marco Duval'), 'Dr. Hoffman'),
    ((SELECT id FROM peliculas_miedo_puente WHERE titulo = 'Sombra en el Atico'), (SELECT id FROM actores_miedo WHERE nombre = 'Diego Palma'), 'Vecino'),
    ((SELECT id FROM peliculas_miedo_puente WHERE titulo = 'Mente Fracturada'), (SELECT id FROM actores_miedo WHERE nombre = 'Elena Vasquez'), 'Dra. Reyes'),
    ((SELECT id FROM peliculas_miedo_puente WHERE titulo = 'Mente Fracturada'), (SELECT id FROM actores_miedo WHERE nombre = 'Sara Blume'), 'Paciente'),
    ((SELECT id FROM peliculas_miedo_puente WHERE titulo = 'Mente Fracturada'), (SELECT id FROM actores_miedo WHERE nombre = 'Ivan Torres'), 'Detective'),
    ((SELECT id FROM peliculas_miedo_puente WHERE titulo = 'Amanecer Muerto'), (SELECT id FROM actores_miedo WHERE nombre = 'Ivan Torres'), 'Comandante'),
    ((SELECT id FROM peliculas_miedo_puente WHERE titulo = 'Amanecer Muerto'), (SELECT id FROM actores_miedo WHERE nombre = 'Carla Nunez'), 'Sobreviviente'),
    ((SELECT id FROM peliculas_miedo_puente WHERE titulo = 'Amanecer Muerto'), (SELECT id FROM actores_miedo WHERE nombre = 'Ruben Casal'), 'Soldado'),
    ((SELECT id FROM peliculas_miedo_puente WHERE titulo = 'Brote Nocturno'), (SELECT id FROM actores_miedo WHERE nombre = 'Elena Vasquez'), 'Cientifica'),
    ((SELECT id FROM peliculas_miedo_puente WHERE titulo = 'Brote Nocturno'), (SELECT id FROM actores_miedo WHERE nombre = 'Carla Nunez'), 'Enfermera'),
    ((SELECT id FROM peliculas_miedo_puente WHERE titulo = 'Ecos del Manicomio'), (SELECT id FROM actores_miedo WHERE nombre = 'Sara Blume'), 'Interna'),
    ((SELECT id FROM peliculas_miedo_puente WHERE titulo = 'Ecos del Manicomio'), (SELECT id FROM actores_miedo WHERE nombre = 'Marco Duval'), 'Guardia'),
    ((SELECT id FROM peliculas_miedo_puente WHERE titulo = 'Ecos del Manicomio'), (SELECT id FROM actores_miedo WHERE nombre = 'Diego Palma'), 'Doctor');
