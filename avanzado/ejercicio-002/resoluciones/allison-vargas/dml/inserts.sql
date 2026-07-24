-- DML: Registro de jugadores y ejecución del Stored Procedure
USE campuslands_mysql;

-- Inserción de 8 jugadores iniciales
INSERT INTO jugadores_br (nickname, estado) VALUES
('GhostSniper', 'activo'),
('ApexPredator', 'activo'),
('ViperStrike', 'activo'),
('PhoenixRise', 'activo'),
('ShadowNinja', 'activo'),
('StormBreaker', 'activo'),
('CyberHawk', 'baneado'),
('IronShield', 'activo');

-- Invocación del Stored Procedure para simular partidas y probar la lógica
CALL registrar_resultado_partida(1, 1, 12);  -- Victoria con 12 kills
CALL registrar_resultado_partida(2, 3, 8);   -- Top 3 con 8 kills
CALL registrar_resultado_partida(3, 12, 2);  -- Posición 12
CALL registrar_resultado_partida(4, 1, 15);  -- Victoria con 15 kills
CALL registrar_resultado_partida(1, 2, 9);   -- Top 2 con 9 kills
CALL registrar_resultado_partida(5, 5, 4);   -- Top 5
CALL registrar_resultado_partida(6, 1, 6);   -- Victoria con 6 kills
CALL registrar_resultado_partida(8, 20, 0);  -- Posición 20
CALL registrar_resultado_partida(4, 1, 10);  -- Segunda victoria de PhoenixRise
