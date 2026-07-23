USE db_battle_royale;
TRUNCATE TABLE jugadores_br;

INSERT INTO jugadores_br (nombre_jugador, nivel, partidas_jugadas, victorias, precision_disparo, rango, activo) VALUES
('Carlos Pro', 45, 120, 25, 68.50, 'Diamante', TRUE),
('Ana Killer', 50, 200, 45, 75.20, 'Maestro', TRUE),
('Luis Gamer', 22, 80, 10, 45.00, 'Oro', TRUE),
('Sofia FN', 60, 300, 70, 82.40, 'Gran Maestro', TRUE),
('Pedro Noob', 10, 30, 2, 30.10, 'Bronce', FALSE),
('Lucia TTV', 35, 150, 18, 59.80, 'Platino', TRUE),
('Diego Play', 40, 180, 30, 64.10, 'Diamante', TRUE),
('Maria Sniper', 48, 210, 40, 88.90, 'Maestro', FALSE);