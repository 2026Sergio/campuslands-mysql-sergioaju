SELECT 
    servicio_id,
    nombre_cliente,
    telefono,
    marca_moto,
    modelo_moto,
    tipo_servicio,
    costo,
    estado,
    fecha_servicio
FROM taller_mecanico_motos
WHERE nombre_cliente = 'Carlos Mendoza';

SELECT 
    servicio_id,
    nombre_cliente,
    marca_moto,
    modelo_moto,
    tipo_servicio,
    costo,
    estado,
    fecha_servicio
FROM taller_mecanico_motos
WHERE marca_moto = 'Yamaha';

SELECT 
    servicio_id,
    nombre_cliente,
    marca_moto,
    modelo_moto,
    tipo_servicio,
    costo,
    estado,
    fecha_servicio
FROM taller_mecanico_motos
WHERE estado = 'Pendiente'
ORDER BY fecha_servicio ASC;

SELECT 
    servicio_id,
    nombre_cliente,
    marca_moto,
    modelo_moto,
    costo,
    estado,
    fecha_servicio
FROM taller_mecanico_motos
WHERE fecha_servicio BETWEEN '2026-01-01' AND '2026-01-31'
ORDER BY fecha_servicio ASC;

SELECT 
    servicio_id,
    nombre_cliente,
    marca_moto,
    modelo_moto,
    tipo_servicio,
    costo,
    estado
FROM taller_mecanico_motos
WHERE telefono = '3012345678';