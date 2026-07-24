-- avanzado/ejercicio-005 - maria-montepeque
-- Para que la comparacion de EXPLAIN con y sin indice tenga sentido, se
-- necesita un volumen de datos realista (unas pocas filas no muestran
-- diferencia: el optimizador de MySQL escanea la tabla completa igual de
-- rapido). Por eso, en vez de escribir cientos de INSERT a mano, se usa un
-- procedimiento temporal que genera 3000 ordenes de servicio con datos
-- variados, y se elimina apenas termina de usarse (es una herramienta de
-- carga, no parte del esquema final).
USE campuslands_mysql;

DROP PROCEDURE IF EXISTS sp_generar_servicios_taller_idx;

DELIMITER $$

CREATE PROCEDURE sp_generar_servicios_taller_idx (IN p_cantidad INT)
BEGIN
    DECLARE v_contador INT DEFAULT 1;

    WHILE v_contador <= p_cantidad DO
        INSERT INTO servicios_taller_motos_idx
            (numero_orden, placa_moto, cliente, mecanico, costo, estado, fecha_ingreso)
        VALUES
            (
                CONCAT('OT-', LPAD(v_contador, 6, '0')),
                CONCAT('MTA-', LPAD(FLOOR(1 + RAND() * 300), 3, '0')),
                ELT(1 + FLOOR(RAND() * 15),
                    'Carlos Reyes', 'Ana Torres', 'Luis Fernandez', 'Paola Gomez', 'Sofia Mendez',
                    'Mateo Cruz', 'Valeria Rios', 'Andres Soto', 'Camila Vega', 'Diego Salas',
                    'Elena Paredes', 'Hector Nunez', 'Ines Duarte', 'Jorge Pinto', 'Karla Mora'),
                ELT(1 + FLOOR(RAND() * 4),
                    'Julio Sanchez', 'Mario Ortiz', 'Diego Rios', 'Karina Lopez'),
                ROUND(20 + RAND() * 480, 2),
                ELT(1 + FLOOR(RAND() * 4), 'pendiente', 'en_proceso', 'finalizada', 'entregada'),
                DATE_SUB(CURDATE(), INTERVAL FLOOR(RAND() * 400) DAY)
            );
        SET v_contador = v_contador + 1;
    END WHILE;
END$$

DELIMITER ;

CALL sp_generar_servicios_taller_idx(3000);

DROP PROCEDURE sp_generar_servicios_taller_idx;
