-- intermedio/ejercicio-015 - maria-montepeque
USE campuslands_mysql;

-- 1. Carga masiva inicial (bulk INSERT en un solo statement por tabla)
INSERT INTO desarrolladoras_biblioteca_gamer_carga
    (nombre, pais, anio_fundacion)
VALUES
    ('Nova Interactive', 'Argentina', 2011),
    ('Byte Forge Studios', 'Mexico', 2015),
    ('Pixel Horizon', 'Espana', 2009),
    ('Quantum Vale', 'Chile', 2018),
    ('Ironclad Works', 'Colombia', 2013);

INSERT INTO juegos_biblioteca_gamer_carga
    (titulo, desarrolladora_id, genero, precio, horas_jugadas, estado, fecha_compra)
VALUES
    ('Ecos del Abismo', (SELECT id FROM desarrolladoras_biblioteca_gamer_carga WHERE nombre = 'Nova Interactive'), 'rpg', 39.99, 42, 'completado', '2025-03-10'),
    ('Frontera Salvaje', (SELECT id FROM desarrolladoras_biblioteca_gamer_carga WHERE nombre = 'Nova Interactive'), 'aventura', 24.99, 15, 'instalado', '2025-08-22'),
    ('Circuito Roto', (SELECT id FROM desarrolladoras_biblioteca_gamer_carga WHERE nombre = 'Byte Forge Studios'), 'accion', 49.99, 60, 'instalado', '2026-01-05'),
    ('Sombras de Acero', (SELECT id FROM desarrolladoras_biblioteca_gamer_carga WHERE nombre = 'Byte Forge Studios'), 'accion', 19.99, 8, 'pendiente', '2026-02-14'),
    ('Reino de Cristal', (SELECT id FROM desarrolladoras_biblioteca_gamer_carga WHERE nombre = 'Pixel Horizon'), 'estrategia', 34.99, 25, 'completado', '2024-11-30'),
    ('Vientos del Norte', (SELECT id FROM desarrolladoras_biblioteca_gamer_carga WHERE nombre = 'Pixel Horizon'), 'aventura', 14.99, 5, 'pendiente', '2025-06-01'),
    ('Salto Cuantico', (SELECT id FROM desarrolladoras_biblioteca_gamer_carga WHERE nombre = 'Quantum Vale'), 'accion', 44.99, 33, 'instalado', '2026-04-18'),
    ('Liga Estelar', (SELECT id FROM desarrolladoras_biblioteca_gamer_carga WHERE nombre = 'Quantum Vale'), 'deportes', 29.99, 20, 'completado', '2025-12-25'),
    ('Forja de Titanes', (SELECT id FROM desarrolladoras_biblioteca_gamer_carga WHERE nombre = 'Ironclad Works'), 'rpg', 54.99, 70, 'instalado', '2026-05-30'),
    ('Duelo de Campeones', (SELECT id FROM desarrolladoras_biblioteca_gamer_carga WHERE nombre = 'Ironclad Works'), 'deportes', 9.99, 2, 'pendiente', '2026-07-01');

-- 2. Carga derivada: se llena resumen_carga_biblioteca a partir de los datos
--    ya cargados arriba, con un INSERT ... SELECT (no se escriben los totales a mano)
INSERT INTO resumen_carga_biblioteca
    (desarrolladora, total_juegos, horas_totales, gasto_total)
SELECT
    d.nombre,
    COUNT(j.id),
    SUM(j.horas_jugadas),
    SUM(j.precio)
FROM desarrolladoras_biblioteca_gamer_carga AS d
JOIN juegos_biblioteca_gamer_carga AS j ON j.desarrolladora_id = d.id
GROUP BY d.nombre;

-- 3. Recarga idempotente: si el proceso de carga se ejecuta de nuevo con un
--    dato ya existente, no debe fallar ni duplicar la fila, sino actualizarla.
--    Aqui se "reintenta" cargar Nova Interactive con el mismo pais/anio.
INSERT INTO desarrolladoras_biblioteca_gamer_carga
    (nombre, pais, anio_fundacion)
VALUES
    ('Nova Interactive', 'Argentina', 2011)
ON DUPLICATE KEY UPDATE
    pais = VALUES(pais),
    anio_fundacion = VALUES(anio_fundacion);
