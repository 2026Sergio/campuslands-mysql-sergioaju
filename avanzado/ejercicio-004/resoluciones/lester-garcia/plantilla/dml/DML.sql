USE garaje_motos;

INSERT INTO clientes(nombre,telefono,correo,fecha_registro)
VALUES
('Juan Pérez','5555-1111','juan@email.com','2026-01-05'),
('Ana López','5555-2222','ana@email.com','2026-01-10'),
('Carlos Ruiz','5555-3333','carlos@email.com','2026-01-15'),
('María Gómez','5555-4444','maria@email.com','2026-01-20'),
('Luis Díaz','5555-5555','luis@email.com','2026-01-25'),
('Kevin Morales','5555-6666','kevin@email.com','2026-01-30');

INSERT INTO motos(placa,marca,modelo,anio,id_cliente)
VALUES
('M-100ABC','Yamaha','R3',2022,1),
('M-101BCD','Honda','CBR500R',2021,2),
('M-102CDE','Suzuki','GSX250R',2023,3),
('M-103DEF','Kawasaki','Ninja 400',2022,4),
('M-104EFG','KTM','Duke 390',2024,5),
('M-105FGH','Bajaj','Pulsar RS200',2023,6);

INSERT INTO servicios(nombre,precio)
VALUES
('Cambio de aceite',150.00),
('Cambio de frenos',300.00),
('Alineación',180.00),
('Diagnóstico',120.00),
('Cambio de llantas',450.00),
('Servicio completo',850.00);

INSERT INTO ordenes_servicio(id_moto,id_servicio,fecha_ingreso,estado)
VALUES
(1,1,'2026-02-01','Pendiente'),
(2,2,'2026-02-02','En Proceso'),
(3,3,'2026-02-03','Finalizado'),
(4,4,'2026-02-04','Pendiente'),
(5,5,'2026-02-05','En Proceso'),
(6,6,'2026-02-06','Pendiente');