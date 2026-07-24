INSERT INTO divisiones (nombre_division, puntos_minimos, puntos_maximos) VALUES
('Bronce', 0, 999),
('Plata', 1000, 1999),
('Oro', 2000, 2999),
('Platino', 3000, 3999),
('Diamante', 4000, 50000);

INSERT INTO jugadores (division_id, nickname, puntos_mrr, partidas_jugadas, victorias, bajas_totales) VALUES
(2, 'AlphaSniper', 1200, 15, 2, 45),
(2, 'GhostRider', 1050, 10, 1, 22),
(3, 'ViperKing', 2100, 40, 8, 110),
(3, 'ShadowNinja', 2500, 50, 12, 140),
(4, 'ApexPredator', 3200, 80, 25, 290);