-- datos de prueba para el taller mecanico de motos
USE campuslands_mysql;

-- insertamos 9 registros de servicios de mantenimiento
INSERT INTO reparaciones (moto, tipo_servicio, costo, estado) VALUES
('Yamaha MT-03', 'cambio de aceite', 45.00, 'completado'),
('Honda CB190R', 'frenos y guayas', 60.00, 'completado'),
('KTM Duke 200', 'mantenimiento general', 180.00, 'en_proceso'),
('Kawasaki Z400', 'cambio de kit de arrastre', 120.00, 'completado'),
('Suzuki Gixxer 150', 'cambio de aceite', 40.00, 'completado'),
('Yamaha R15', 'sincronizacion de motor', 150.00, 'pendiente'),
('Honda XR 190', 'mantenimiento general', 190.00, 'completado'),
('Bajaj Pulsar NS200', 'frenos y guayas', 55.00, 'en_proceso'),
('TVS Apache 200', 'cambio de llantas', 110.00, 'pendiente');