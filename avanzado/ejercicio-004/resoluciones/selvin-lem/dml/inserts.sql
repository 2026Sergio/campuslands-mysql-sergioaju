USE campuslands_mysql;

INSERT INTO garaje_reparaciones_trigger (propietario, marca, costo, estado) VALUES
('Marco Tul',    'Yamaha', 45.00,  'pendiente'),
('Lucia Ramos',  'Honda',  210.00, 'pendiente'),
('Estuardo Xol', 'Suzuki', 95.00,  'pendiente'),
('Karla Us',     'Yamaha', 340.00, 'pendiente'),
('Diego Say',    'Bajaj',  -50.00, 'pendiente'),  -- caso limite: costo negativo, el trigger lo normaliza a 0
('Ana Perez',    'Honda',  120.00, 'pendiente'),
('Marco Tul',    'Kawasaki',80.00, 'pendiente'),
('Rene Coy',     'Suzuki', 150.00, 'pendiente');

-- Cambios de estado que disparan el trigger de auditoria
UPDATE garaje_reparaciones_trigger SET estado = 'en_proceso' WHERE propietario = 'Marco Tul' AND marca = 'Yamaha';
UPDATE garaje_reparaciones_trigger SET estado = 'finalizada' WHERE propietario = 'Lucia Ramos';
UPDATE garaje_reparaciones_trigger SET estado = 'en_proceso' WHERE propietario = 'Diego Say';
UPDATE garaje_reparaciones_trigger SET estado = 'finalizada' WHERE propietario = 'Diego Say';