USE garaje_motos;

-- ===============================
-- CONSULTAS
-- ===============================

-- 1
SELECT * FROM clientes;

-- 2
SELECT placa,marca,modelo
FROM motos;

-- 3
SELECT nombre,precio
FROM servicios
ORDER BY precio DESC;

-- 4
SELECT o.id_orden,
m.placa,
s.nombre,
o.estado
FROM ordenes_servicio o
JOIN motos m
ON o.id_moto=m.id_moto
JOIN servicios s
ON o.id_servicio=s.id_servicio;

-- 5
SELECT estado,
COUNT(*) cantidad
FROM ordenes_servicio
GROUP BY estado;

-- 6
SELECT AVG(precio) promedio_servicios
FROM servicios;

-- 7
SELECT c.nombre,
COUNT(m.id_moto) motos
FROM clientes c
JOIN motos m
ON c.id_cliente=m.id_cliente
GROUP BY c.id_cliente;

-- 8
SELECT placa
FROM motos
WHERE id_moto IN
(
SELECT id_moto
FROM ordenes_servicio
WHERE estado='Pendiente'
);

-- ===========================================
-- TRIGGERS
-- ===========================================

DELIMITER $$

CREATE TRIGGER trg_insert_orden
AFTER INSERT
ON ordenes_servicio
FOR EACH ROW
BEGIN

INSERT INTO auditoria_ordenes
(
accion,
id_orden,
descripcion,
fecha
)
VALUES
(
'INSERT',
NEW.id_orden,
'Nueva orden registrada',
NOW()
);

END $$

DELIMITER ;

-- ===========================================

DELIMITER $$

CREATE TRIGGER trg_update_estado
AFTER UPDATE
ON ordenes_servicio
FOR EACH ROW
BEGIN

IF OLD.estado <> NEW.estado THEN

INSERT INTO auditoria_ordenes
(
accion,
id_orden,
descripcion,
fecha
)
VALUES
(
'UPDATE',
NEW.id_orden,
CONCAT('Estado cambiado a ',NEW.estado),
NOW()
);

END IF;

END $$

DELIMITER ;

-- ===========================================

DELIMITER $$

CREATE TRIGGER trg_delete_orden
BEFORE DELETE
ON ordenes_servicio
FOR EACH ROW
BEGIN

INSERT INTO auditoria_ordenes
(
accion,
id_orden,
descripcion,
fecha
)
VALUES
(
'DELETE',
OLD.id_orden,
'Orden eliminada',
NOW()
);

END $$

DELIMITER ;

-- ===========================================

DELIMITER $$

CREATE TRIGGER trg_validar_precio
BEFORE INSERT
ON servicios
FOR EACH ROW
BEGIN

IF NEW.precio<=0 THEN
SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT='El precio debe ser mayor que cero';
END IF;

END $$

DELIMITER ;

-- ===========================================

DELIMITER $$

CREATE TRIGGER trg_fecha_cliente
BEFORE INSERT
ON clientes
FOR EACH ROW
BEGIN

IF NEW.fecha_registro IS NULL THEN
SET NEW.fecha_registro=CURDATE();
END IF;

END $$

DELIMITER ;

-- ===========================================
-- PRUEBAS
-- ===========================================

INSERT INTO ordenes_servicio(id_moto,id_servicio,fecha_ingreso,estado)
VALUES(1,2,CURDATE(),'Pendiente');

UPDATE ordenes_servicio
SET estado='Finalizado'
WHERE id_orden=1;

DELETE FROM ordenes_servicio
WHERE id_orden=2;

SELECT *
FROM auditoria_ordenes;