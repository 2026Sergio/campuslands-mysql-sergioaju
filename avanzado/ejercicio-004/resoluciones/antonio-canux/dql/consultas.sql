-- Consultas base y Triggers.
USE campuslands_mysql;

-- 1. Creacion del Trigger para auditar cambios de estado en las motos
DELIMITER //
CREATE TRIGGER trg_auditoria_estado_moto
AFTER UPDATE ON avanzado_ejercicio_004_motos
FOR EACH ROW
BEGIN
  IF OLD.estado != NEW.estado THEN
    INSERT INTO avanzado_ejercicio_004_auditoria (moto_id, estado_anterior, estado_nuevo) VALUES (NEW.id, OLD.estado, NEW.estado);
  END IF;
END //
DELIMITER ;

-- 2. Estado inicial de la tabla de auditoria (verificacion de tabla vacia)
SELECT * FROM avanzado_ejercicio_004_auditoria;

-- 3. Actualizacion de datos para disparar el Trigger automaticamente
UPDATE avanzado_ejercicio_004_motos 
    SET estado = 'vendida' 
    WHERE id = 1;
UPDATE avanzado_ejercicio_004_motos 
    SET estado = 'mantenimiento' 
    WHERE id = 5;
UPDATE avanzado_ejercicio_004_motos 
    SET estado = 'vendida' 
    WHERE id = 7;

-- 4. Verificacion del registro de auditoria despues de las actualizaciones
SELECT a.id, m.marca, m.modelo, a.estado_anterior, a.estado_nuevo, a.fecha_cambio 
    FROM avanzado_ejercicio_004_auditoria 
    a JOIN avanzado_ejercicio_004_motos 
    m ON a.moto_id = m.id;

-- 5. Consulta analitica: Cambios de estado agrupados por el nuevo estado asignado
SELECT estado_nuevo, COUNT(*) AS total_cambios 
    FROM avanzado_ejercicio_004_auditoria 
    GROUP BY estado_nuevo 
    ORDER BY total_cambios DESC;