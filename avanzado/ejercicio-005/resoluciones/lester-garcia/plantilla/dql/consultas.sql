USE taller_mecanico_motos;

-- ===============================
-- CONSULTAS
-- ===============================

SELECT * FROM clientes;

SELECT marca,modelo,color
FROM motos;

SELECT nombre,especialidad
FROM mecanicos;

SELECT nombre,precio
FROM servicios
ORDER BY precio DESC;

SELECT estado,COUNT(*) AS total_ordenes
FROM ordenes_servicio
GROUP BY estado;

SELECT c.nombre,
       m.placa,
       o.estado
FROM clientes c
JOIN motos m
ON c.id_cliente=m.id_cliente
JOIN ordenes_servicio o
ON m.id_moto=o.id_moto;

SELECT AVG(total) AS promedio
FROM ordenes_servicio;

SELECT MAX(total) AS mayor_servicio
FROM ordenes_servicio;

-- ===============================
-- INDICES
-- ===============================

CREATE INDEX idx_cliente_nombre
ON clientes(nombre);

CREATE INDEX idx_moto_marca_modelo
ON motos(marca,modelo);

CREATE INDEX idx_mecanico_especialidad
ON mecanicos(especialidad);

CREATE INDEX idx_servicio_nombre
ON servicios(nombre);

CREATE INDEX idx_orden_estado_fecha
ON ordenes_servicio(estado,fecha_ingreso);

-- ===============================
-- CONSULTAS QUE APROVECHAN INDICES
-- ===============================

SELECT *
FROM clientes
WHERE nombre='Juan Pérez';

SELECT *
FROM motos
WHERE marca='Honda'
AND modelo='CB190R';

SELECT *
FROM mecanicos
WHERE especialidad='Motor';

SELECT *
FROM servicios
WHERE nombre='Servicio completo';

SELECT *
FROM ordenes_servicio
WHERE estado='Pendiente'
ORDER BY fecha_ingreso;
