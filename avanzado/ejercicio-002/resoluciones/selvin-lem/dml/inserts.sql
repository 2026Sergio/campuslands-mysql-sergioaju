USE campuslands_mysql;

INSERT INTO jugadores_battle_royale (nombre_jugador, plataforma, partidas_jugadas, victorias, puntos_ranking, estado) VALUES
('Zephyra', 'pc',      0, 0, 0, 'activo'),
('Kron',    'consola', 0, 0, 0, 'activo'),
('Voss',    'movil',   0, 0, 0, 'activo'),
('Ilyra',   'pc',      0, 0, 0, 'activo'),
('Draken',  'consola', 0, 0, 0, 'activo'),
('Nimue',   'pc',      0, 0, 0, 'inactivo'),
('Baraz',   'movil',   0, 0, 0, 'activo'),
('Skye',    'pc',      0, 0, 0, 'activo');

-- Simulacion de partidas usando el procedimiento (evita UPDATE manual)
CALL registrar_resultado_partida(1, 1, 8);   
CALL registrar_resultado_partida(2, 3, 5);   
CALL registrar_resultado_partida(3, 20, 0);  
CALL registrar_resultado_partida(4, 5, 6);   
CALL registrar_resultado_partida(5, 1, 12);  
CALL registrar_resultado_partida(1, 4, 3);   

-- Consulta de estadisticas via procedimiento con OUT
CALL obtener_estadisticas_jugador(1, @nombre, @winrate, @puntos);
SELECT @nombre AS nombre_jugador, @winrate AS win_rate, @puntos AS puntos_totales;