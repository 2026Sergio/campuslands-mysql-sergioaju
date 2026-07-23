USE campuslands_mysql;

INSERT INTO inventario_skins
(jugador, nombre_skin, arma, rareza, precio, fecha_obtencion, equipada, estado)
 VALUES
('Zephyra', 'Ceniza Carmesi',    'rifle',    'legendario', 89.99, '2026-05-10', TRUE,  'disponible'),
('Zephyra', 'Sombra Nocturna',   'pistola',  'epico',      34.50, '2026-05-12', FALSE, 'disponible'),
('Kron',    'Furia Electrica',   'rifle',    'raro',       15.00, '2026-06-01', TRUE,  'disponible'),
('Kron',    'Oxido de Guerra',   'escopeta', 'comun',      2.99,  '2026-06-01', FALSE, 'disponible'),
('Ilyra',   'Ceniza Carmesi',    'rifle',    'legendario', 89.99, '2026-06-15', FALSE, 'bloqueada'),
('Ilyra',   'Cristal Ártico',    'sniper',   'epico',      42.00, '2026-06-20', TRUE,  'disponible'),
('Draken',  'Veneno Digital',    'pistola',  'raro',       18.75, '2026-07-02', FALSE, 'en_revision'),
('Draken',  'Grafiti Urbano',    'escopeta', 'comun',      0.00,  '2026-07-05', FALSE, 'disponible');