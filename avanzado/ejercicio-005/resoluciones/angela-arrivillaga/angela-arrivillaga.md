# Resolución Ejercicio 005 - Avanzado

## Descripción
Solución al ejercicio 005 sobre un taller mecánico de motos. Se implementan índices (`INDEX`) en MySQL sobre campos estratégicos (`placa_moto`, `estado` y `mecanico`) para optimizar el rendimiento de las consultas y búsquedas frecuentes en el historial de reparaciones.

## Estructura de archivos
* `ddl/schema.sql`: Creación de la base de datos, la tabla `servicios_taller` e índices de optimización.
* `dml/inserts.sql`: Carga de 8 registros de servicios mecánicos.
* `dql/consultas.sql`: Consultas que aprovechan los índices para filtrar por placa, estado y mecánico.

## Pasos para ejecutar
1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.