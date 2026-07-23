-- avanzado/ejercicio-006 - maria-montepeque
-- Igual que en el ejercicio de indices, se necesita volumen real de datos
-- para que EXPLAIN muestre diferencias significativas entre tipos de plan.
-- Se genera con un procedimiento temporal que se elimina al terminar.
USE campuslands_mysql;

DROP PROCEDURE IF EXISTS sp_generar_autos_explain;

DELIMITER $$

CREATE PROCEDURE sp_generar_autos_explain (IN p_cantidad INT)
BEGIN
    DECLARE v_contador INT DEFAULT 1;
    DECLARE v_indice_marca INT;

    WHILE v_contador <= p_cantidad DO
        SET v_indice_marca = 1 + FLOOR(RAND() * 9);

        INSERT INTO autos_hiperdeportivos_explain
            (placa, marca, modelo, pais_origen, precio, potencia_hp, anio)
        VALUES
            (
                CONCAT('HPC-', LPAD(v_contador, 6, '0')),
                ELT(v_indice_marca, 'Ferrari', 'Lamborghini', 'Porsche', 'McLaren', 'Bugatti', 'Koenigsegg', 'Pagani', 'Aston Martin', 'Rimac'),
                CONCAT('Modelo-', FLOOR(1 + RAND() * 40)),
                ELT(v_indice_marca, 'Italia', 'Italia', 'Alemania', 'Reino Unido', 'Francia', 'Suecia', 'Italia', 'Reino Unido', 'Croacia'),
                ROUND(200000 + RAND() * 3200000, 2),
                FLOOR(650 + RAND() * 1300),
                FLOOR(2015 + RAND() * 11)
            );
        SET v_contador = v_contador + 1;
    END WHILE;
END$$

DELIMITER ;

CALL sp_generar_autos_explain(2000);

DROP PROCEDURE sp_generar_autos_explain;
