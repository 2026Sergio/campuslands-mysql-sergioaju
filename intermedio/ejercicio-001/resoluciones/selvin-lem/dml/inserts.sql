USE campuslands_mysql;

INSERT INTO equipos (nombre_equipo, region, fecha_fundacion, estado) VALUES
('Dragones Rojos',  'LATAM',  '2023-01-15', 'activo'),
('Lobos de Acero',  'LATAM',  '2022-08-20', 'activo'),
('Fenix Escarlata', 'NA',     '2024-02-10', 'activo'),
('Ronin Digital',   'NA',     '2021-05-30', 'retirado');

INSERT INTO jugadores_torneo (id_equipo, nombre_jugador, rol, puntaje, estado) VALUES
(1, 'Kairos',   'mid',     87.50, 'activo'),
(1, 'Vantex',   'top',     79.20, 'activo'),
(2, 'Nyxara',   'support', 65.00, 'activo'),
(2, 'Ferox',    'jungla',  91.30, 'activo'),
(2, 'Blitzen',  'adc',     73.80, 'banca'),
(3, 'Serath',   'top',     68.40, 'activo'),
(3, 'Onyxia',   'mid',     55.10, 'activo'),
(4, 'Draven99', 'adc',     40.00, 'inactivo');