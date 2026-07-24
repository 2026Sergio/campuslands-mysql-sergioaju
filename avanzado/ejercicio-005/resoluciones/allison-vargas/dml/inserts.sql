-- DML: Carga de 8 órdenes de taller para validar búsquedas indexadas
USE campuslands_mysql;

INSERT INTO ordenes_taller_avanzado 
(placa_moto, cliente, mecanico, fecha_ingreso, costo_total, estado_orden) 
VALUES
('M-101AAA', 'Laura Gómez', 'Carlos Ruiz', '2026-03-01', 120.00, 'entregada'),
('M-202BBB', 'Mario Estrada', 'Ana Gómez', '2026-03-02', 350.50, 'reparando'),
('M-303CCC', 'Sofia López', 'Carlos Ruiz', '2026-03-02', 85.00, 'lista'),
('M-404DDD', 'Diego Ramos', 'Luis Morales', '2026-03-03', 500.00, 'en_diagnostico'),
('M-101AAA', 'Laura Gómez', 'Ana Gómez', '2026-03-04', 45.00, 'recibida'),
('M-505EEE', 'Carmen Ortiz', 'Carlos Ruiz', '2026-03-04', 210.00, 'reparando'),
('M-606FFF', 'Jorge Perez', 'Luis Morales', '2026-03-05', 180.00, 'lista'),
('M-777GGG', 'Valeria Rios', 'Ana Gómez', '2026-03-05', 620.00, 'en_diagnostico');
