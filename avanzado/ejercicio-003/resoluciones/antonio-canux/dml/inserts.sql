-- Datos de practica para inventario de skins (10 por tabla).
USE campuslands_mysql;

INSERT INTO avanzado_ejercicio_003_colecciones (nombre, tematica) 
    VALUES ('Prime', 'Futurista Dorado'),
    ('Reaver', 'Oscura'),
    ('Glitchpop', 'Cyberpunk'),
    ('Oni', 'Demonio Japones'),
    ('Elderflame', 'Dragones'),
    ('Sovereign', 'Celestial'),
    ('Ion', 'Sci-Fi Blanco'),
    ('Singularity', 'Agujero Negro'),
    ('RGX 11z Pro', 'Gaming RGB'),
    ('Magepunk', 'Steampunk Magico');
    
INSERT INTO avanzado_ejercicio_003_skins (coleccion_id, nombre_arma, precio_puntos) 
    VALUES (1, 'Vandal', 1775),
    (2, 'Sheriff', 1775),
    (3, 'Phantom', 2175),
    (4, 'Phantom', 1775),
    (5, 'Operator', 2475),
    (6, 'Ghost', 1775),
    (7, 'Operator', 1775),
    (8, 'Ares', 2175),
    (9, 'Vandal', 2175),
    (10, 'Spectre', 1775);