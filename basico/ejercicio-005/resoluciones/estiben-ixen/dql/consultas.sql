-- Consultas base. Completa o reemplaza segun el enunciado.
USE campuslands_mysql;

SELECT * FROM basico_ejercicio_005;

SELECT categoria, COUNT(*) AS total_registros, AVG(puntaje) AS promedio
FROM basico_ejercicio_005
GROUP BY categoria
ORDER BY promedio DESC;
USE campuslands_mysql;

-- ============================================
-- Consulta 1
-- Mostrar todos los servicios registrados
-- ============================================

SELECT *
FROM taller_motos;


-- ============================================
-- Consulta 2
-- Mostrar únicamente las placas y propietarios
-- ============================================

SELECT
    placa AS Placa,
    propietario AS Propietario
FROM taller_motos;


-- ============================================
-- Consulta 3
-- Mostrar los servicios ordenados por costo
-- ============================================

SELECT
    propietario AS Propietario,
    servicio AS Servicio,
    costo AS Costo
FROM taller_motos
ORDER BY costo DESC;


-- ============================================
-- Consulta 4
-- Mostrar las motocicletas Honda
-- ============================================

SELECT
    placa,
    propietario,
    marca
FROM taller_motos
WHERE marca = 'Honda';


-- ============================================
-- Consulta 5
-- Mostrar los servicios pendientes
-- ============================================

SELECT
    propietario,
    servicio,
    estado
FROM taller_motos
WHERE estado = 'Pendiente';


-- ============================================
-- Consulta 6
-- Mostrar los servicios finalizados
-- ============================================

SELECT
    propietario,
    servicio,
    fecha_ingreso
FROM taller_motos
WHERE estado = 'Finalizado';


-- ============================================
-- Consulta 7
-- Mostrar los servicios cuyo costo sea mayor a Q250
-- ============================================

SELECT
    propietario,
    servicio,
    costo
FROM taller_motos
WHERE costo > 250;


-- ============================================
-- Consulta 8
-- Mostrar los registros ordenados por fecha
-- ============================================

SELECT
    propietario,
    servicio,
    fecha_ingreso
FROM taller_motos
ORDER BY fecha_ingreso;