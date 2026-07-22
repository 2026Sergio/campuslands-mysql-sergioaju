-- Datos de practica. Puedes cambiarlos o agregar mas filas.
USE campuslands_mysql;


INSERT INTO motos
(marca, modelo, cilindrada, placa, propietario, estado)
VALUES
('Yamaha','MT-03',321,'MTA001','Carlos Perez','Activo'),
('Honda','CB190R',184,'MTA002','Andrea Gomez','Activo'),
('Suzuki','GSX150',150,'MTA003','Luis Castillo','Activo'),
('Kawasaki','Ninja 400',399,'MTA004','Maria Lopez','Activo'),
('Bajaj','Pulsar NS200',200,'MTA005','Pedro Ramirez','Activo'),
('AKT','NKD125',125,'MTA006','Sofia Morales','Inactivo'),
('BMW','G310R',313,'MTA007','Daniel Torres','Activo'),
('KTM','Duke390',373,'MTA008','Laura Hernandez','Activo');


INSERT INTO servicios
(moto_id, descripcion, costo, fecha_servicio, mecanico, estado)
VALUES
(1,'Cambio de aceite premium',900.00,'2026-04-01','Juan Torres','Finalizado'),
(1,'Revision general',2500.00,'2026-04-10','Miguel Perez','Finalizado'),
(2,'Cambio de pastillas de freno',1200.00,'2026-04-02','Carlos Diaz','Finalizado'),
(3,'Mantenimiento preventivo',1800.00,'2026-04-03','Juan Torres','Pendiente'),
(4,'Reparacion motor',5200.00,'2026-04-04','Miguel Perez','Finalizado'),
(5,'Cambio de bateria',1400.00,'2026-04-05','Carlos Diaz','Finalizado'),
(7,'Revision electrica',1100.00,'2026-04-06','Juan Torres','Pendiente'),
(8,'Afinacion completa',3000.00,'2026-04-07','Miguel Perez','Finalizado');