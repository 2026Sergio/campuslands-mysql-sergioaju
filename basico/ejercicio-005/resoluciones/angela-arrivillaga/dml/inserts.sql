use campuslands_mysql;

-- insertamos 9 registros de ordenes de trabajo del taller
insert into basico_ejercicio_005 (descripcion_servicio, tipo_mantenimiento, costo_estimado, estado) values
('cambio de aceite y filtro', 'preventivo', 45.00, 'completado'),
('ajuste y lubricacion de cadena', 'preventivo', 20.00, 'completado'),
('cambio de pastillas de freno', 'correctivo', 65.50, 'en_proceso'),
('reparacion general del motor', 'correctivo', 350.00, 'en_proceso'),
('sincronizacion de carburador', 'preventivo', 80.00, 'pendiente'),
('cambio de kit de arrastre', 'correctivo', 120.00, 'completado'),
('alineacion y balanceo', 'preventivo', 35.00, 'pendiente'),
('reparacion del sistema electrico', 'correctivo', 95.00, 'en_proceso'),
('cambio de llanta trasera', 'preventivo', 110.00, 'completado');