-- Consultas base y verificacion de Indices.
USE campuslands_mysql;

-- 1. Verificacion estructural de los indices creados en la tabla de reparaciones
SHOW INDEX 
    FROM avanzado_ejercicio_005_reparaciones;

-- 2. Demostracion de busqueda optimizada usando el indice simple (idx_reparaciones_placa)
SELECT r.placa, r.descripcion, c.nombre 
    FROM avanzado_ejercicio_005_reparaciones 
    r JOIN avanzado_ejercicio_005_clientes c ON r.cliente_id = c.id 
    WHERE r.placa = 'BMW-654';

-- 3. Uso de EXPLAIN para evidenciar que el motor MySQL utiliza 'idx_reparaciones_placa'
EXPLAIN SELECT r.placa, r.descripcion, c.nombre 
    FROM avanzado_ejercicio_005_reparaciones 
    r JOIN avanzado_ejercicio_005_clientes c ON r.cliente_id = c.id 
    WHERE r.placa = 'BMW-654';

-- 4. Busqueda y ordenamiento optimizado utilizando el indice compuesto (idx_reparaciones_estado_costo)
SELECT placa, descripcion, costo, estado 
    FROM avanzado_ejercicio_005_reparaciones 
    WHERE estado = 'completado' 
    ORDER BY costo DESC;

-- 5. Uso de EXPLAIN para evidenciar el uso del indice compuesto en filtrado y ordenamiento
EXPLAIN SELECT placa, descripcion, costo, estado 
    FROM avanzado_ejercicio_005_reparaciones 
    WHERE estado = 'completado' 
    ORDER BY costo DESC;