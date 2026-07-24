USE garaje_motos;

INSERT INTO propietarios(nombre,documento,telefono) VALUES
('Juan Pérez','100001','5555-1001'),
('Luis Gómez','100002','5555-1002'),
('Carlos Díaz','100003','5555-1003'),
('María López','100004','5555-1004'),
('Ana Morales','100005','5555-1005'),
('Pedro Castillo','100006','5555-1006');

INSERT INTO motos(placa,marca,modelo,anio,id_propietario) VALUES
('MOT101','Yamaha','FZ25',2022,1),
('MOT102','Honda','CB190R',2021,2),
('MOT103','Suzuki','Gixxer',2023,3),
('MOT104','KTM','Duke 200',2022,4),
('MOT105','Bajaj','Pulsar NS200',2020,5),
('MOT106','TVS','Apache RTR 200',2021,6);

INSERT INTO servicios(nombre,costo) VALUES
('Cambio de aceite',180.00),
('Cambio de llantas',850.00),
('Alineación',120.00),
('Revisión de frenos',250.00),
('Cambio de batería',600.00),
('Lavado completo',80.00);

INSERT INTO historial_servicios(id_moto,id_servicio,fecha,cantidad) VALUES
(1,1,'2026-01-10',1),
(1,4,'2026-02-15',2),
(2,2,'2026-01-18',1),
(2,6,'2026-03-20',3),
(3,3,'2026-02-08',2),
(4,5,'2026-04-12',1),
(5,1,'2026-05-03',4),
(6,4,'2026-05-15',2),
(5,6,'2026-06-01',2),
(3,1,'2026-06-18',1);