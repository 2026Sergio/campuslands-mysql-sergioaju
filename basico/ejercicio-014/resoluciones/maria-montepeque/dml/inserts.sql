-- basico/ejercicio-014 - maria-montepeque
USE campuslands_mysql;

INSERT INTO peliculas_saga_ciencia_ficcion
    (titulo, saga, episodio, fecha_estreno, duracion_minutos, recaudacion_millones, estado)
VALUES
    ('Estelar Infinito: Origen', 'Estelar Infinito', 1, '1999-05-19', 136, 924.32, 'estrenada'),
    ('Estelar Infinito: Fractura', 'Estelar Infinito', 2, '2002-05-16', 142, 649.40, 'estrenada'),
    ('Estelar Infinito: Convergencia', 'Estelar Infinito', 3, '2005-05-19', 140, 848.75, 'estrenada'),
    ('Estelar Infinito: Renacer', 'Estelar Infinito', 4, '2027-12-17', 155, 0.00, 'en_produccion'),
    ('Horizonte Cuantico: Umbral', 'Horizonte Cuantico', 1, '2014-11-05', 169, 677.47, 'estrenada'),
    ('Horizonte Cuantico: Vortice', 'Horizonte Cuantico', 2, '2018-03-09', 132, 202.06, 'estrenada'),
    ('Horizonte Cuantico: Colapso', 'Horizonte Cuantico', 3, '2026-11-20', 150, 0.00, 'en_produccion'),
    ('Custodios del Vacio: Alba', 'Custodios del Vacio', 1, '2009-12-18', 162, 2847.24, 'estrenada'),
    ('Custodios del Vacio: Ocaso', 'Custodios del Vacio', 2, '2022-12-16', 192, 2320.25, 'estrenada'),
    ('Custodios del Vacio: Fragmento', 'Custodios del Vacio', 3, '2019-08-30', 100, 0.50, 'cancelada');
