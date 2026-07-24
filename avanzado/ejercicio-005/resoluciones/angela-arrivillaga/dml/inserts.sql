-- campuslands mysql - avanzado ejercicio 005
-- dml/inserts.sql

USE campuslands_mysql;

-- insertamos 8 registros de servicios de reparaciones y mantenimientos
INSERT INTO servicios_taller (placa_moto, mecanico, tipo_servicio, costo, estado, fecha_servicio) VALUES
('ABC-123', 'Carlos Gomez', 'Mantenimiento General', 150.00, 'completado', '2026-05-10'),
('XYZ-789', 'Ana Martinez', 'Cambio de Aceite', 45.00, 'completado', '2026-05-12'),
('MTO-456', 'Carlos Gomez', 'Reparacion de Frenos', 120.00, 'en_proceso', '2026-05-14'),
('KLR-321', 'Luis Rodriguez', 'Ajuste de Cadena', 30.00, 'completado', '2026-05-15'),
('ABC-123', 'Ana Martinez', 'Cambio de Llantas', 220.00, 'en_proceso', '2026-05-18'),
('GTR-654', 'Carlos Gomez', 'Revision Electrica', 90.00, 'cancelado', '2026-05-19'),
('FOX-987', 'Luis Rodriguez', 'Mantenimiento General', 160.00, 'completado', '2026-05-20'),
('XYZ-789', 'Ana Martinez', 'Sincronizacion Motor', 200.00, 'completado', '2026-05-21');