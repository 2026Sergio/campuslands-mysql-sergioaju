-- datos de prueba e invocacion de procedimientos almacenados
USE campuslands_mysql;

-- 1. insertamos 8 jugadores para tener datos suficientes
INSERT INTO jugadores_br (nickname, rango, bajas_totales, puntos, estado) VALUES
('ShadowHunter', 'Heroe', 120, 2500, 'activo'),
('ViperQueen', 'Heroe', 95, 2100, 'activo'),
('StormBreaker', 'Diamante', 80, 1800, 'activo'),
('PhoenixRider', 'Diamante', 75, 1650, 'activo'),
('GhostNinja', 'Platino', 45, 1200, 'activo'),
('IronShield', 'Platino', 40, 1100, 'activo'),
('DarkAlpha', 'Bronce', 15, 400, 'activo'),
('CheaterBot', 'Bronce', 300, 5000, 'suspendido');

-- 2. probamos el procedimiento almacenado registrar_partida
-- le sumamos 5 bajas y 150 puntos al jugador con ID 3 (StormBreaker)
CALL registrar_partida(3, 5, 150);

-- le sumamos 3 bajas y 100 puntos al jugador con ID 5 (GhostNinja)
CALL registrar_partida(5, 3, 100);