-- avanzado/ejercicio-015 - maria-montepeque
-- Se necesita volumen real de datos para que las diferencias de rendimiento
-- entre la consulta "mala" y la optimizada sean medibles de verdad (con
-- pocas filas, MySQL resuelve cualquier consulta en microsegundos y no se
-- ve ninguna diferencia). Se generan con un procedimiento temporal que se
-- elimina al terminar.
USE campuslands_mysql;

-- CTE recursivo para generar 40 desarrolladoras sin escribirlas a mano
INSERT INTO desarrolladoras_biblioteca_opt (nombre, pais)
WITH RECURSIVE secuencia AS (
    SELECT 1 AS n
    UNION ALL
    SELECT n + 1 FROM secuencia WHERE n < 40
)
SELECT
    CONCAT('Estudio ', n),
    ELT(1 + FLOOR(RAND() * 5), 'Argentina', 'Mexico', 'Chile', 'Colombia', 'Espana')
FROM secuencia;

DROP PROCEDURE IF EXISTS sp_generar_juegos_opt;

DELIMITER $$

CREATE PROCEDURE sp_generar_juegos_opt (IN p_cantidad INT)
BEGIN
    DECLARE v_contador INT DEFAULT 1;

    WHILE v_contador <= p_cantidad DO
        INSERT INTO juegos_biblioteca_opt
            (titulo, desarrolladora_id, genero, precio, horas_jugadas, fecha_lanzamiento)
        VALUES
            (
                CONCAT('Juego-', LPAD(v_contador, 5, '0')),
                -- Solo se asignan juegos a las desarrolladoras 1-35: las
                -- ultimas 5 (36-40) se quedan a proposito SIN ningun juego,
                -- para que la consulta de "desarrolladoras sin juegos" tenga
                -- resultados reales que mostrar.
                FLOOR(1 + RAND() * 35),
                ELT(1 + FLOOR(RAND() * 5), 'accion', 'rpg', 'estrategia', 'deportes', 'aventura'),
                ROUND(5 + RAND() * 65, 2),
                FLOOR(RAND() * 200),
                DATE_SUB(CURDATE(), INTERVAL FLOOR(RAND() * 2000) DAY)
            );
        SET v_contador = v_contador + 1;
    END WHILE;
END$$

DELIMITER ;

CALL sp_generar_juegos_opt(4000);

DROP PROCEDURE sp_generar_juegos_opt;
