START TRANSACTION;

UPDATE equipos_esports_moba
SET puntos = puntos + 50
WHERE equipo_id = 1;

INSERT INTO movimientos_torneo_moba (
    equipo_id,
    tipo_movimiento,
    puntos_movimiento,
    fecha_movimiento
) VALUES (
    1,
    'Victoria',
    50,
    '2026-01-20'
);

COMMIT;


START TRANSACTION;

UPDATE equipos_esports_moba
SET puntos = puntos - 30
WHERE equipo_id = 3;

INSERT INTO movimientos_torneo_moba (
    equipo_id,
    tipo_movimiento,
    puntos_movimiento,
    fecha_movimiento
) VALUES (
    3,
    'Derrota',
    -30,
    '2026-01-21'
);

ROLLBACK;


START TRANSACTION;

UPDATE equipos_esports_moba
SET puntos = puntos + 60
WHERE equipo_id = 4;

INSERT INTO movimientos_torneo_moba (
    equipo_id,
    tipo_movimiento,
    puntos_movimiento,
    fecha_movimiento
) VALUES (
    4,
    'Victoria',
    60,
    '2026-01-22'
);

COMMIT;


SELECT 
    e.nombre_equipo,
    e.puntos,
    e.estado,
    m.tipo_movimiento,
    m.puntos_movimiento,
    m.fecha_movimiento
FROM equipos_esports_moba e
INNER JOIN movimientos_torneo_moba m
    ON e.equipo_id = m.equipo_id
ORDER BY m.fecha_movimiento ASC;