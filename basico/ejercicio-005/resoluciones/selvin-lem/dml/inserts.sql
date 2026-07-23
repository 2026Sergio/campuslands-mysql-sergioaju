USE campuslands_mysql;

INSERT INTO taller_ordenes_servicio
(cliente, mecanico, tipo_servicio, horas_trabajo, costo_total, fecha_orden, garantia, estado) VALUES
('Marco Tul',    'Edwin Us',    'Cambio de aceite',        0.5, 45.00,  '2026-06-01', TRUE,  'entregada'),
('Lucia Ramos',  'Byron Xoc',   'Reparacion de frenos',    2.0, 210.00, '2026-06-03', TRUE,  'finalizada'),
('Estuardo Xol', 'Edwin Us',    'Cambio de llanta',        1.0, 95.00,  '2026-06-05', FALSE, 'entregada'),
('Karla Us',     'Byron Xoc',   'Ajuste de motor',         3.5, 340.00, '2026-06-08', FALSE, 'en_proceso'),
('Diego Say',    'Fredy Cux',   'Cambio de cadena',        1.5, 120.50, '2026-06-10', TRUE,  'finalizada'),
('Ana Perez',    'Fredy Cux',   'Diagnostico general',     0.5, 0.00,   '2026-06-12', FALSE, 'pendiente'),
('Marco Tul',    'Edwin Us',    'Cambio de pastillas',     1.0, 80.00,  '2026-06-15', TRUE,  'entregada'),
('Rene Coy',     'Byron Xoc',   'Revision electrica',      2.5, 150.00, '2026-06-18', FALSE, 'pendiente');