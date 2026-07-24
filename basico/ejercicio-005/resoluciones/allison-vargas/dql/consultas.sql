-- DQL: 5 Consultas con SELECT enfocadas en lectura clara y filtros específicos
USE campuslands_mysql;

-- 1. Listado general de repuestos disponibles con valoración de stock en inventario
SELECT 
    repuesto_id,
    nombre_repuesto,
    categoria,
    precio_unitario,
    stock_actual,
    (precio_unitario * stock_actual) AS valor_total_stock
FROM repuestos_taller_basico
WHERE estado = 'disponible'
ORDER BY valor_total_stock DESC;

-- 2. Repuestos de la categoría 'frenos' y 'lubricantes' ordenados por precio
SELECT 
    nombre_repuesto,
    categoria,
    precio_unitario,
    proveedor
FROM repuestos_taller_basico
WHERE categoria IN ('frenos', 'lubricantes')
ORDER BY precio_unitario ASC;

-- 3. Repuestos con stock crítico (menos de 10 unidades) o agotados
SELECT 
    nombre_repuesto,
    categoria,
    stock_actual,
    estado,
    proveedor
FROM repuestos_taller_basico
WHERE stock_actual < 10 OR estado = 'agotado'
ORDER BY stock_actual ASC;

-- 4. Repuestos suministrados por un proveedor específico ('Brembo Corp')
SELECT 
    repuesto_id,
    nombre_repuesto,
    precio_unitario,
    stock_actual,
    estado
FROM repuestos_taller_basico
WHERE proveedor = 'Brembo Corp';

-- 5. Top 3 de repuestos más costosos del taller
SELECT 
    nombre_repuesto,
    categoria,
    precio_unitario,
    proveedor
FROM repuestos_taller_basico
ORDER BY precio_unitario DESC
LIMIT 3;
