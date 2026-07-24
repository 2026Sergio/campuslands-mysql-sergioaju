# Resolución Ejercicio 005 (Avanzado) - Índices Taller Mecánico de Motos

**Estudiante:** Allison Vargas  
**Nivel:** Avanzado Inicial  

## Descripción
Uso de índices simples y compuestos en MySQL (`idx_placa`, `idx_estado`, `idx_mecanico_fecha`) para optimizar el tiempo de respuesta de las consultas frecuentes sobre órdenes del taller mecánico.

## Estructura
- `ddl/schema.sql`: Definición de la tabla `ordenes_taller_avanzado` e incorporación de los índices.
- `dml/inserts.sql`: Inserción de 8 registros de órdenes de servicio.
- `dql/consultas.sql`: 5 consultas optimizadas por índices para búsquedas por placa, mecánico, rango de fechas y agrupaciones.
