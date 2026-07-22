-- basico/ejercicio-009 - maria-montepeque
USE campuslands_mysql;

-- Peleadores reales del torneo
INSERT INTO peleadores_kickboxing
    (nombre, categoria_peso, gimnasio, peleas_ganadas, peleas_perdidas, estado, fecha_inscripcion)
VALUES
    ('KaidoFist', 'pluma', 'Gimnasio Fenix', 15, 3, 'activo', '2025-11-02'),
    ('ZaraKick', 'medio', 'Gimnasio Fenix', 12, 5, 'activo', '2025-11-02'),
    ('RexStrike', 'pesado', 'Gimnasio Lobos', 20, 2, 'activo', '2025-11-05'),
    ('LunaBlaze', 'pluma', 'Gimnasio Lobos', 8, 6, 'activo', '2025-12-01'),
    ('MikaThunder', 'medio', 'Gimnasio Tormenta', 10, 4, 'activo', '2025-12-03'),
    ('TahoShadow', 'ligero', 'Gimnasio Tormenta', 5, 9, 'retirado', '2025-10-20'),
    ('SkyeVenom', 'pesado', 'Gimnasio Fenix', 18, 1, 'activo', '2026-01-15'),
    ('ByteCrusher', 'ligero', 'Gimnasio Lobos', 0, 1, 'descalificado', '2026-02-10'),
    ('PixelRage', 'medio', 'Gimnasio Tormenta', 14, 3, 'activo', '2026-02-18'),
    ('KairoPhantom', 'pluma', 'Gimnasio Fenix', 9, 5, 'activo', '2026-03-01');

-- Registros de prueba insertados por error durante la carga de datos
INSERT INTO peleadores_kickboxing
    (nombre, categoria_peso, gimnasio, peleas_ganadas, peleas_perdidas, estado, fecha_inscripcion)
VALUES
    ('TestFighter', 'pluma', 'Gimnasio QA', 0, 0, 'activo', '2026-07-01'),
    ('DemoFighter', 'ligero', 'Gimnasio QA', 0, 0, 'activo', '2026-07-01');

-- DELETE controlado: siempre se verifica con SELECT antes de borrar y se usa un
-- WHERE especifico (nunca un DELETE sin condiciones sobre la tabla completa).

-- 1. Verificar los registros de prueba antes de eliminarlos
SELECT id, nombre, gimnasio FROM peleadores_kickboxing WHERE gimnasio = 'Gimnasio QA';

-- 2. Eliminar los registros de prueba identificados arriba
DELETE FROM peleadores_kickboxing WHERE gimnasio = 'Gimnasio QA';

-- 3. Verificar al peleador descalificado sin peleas ganadas antes de eliminarlo
SELECT id, nombre, estado, peleas_ganadas FROM peleadores_kickboxing WHERE nombre = 'ByteCrusher';

-- 4. Eliminar, por unica vez y por nombre exacto (clave de negocio unica),
--    al peleador descalificado que solicito la baja de su registro
DELETE FROM peleadores_kickboxing WHERE nombre = 'ByteCrusher' AND estado = 'descalificado';
