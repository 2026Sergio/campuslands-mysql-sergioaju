USE ranking_battle_royale;

INSERT INTO jugadores(nombre,nickname,pais,edad,fecha_registro)
VALUES
('Juan Perez','Shadow','Guatemala',20,'2025-01-10'),
('Carlos Ruiz','SniperX','Mexico',22,'2025-01-15'),
('Luis Soto','Storm','Colombia',19,'2025-02-10'),
('Mario Diaz','Ghost','Peru',24,'2025-03-02'),
('Ana Lopez','Phoenix','Guatemala',21,'2025-04-01'),
('Kevin Morales','Titan','Costa Rica',23,'2025-04-15');

INSERT INTO temporadas(nombre,fecha_inicio,fecha_fin)
VALUES
('Temporada 1','2026-01-01','2026-03-31'),
('Temporada 2','2026-04-01','2026-06-30'),
('Temporada 3','2026-07-01','2026-09-30'),
('Temporada 4','2026-10-01','2026-12-31'),
('Temporada Elite','2027-01-01','2027-03-31'),
('Temporada Mundial','2027-04-01','2027-06-30');

INSERT INTO partidas(id_temporada,fecha,mapa,jugadores)
VALUES
(1,'2026-01-10 14:00:00','Erangel',100),
(1,'2026-02-15 15:00:00','Miramar',100),
(2,'2026-04-12 18:00:00','Sanhok',100),
(3,'2026-07-18 20:00:00','Vikendi',100),
(4,'2026-10-05 16:00:00','Deston',100),
(5,'2027-01-15 19:00:00','Erangel',100);

INSERT INTO ranking(id_partida,id_jugador,posicion,eliminaciones,supervivencia,puntos)
VALUES
(1,1,1,12,35,180),
(2,2,3,8,30,140),
(3,3,2,10,33,165),
(4,4,5,6,25,120),
(5,5,1,15,35,210),
(6,6,4,7,28,130);

INSERT INTO premios(id_jugador,descripcion,monto)
VALUES
(1,'Campeón Semanal',1000),
(2,'Segundo Lugar',700),
(3,'Jugador Destacado',500),
(4,'Top 5',300),
(5,'Campeón Elite',1500),
(6,'Participación',200);