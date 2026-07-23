USE torneo_esports_moba;

INSERT INTO equipos(nombre,pais,fecha_fundacion,entrenador)
VALUES
('Dragons Fire','Corea del Sur','2018-02-10','Kim Soo'),
('Titan Wolves','Estados Unidos','2017-04-15','Michael Ross'),
('Shadow Legends','España','2019-01-20','Carlos Díaz'),
('Blue Phoenix','Brasil','2016-08-30','Pedro Alves'),
('Storm Elite','México','2020-05-18','Luis Herrera'),
('Iron Kings','Canadá','2015-09-12','James Clark'),
('Night Ravens','Argentina','2021-03-11','Matías Gómez'),
('Golden Fox','Chile','2018-11-25','Felipe Soto'),
('Crystal Force','Perú','2019-06-14','Andrés Salazar'),
('Omega Squad','Colombia','2017-12-01','Juan Pérez');

INSERT INTO jugadores(nickname,nombre,rol,edad,nacionalidad,id_equipo)
VALUES
('DragonX','Lee Min','Top',21,'Corea del Sur',1),
('WolfPro','John Carter','Jungla',23,'Estados Unidos',2),
('ShadowAce','Mario Ruiz','Mid',22,'España',3),
('BlueShot','Lucas Silva','ADC',20,'Brasil',4),
('StormKing','Diego López','Support',24,'México',5),
('IronTank','Ryan Scott','Top',26,'Canadá',6),
('NightFox','Tomás Díaz','Mid',22,'Argentina',7),
('GoldenAim','Felipe Rojas','ADC',21,'Chile',8),
('CrystalSoul','Luis Torres','Support',23,'Perú',9),
('OmegaPower','Kevin Gómez','Jungla',25,'Colombia',10);

INSERT INTO torneos(nombre,ciudad,fecha_inicio,fecha_fin,premio)
VALUES
('MOBA Masters 2026','Seúl','2026-02-01','2026-02-07',50000),
('Champions Arena','Madrid','2026-03-10','2026-03-15',35000),
('Legends Cup','São Paulo','2026-04-05','2026-04-12',45000),
('Global Clash','Ciudad de México','2026-05-20','2026-05-27',60000),
('Infinity League','Toronto','2026-06-15','2026-06-22',55000),
('Pro Battle','Bogotá','2026-07-01','2026-07-08',30000),
('Ultimate Showdown','Lima','2026-08-12','2026-08-18',40000),
('World Elite','Santiago','2026-09-03','2026-09-10',70000);

INSERT INTO partidas(id_torneo,equipo_local,equipo_visitante,ganador,fecha,duracion_minutos)
VALUES
(1,1,2,1,'2026-02-02',38),
(1,3,4,4,'2026-02-03',42),
(2,5,6,6,'2026-03-11',35),
(2,7,8,8,'2026-03-12',39),
(3,9,10,10,'2026-04-06',41),
(4,1,3,1,'2026-05-21',37),
(5,2,5,2,'2026-06-16',40),
(6,4,6,6,'2026-07-03',33),
(7,8,9,8,'2026-08-14',44),
(8,10,1,1,'2026-09-05',36);