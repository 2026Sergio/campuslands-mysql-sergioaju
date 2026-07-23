USE campuslands_mysql;

INSERT INTO garaje_motos
(propietario, marca, modelo, cilindraje, costo_reparacion, fecha_ingreso, lista_para_entrega, estado) VALUES
('Marco Tul',    'Yamaha',   'FZ 150',    150, 320.00, '2026-06-01', FALSE, 'en_reparacion'),
('Lucia Ramos',  'Honda',    'CB 190R',   190, 180.50, '2026-06-03', TRUE,  'lista'),
('Estuardo Xol', 'Suzuki',   'GN 125',    125, 95.00,  '2026-06-05', TRUE,  'entregada'),
('Karla Us',     'Yamaha',   'YBR 125',   125, 210.75, '2026-06-08', FALSE, 'esperando_repuesto'),
('Diego Say',    'Bajaj',    'Pulsar 200',200, 450.00, '2026-06-10', FALSE, 'en_reparacion'),
('Ana Perez',    'Honda',    'XR 150',    150, 0.00,   '2026-06-12', FALSE, 'esperando_repuesto'),
('Marco Tul',    'Kawasaki', 'Ninja 300', 300, 610.20, '2026-06-15', TRUE,  'lista'),
('Rene Coy',     'Suzuki',   'GN 125',    125, 0.00,   '2026-06-18', FALSE, 'en_reparacion');