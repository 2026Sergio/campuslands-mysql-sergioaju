-- Consultas base. Completa o reemplaza segun el enunciado.
USE campuslands_mysql;

SELECT
    j.nombre AS jugador,
    e.nombre AS equipo
FROM jugadores j
INNER JOIN equipos e
ON j.equipo_id = e.id;


SELECT
    e.nombre,
    COUNT(*) AS total_jugadores
FROM equipos e
INNER JOIN jugadores j
ON e.id=j.equipo_id
GROUP BY e.id,e.nombre;

SELECT
    e.nombre,
    AVG(j.valor) AS promedio_valor
FROM equipos e
INNER JOIN jugadores j
ON e.id=j.equipo_id
GROUP BY e.id,e.nombre;

SELECT
    nombre,
    presupuesto
FROM equipos
ORDER BY presupuesto DESC;

SELECT *
FROM historial_fichajes;


-- Ejemplo de transacción
USE campuslands_mysql;

START TRANSACTION;

UPDATE equipos
SET presupuesto = presupuesto - 8000
WHERE id = 2;

UPDATE equipos
SET presupuesto = presupuesto + 8000
WHERE id = 1;

UPDATE jugadores
SET equipo_id = 2
WHERE id = 1;

INSERT INTO historial_fichajes
(jugador_id,equipo_origen,equipo_destino,costo)
VALUES
(1,1,2,8000);

COMMIT;


START TRANSACTION;

UPDATE equipos
SET presupuesto = presupuesto - 1000000
WHERE id = 2;

ROLLBACK;