
INSERT INTO colecciones (nombre_coleccion, temporada, estado, fecha_lanzamiento) VALUES
('Colección Dragón Antiguo', 'Temporada 1', 'Retirada', '2024-05-10'),
('Colección Cyberpunk 2026', 'Temporada 2', 'Activa', '2025-01-15'),
('Colección Operación Sombras', 'Temporada 3', 'Activa', '2025-09-01'),
('Colección Neón Aniversario', 'Evento', 'Evento', '2026-02-20');

INSERT INTO skins (coleccion_id, nombre_skin, arma_tipo, rareza, precio_mercado, stock_disponible, es_stattrak) VALUES
(1, 'Dragon Lore', 'Francotirador', 'Mítico', 28000.00, 2, TRUE),
(1, 'Fuego Ancestral', 'Rifle', 'Legendario', 4500.00, 10, TRUE),
(1, 'Garra de Dragón', 'Cuchillo', 'Mítico', 32000.00, 1, FALSE),
(1, 'Escama Dorada', 'Pistola', 'Raro', 350.00, 80, FALSE),
(1, 'Veneno Serpentino', 'Subfusil', 'Común', 90.00, 150, FALSE),
(2, 'Asiimov Neo', 'Rifle', 'Legendario', 3800.00, 25, TRUE),
(2, 'Cyber Matrix', 'Subfusil', 'Épico', 1200.00, 45, FALSE),
(2, 'Overdrive', 'Pistola', 'Raro', 450.00, 90, TRUE),
(2, 'Katana Láser', 'Cuchillo', 'Mítico', 18500.00, 3, TRUE),
(2, 'Giga Byte', 'Francotirador', 'Épico', 2100.00, 30, FALSE),
(2, 'Glitch', 'Pistola', 'Común', 120.00, 200, FALSE),
(3, 'Sombra Nocturna', 'Rifle', 'Legendario', 5100.00, 12, TRUE),
(3, 'Espectro', 'Francotirador', 'Épico', 1900.00, 35, FALSE),
(3, 'Hoja Silenciosa', 'Cuchillo', 'Mítico', 22000.00, 4, TRUE),
(3, 'Vipera', 'Pistola', 'Raro', 280.00, 110, FALSE),
(3, 'Niebla', 'Subfusil', 'Común', 75.00, 180, FALSE),
(4, 'Destello Neón', 'Rifle', 'Legendario', 6200.00, 15, TRUE),
(4, 'Ciber Rosa', 'Subfusil', 'Épico', 1600.00, 50, FALSE),
(4, 'Luz Pulsar', 'Pistola', 'Raro', 520.00, 75, TRUE),
(4, 'Mariposa Neón', 'Cuchillo', 'Mítico', 41000.00, 2, TRUE);