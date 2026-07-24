-- intermedio/ejercicio-004 - maria-montepeque
USE campuslands_mysql;

-- Cada moto puede tener varios registros de servicio (tabla de historial,
-- no de inventario), lo que permite agrupar por placa y usar HAVING.
INSERT INTO registros_servicio_motos
    (placa, marca, tipo_servicio, mecanico, costo, fecha_servicio)
VALUES
    ('MTA-101', 'Yamaha', 'mantenimiento', 'Julio Sanchez', 85.00, '2026-01-10'),
    ('MTA-101', 'Yamaha', 'reparacion', 'Julio Sanchez', 320.50, '2026-03-15'),
    ('MTA-101', 'Yamaha', 'revision', 'Mario Ortiz', 60.00, '2026-06-01'),
    ('MTA-102', 'Honda', 'mantenimiento', 'Mario Ortiz', 90.00, '2026-01-20'),
    ('MTA-102', 'Honda', 'reparacion', 'Diego Rios', 275.75, '2026-04-05'),
    ('MTA-102', 'Honda', 'mantenimiento', 'Julio Sanchez', 88.50, '2026-06-25'),
    ('MTA-103', 'Kawasaki', 'reparacion', 'Diego Rios', 410.00, '2026-02-14'),
    ('MTA-103', 'Kawasaki', 'revision', 'Mario Ortiz', 65.00, '2026-05-10'),
    ('MTA-104', 'Suzuki', 'mantenimiento', 'Diego Rios', 95.25, '2026-03-01'),
    ('MTA-104', 'Suzuki', 'reparacion', 'Julio Sanchez', 350.00, '2026-07-01'),
    ('MTA-105', 'Yamaha', 'revision', 'Mario Ortiz', 40.00, '2026-05-20'),
    ('MTA-106', 'Honda', 'mantenimiento', 'Diego Rios', 100.00, '2026-06-15');
