SELECT 
    b.titulo,
    b.genero,
    b.plataforma,
    p.nombre_usuario,
    p.fecha_prestamo,
    p.estado AS estado_prestamo
FROM biblioteca_gamer b
INNER JOIN prestamos_gamer p 
    ON b.juego_id = p.juego_id;

SELECT 
    b.titulo,
    p.nombre_usuario,
    p.fecha_prestamo
FROM biblioteca_gamer b
INNER JOIN prestamos_gamer p 
    ON b.juego_id = p.juego_id
WHERE p.estado = 'Activo';

SELECT 
    b.titulo,
    b.genero,
    b.plataforma
FROM biblioteca_gamer b
WHERE b.estado = 'Disponible';

SELECT 
    b.genero,
    COUNT(*) AS cantidad_juegos
FROM biblioteca_gamer b
GROUP BY b.genero
ORDER BY cantidad_juegos DESC;

SELECT 
    b.titulo,
    b.plataforma,
    p.nombre_usuario,
    p.fecha_prestamo,
    p.fecha_devolucion
FROM biblioteca_gamer b
INNER JOIN prestamos_gamer p 
    ON b.juego_id = p.juego_id
WHERE p.fecha_prestamo >= '2026-01-01'
AND p.estado = 'Devuelto'
ORDER BY p.fecha_prestamo ASC;