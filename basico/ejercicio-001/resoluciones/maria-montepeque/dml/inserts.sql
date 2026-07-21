-- basico/ejercicio-001 - maria-montepeque
USE campuslands_mysql;

INSERT INTO
    jugadores_torneo_moba (
        gamer_tag,
        equipo,
        rol,
        region,
        partidas_jugadas,
        victorias,
        mvp_count,
        kda,
        estado
    )
VALUES (
        'AndyBlaze',
        'Dragones Rojos',
        'top',
        'LATAM Norte',
        42,
        28,
        6,
        4.35,
        'activo'
    ),
    (
        'CarlosVoid',
        'Dragones Rojos',
        'jungla',
        'LATAM Norte',
        42,
        28,
        9,
        5.10,
        'activo'
    ),
    (
        'FerNova',
        'Dragones Rojos',
        'medio',
        'LATAM Norte',
        42,
        28,
        11,
        6.20,
        'activo'
    ),
    (
        'DiegoHex',
        'Dragones Rojos',
        'tirador',
        'LATAM Norte',
        42,
        28,
        8,
        5.85,
        'activo'
    ),
    (
        'PaoShield',
        'Dragones Rojos',
        'soporte',
        'LATAM Norte',
        42,
        28,
        4,
        3.10,
        'activo'
    ),
    (
        'MateoFrost',
        'Lobos del Sur',
        'top',
        'LATAM Sur',
        38,
        15,
        2,
        2.40,
        'activo'
    ),
    (
        'ValStorm',
        'Lobos del Sur',
        'jungla',
        'LATAM Sur',
        38,
        15,
        3,
        2.95,
        'suspendido'
    ),
    (
        'RickTide',
        'Lobos del Sur',
        'medio',
        'LATAM Sur',
        38,
        15,
        5,
        3.60,
        'activo'
    ),
    (
        'CamiSpark',
        'Fenix Digital',
        'tirador',
        'LATAM Centro',
        30,
        12,
        1,
        2.10,
        'retirado'
    ),
    (
        'JulianRune',
        'Fenix Digital',
        'soporte',
        'LATAM Centro',
        30,
        20,
        7,
        4.90,
        'activo'
    );