-- DML: Registro de 8 trabajos para pruebas de subconsultas analíticas
USE campuslands_mysql;

INSERT INTO trabajos_taller_intermedio 
(placa_moto, cliente, mecanico, tipo_reparacion, costo_total, horas_laboradas, estado) 
VALUES
('M-101AAA', 'Laura Gómez', 'Carlos Ruiz', 'Mantenimiento General', 120.00, 2.5, 'finalizado'),
('M-202BBB', 'Mario Estrada', 'Ana Gómez', 'Overhaul Motor', 450.00, 8.0, 'finalizado'),
('M-303CCC', 'Sofia López', 'Carlos Ruiz', 'Cambio de Frenos', 85.00, 1.5, 'finalizado'),
('M-404DDD', 'Diego Ramos', 'Luis Morales', 'Diagnóstico Eléctrico', 150.00, 3.0, 'en_proceso'),
('M-505EEE', 'Carmen Ortiz', 'Carlos Ruiz', 'Ajuste de Carburador', 95.00, 2.0, 'finalizado'),
('M-606FFF', 'Jorge Perez', 'Luis Morales', 'Cambio de Kit Arrastre', 180.00, 3.5, 'finalizado'),
('M-777GGG', 'Valeria Rios', 'Ana Gómez', 'Reparación de Transmisión', 380.00, 6.5, 'finalizado'),
('M-808HHH', 'Esteban Marín', 'Luis Morales', 'Alineación y Balanceo', 60.00, 1.0, 'en_espera');
