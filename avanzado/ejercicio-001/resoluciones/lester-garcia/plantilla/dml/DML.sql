USE torneo_esports_moba;

INSERT INTO equipos(nombre,ciudad,entrenador,fecha_creacion)
VALUES
('Dragons Elite','Guatemala','Luis Soto','2019-02-10'),
('Shadow Wolves','Quetzaltenango','Mario Diaz','2020-05-18'),
('Cyber Titans','Escuintla','Carlos Ramos','2018-09-15'),
('Infinity Force','Antigua','Diego Perez','2021-04-20'),
('Blue Phoenix','Peten','Andrea Lopez','2022-06-11'),
('Storm Gaming','Coban','Kevin Morales','2019-11-08');

INSERT INTO jugadores(nombre,nickname,rol,edad,nacionalidad,id_equipo)
VALUES
('Juan Perez','DarkFire','Top',22,'Guatemala',1),
('Luis Gomez','HunterX','Jungla',21,'Guatemala',1),
('Mario Ruiz','MagePro','Mid',20,'Guatemala',2),
('Carlos Diaz','Sniper','ADC',23,'Guatemala',3),
('Jose Ramirez','Guardian','Support',24,'Guatemala',4),
('Kevin Soto','Blizzard','Mid',22,'Guatemala',5);

INSERT INTO torneos(nombre,ciudad,fecha_inicio,fecha_fin,premio)
VALUES
('MOBA Masters 2026','Guatemala','2026-01-10','2026-01-15',25000),
('Champions Arena','Antigua','2026-03-20','2026-03-25',18000),
('Elite League','Escuintla','2026-05-10','2026-05-15',30000),
('Battle Cup','Coban','2026-06-01','2026-06-03',12000),
('Infinity Clash','Peten','2026-07-01','2026-07-05',40000),
('National Finals','Guatemala','2026-09-10','2026-09-15',50000);

INSERT INTO partidas(id_torneo,equipo_local,equipo_visitante,ganador,fecha)
VALUES
(1,1,2,1,'2026-01-10 10:00:00'),
(2,3,4,4,'2026-03-21 14:00:00'),
(3,5,6,6,'2026-05-11 18:00:00'),
(4,1,3,3,'2026-06-01 09:00:00'),
(5,2,5,5,'2026-07-02 15:30:00'),
(6,4,6,4,'2026-09-11 19:00:00');

INSERT INTO estadisticas_jugador
(id_partida,id_jugador,asesinatos,muertes,asistencias,oro)
VALUES
(1,1,8,2,7,18000),
(2,3,5,3,10,16000),
(3,4,10,1,5,22000),
(4,2,4,6,12,15000),
(5,6,9,2,8,21000),
(6,5,6,3,15,17500);