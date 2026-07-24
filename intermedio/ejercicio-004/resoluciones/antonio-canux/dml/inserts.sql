-- Datos de practica para garaje de motos (10 por tabla).
USE campuslands_mysql;

INSERT INTO intermedio_ejercicio_004_marcas (nombre, pais_origen) 
    VALUES ('Honda', 'Japon'),
    ('Yamaha', 'Japon'),
    ('Kawasaki', 'Japon'),
    ('Suzuki', 'Japon'),
    ('Ducati', 'Italia'),
    ('BMW', 'Alemania'),
    ('KTM', 'Austria'),
    ('Triumph', 'Reino Unido'),
    ('Harley-Davidson', 'USA'),
    ('Aprilia', 'Italia');

INSERT INTO intermedio_ejercicio_004_motos (marca_id, modelo, cilindraje, precio, estado) 
    VALUES (1, 'CBR600RR', 599, 11000.00, 'disponible'),
    (1, 'Africa Twin', 1084, 15000.00, 'vendida'),
    (2, 'MT-07', 689, 8500.00, 'disponible'),
    (2, 'YZF-R3', 321, 5500.00, 'disponible'),
    (2, 'YZF-R1', 998, 18000.00, 'mantenimiento'),
    (3, 'Ninja 400', 399, 6000.00, 'vendida'),
    (3, 'Z900', 948, 10000.00, 'disponible'),
    (5, 'Panigale V4', 1103, 25000.00, 'disponible'),
    (6, 'S1000RR', 999, 20000.00, 'vendida'),
    (4, 'GSX-R750', 750, 12000.00, 'disponible');