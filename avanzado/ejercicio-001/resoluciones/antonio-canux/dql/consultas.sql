-- Consultas base y operaciones de Transaccion.
USE campuslands_mysql;

SELECT e.nombre AS equipo, e.presupuesto, j.nickname 
    FROM avanzado_ejercicio_001_equipos 
    e LEFT JOIN avanzado_ejercicio_001_jugadores 
    j ON e.id = j.equipo_id 
    WHERE e.id IN (3, 6);

START TRANSACTION;
UPDATE avanzado_ejercicio_001_equipos 
    SET presupuesto = presupuesto - 1000000 
    WHERE id = 6;
UPDATE avanzado_ejercicio_001_equipos 
    SET presupuesto = presupuesto + 1000000 
    WHERE id = 3;
UPDATE avanzado_ejercicio_001_jugadores 
    SET equipo_id = 6 
    WHERE id = 4;
COMMIT;

SELECT e.nombre AS equipo, e.presupuesto, j.nickname 
    FROM avanzado_ejercicio_001_equipos 
    e LEFT JOIN avanzado_ejercicio_001_jugadores 
    j ON e.id = j.equipo_id 
    WHERE e.id IN (3, 6);

START TRANSACTION;
UPDATE avanzado_ejercicio_001_equipos 
    SET presupuesto = presupuesto - 10000000 
    WHERE id = 4;
UPDATE avanzado_ejercicio_001_equipos 
    SET presupuesto = presupuesto + 10000000 
    WHERE id = 1;
UPDATE avanzado_ejercicio_001_jugadores 
    SET equipo_id = 4 
    WHERE id = 1;
ROLLBACK;

SELECT region, SUM(presupuesto) AS presupuesto_total, COUNT(id) AS cantidad_equipos 
    FROM avanzado_ejercicio_001_equipos 
    GROUP BY region 
    ORDER BY presupuesto_total DESC;