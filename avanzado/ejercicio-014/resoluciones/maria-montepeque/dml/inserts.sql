-- avanzado/ejercicio-014 - maria-montepeque
-- "Horizonte Cuantico: Colapso" se carga a proposito como "en_produccion"
-- con una fecha_estreno YA PASADA (respecto a la fecha actual del sistema),
-- para que el EVENT tenga algo real que actualizar en su primera corrida.
USE campuslands_mysql;

INSERT INTO peliculas_saga_cf_events
    (titulo, saga, episodio, fecha_estreno, estado)
VALUES
    ('Estelar Infinito: Origen', 'Estelar Infinito', 1, '1999-05-19', 'estrenada'),
    ('Estelar Infinito: Fractura', 'Estelar Infinito', 2, '2002-05-16', 'estrenada'),
    ('Estelar Infinito: Renacer', 'Estelar Infinito', 4, '2027-12-17', 'en_produccion'),
    ('Horizonte Cuantico: Umbral', 'Horizonte Cuantico', 1, '2014-11-05', 'estrenada'),
    ('Horizonte Cuantico: Colapso', 'Horizonte Cuantico', 3, '2026-07-01', 'en_produccion'),
    ('Custodios del Vacio: Alba', 'Custodios del Vacio', 1, '2009-12-18', 'estrenada'),
    ('Custodios del Vacio: Fragmento', 'Custodios del Vacio', 3, '2019-08-30', 'cancelada');
