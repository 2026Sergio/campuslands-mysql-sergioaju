-- DML: Registro de 8 servicios prestados en el garaje
USE campuslands_mysql;

INSERT INTO servicios_motos_intermedio 
(placa, tipo_servicio, marca_moto, costo_mano_obra, costo_repuestos, mecanico_asignado, estado_servicio) 
VALUES
('M-101AAA', 'mantenimiento_preventivo', 'Yamaha', 50.00, 30.00, 'Carlos Ruiz', 'completado'),
('M-202BBB', 'reparacion_motor', 'Honda', 250.00, 180.00, 'Carlos Ruiz', 'completado'),
('M-303CCC', 'sistema_electrico', 'Kawasaki', 80.00, 45.00, 'Ana Gómez', 'completado'),
('M-404DDD', 'mantenimiento_preventivo', 'BMW', 90.00, 60.00, 'Carlos Ruiz', 'completado'),
('M-505EEE', 'cambio_frenos', 'KTM', 40.00, 55.00, 'Ana Gómez', 'completado'),
('M-606FFF', 'pintura', 'Suzuki', 180.00, 120.00, 'Luis Morales', 'en_proceso'),
('M-777GGG', 'reparacion_motor', 'Ducati', 350.00, 280.00, 'Ana Gómez', 'completado'),
('M-808HHH', 'mantenimiento_preventivo', 'Royal Enfield', 60.00, 25.00, 'Luis Morales', 'completado');
