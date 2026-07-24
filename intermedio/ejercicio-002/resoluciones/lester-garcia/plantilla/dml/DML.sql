USE ranking_battle_royale;

INSERT INTO jugadores(nombre,nickname,pais,nivel) VALUES
('Juan Pérez','ShadowX','Guatemala',72),
('Luis Gómez','Storm','México',68),
('Carlos Díaz','SniperPro','Colombia',80),
('María López','Phoenix','Costa Rica',74),
('Ana Morales','NightFox','El Salvador',66),
('Pedro Castillo','HunterGT','Honduras',71);

INSERT INTO temporadas(nombre,fecha_inicio,fecha_fin) VALUES
('Temporada 1','2026-01-01','2026-03-31'),
('Temporada 2','2026-04-01','2026-06-30'),
('Temporada 3','2026-07-01','2026-09-30'),
('Temporada 4','2026-10-01','2026-12-31'),
('Temporada Especial','2027-01-01','2027-02-28'),
('All Stars','2027-03-01','2027-04-30');

INSERT INTO rankings(id_jugador,id_temporada,posicion,puntos,victorias) VALUES
(1,1,2,1840,18),
(2,1,5,1620,11),
(3,2,1,2210,26),
(4,2,4,1780,14),
(1,3,3,1910,19),
(5,4,6,1540,9);