
USE torneo_moba;
INSERT INTO equipos (nombre,pais,entrenador) VALUES
('Dragons Elite','Guatemala','Carlos Méndez'),
('Phoenix Gaming','México','Luis Herrera'),
('Titan Force','Colombia','Jorge Ruiz'),
('Shadow Legends','Costa Rica','Mario Castro'),
('Nova Warriors','El Salvador','Kevin Ramos'),
('Storm Masters','Honduras','Daniel Flores');

INSERT INTO jugadores(nombre,nickname,rol,edad,id_equipo) VALUES
('Juan Pérez','Drako','Top',21,1),
('Luis Gómez','FireFox','Mid',22,1),
('Mario López','Hunter','Jungla',20,2),
('Kevin Díaz','Sniper','ADC',19,2),
('José Ramírez','Tanker','Support',24,3),
('Pedro Castillo','Ghost','Mid',23,3),
('Andrés Morales','Flash','ADC',20,4),
('David Torres','Night','Top',22,5),
('Bryan Cruz','Wolf','Support',21,6),
('Samuel Rivera','Blade','Jungla',23,6);

INSERT INTO torneos(nombre,ciudad,fecha,premio) VALUES
('MOBA Champions','Guatemala','2026-04-15',25000),
('Legends Cup','Ciudad de México','2026-05-20',30000),
('Central America League','San José','2026-06-10',20000),
('Masters Invitational','Bogotá','2026-07-05',40000),
('Summer Clash','San Salvador','2026-08-18',18000),
('Elite Finals','Tegucigalpa','2026-09-22',50000);

INSERT INTO participaciones(id_equipo,id_torneo,posicion_final,victorias,derrotas) VALUES
(1,1,1,8,1),
(2,1,2,7,2),
(3,2,1,9,1),
(4,2,3,5,4),
(5,3,2,6,3),
(6,3,1,8,2);