use campuslands_mysql;

-- metemos 9 equipos de varias ligas para tener bastantes datos que probar
insert into basico_ejercicio_001 (nombre, categoria, puntaje, estado) values
('T1 Esports', 'LCK', 1250.50, 'activo'),
('G2 Esports', 'LEC', 980.00, 'activo'),
('Cloud9', 'LCS', 750.25, 'activo'),
('Fnatic', 'LEC', 820.00, 'activo'),
('KRU Esports', 'LATAM', 450.00, 'revision'),
('Team Liquid', 'LCS', 890.75, 'activo'),
('LOUD', 'CBLOL', 310.00, 'inactivo'),
('Isurus Gaming', 'LATAM', 620.50, 'activo'),
('Top Esports', 'LPL', 1100.00, 'activo');