USE campuslands_mysql;

INSERT INTO taller_servicios_indexados (cliente, mecanico, tipo_servicio, costo, fecha_servicio, estado) VALUES
('Marco Tul',    'Edwin Us',  'Cambio de aceite',     45.00,  '2026-06-01', 'finalizada'),
('Lucia Ramos',  'Byron Xoc', 'Reparacion de frenos', 210.00, '2026-06-03', 'finalizada'),
('Estuardo Xol', 'Edwin Us',  'Cambio de llanta',     95.00,  '2026-06-05', 'finalizada'),
('Karla Us',     'Byron Xoc', 'Ajuste de motor',      340.00, '2026-06-08', 'en_proceso'),
('Diego Say',    'Fredy Cux', 'Cambio de cadena',     120.50, '2026-06-10', 'finalizada'),
('Ana Perez',    'Fredy Cux', 'Diagnostico general',  0.00,   '2026-06-12', 'pendiente'),
('Marco Tul',    'Edwin Us',  'Cambio de pastillas',  80.00,  '2026-06-15', 'finalizada'),
('Rene Coy',     'Byron Xoc', 'Revision electrica',   150.00, '2026-06-18', 'pendiente');

-- Caso limite: intento de insertar un duplicado exacto (mismo cliente, tipo y fecha) para probar el indice unico
-- Esta linea debe fallar por violar idx_unico_cliente_servicio_fecha
INSERT INTO taller_servicios_indexados (cliente, mecanico, tipo_servicio, costo, fecha_servicio, estado)
VALUES ('Marco Tul', 'Byron Xoc', 'Cambio de aceite', 50.00, '2026-06-01', 'pendiente');