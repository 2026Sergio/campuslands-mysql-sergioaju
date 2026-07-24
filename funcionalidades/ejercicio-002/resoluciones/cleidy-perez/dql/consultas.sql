-- Consultas base. Completa o reemplaza segun el enunciado.
USE campuslands_mysql;

-- ------------------------------------------------------------------------------
-- Prueba 1: Extracción de atributos desde datos semiestructurados (JSON)
-- Explicación: Usamos el operador `->>` para extraer campos JSON como texto plano.
-- ------------------------------------------------------------------------------
SELECT 
    v.modelo,
    t.velocidad_max_kmh,
    t.metricas_sensores->>'$.temperatura_motor_c' AS temp_motor_celsius,
    t.metricas_sensores->>'$.nos_activado' AS uso_nitro
FROM telemetria_carrera t
JOIN vehiculos v ON t.id_vehiculo = v.id_vehiculo
WHERE t.metricas_sensores->>'$.nos_activado' = 'true';

-- ------------------------------------------------------------------------------
-- Prueba 2: Cálculo de relación Peso/Potencia con tipo DECIMAL e INT
-- Explicación: Demuestra precisión decimal exacta sin pérdida por redondeo flotante.
-- ------------------------------------------------------------------------------
SELECT 
    p.alias,
    v.modelo,
    v.potencia_hp,
    v.peso_kg,
    ROUND(v.peso_kg / v.potencia_hp, 2) AS relacion_peso_potencia_kg_hp
FROM vehiculos v
JOIN pilotos p ON v.id_piloto = p.id_piloto
ORDER BY relacion_peso_potencia_kg_hp ASC;

-- ------------------------------------------------------------------------------
-- Prueba 3: Filtrado exacto por tipo CHAR (Longitud fija)
-- Explicación: Demuestra la eficiencia de búsqueda sobre un índice de longitud exacta.
-- ------------------------------------------------------------------------------
SELECT 
    v.vin_carreras,
    v.modelo,
    p.alias
FROM vehiculos v
JOIN pilotos p ON v.id_piloto = p.id_piloto
WHERE v.vin_carreras = 'RAC-1002';

-- ------------------------------------------------------------------------------
-- Prueba 4: Manejo de rangos de fechas (DATETIME) y tiempos (TIME)
-- ------------------------------------------------------------------------------
SELECT 
    v.modelo,
    t.fecha_evento,
    t.tiempo_vuelta,
    t.velocidad_max_kmh
FROM telemetria_carrera t
JOIN vehiculos v ON t.id_vehiculo = v.id_vehiculo
WHERE t.fecha_evento >= '2026-03-10 00:00:00' 
  AND t.tiempo_vuelta < '00:01:25'
ORDER BY t.tiempo_vuelta ASC;

-- ------------------------------------------------------------------------------
-- Prueba 5: Inspección de estructura
-- ------------------------------------------------------------------------------
DESCRIBE telemetria_carrera;
