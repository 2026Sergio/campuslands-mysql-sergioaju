# Resolución Ejercicio 004 - Avanzado

## Descripción
Solución al ejercicio 004 sobre un garaje de motos. Se crea una estructura relacional con una tabla principal `motos` y una tabla de seguimiento `historial_motos` para auditar el estado y los movimientos de los vehículos.

## Estructura de archivos
* `ddl/schema.sql`: Creación de la base de datos y las tablas `motos` y `historial_motos`.
* `dml/inserts.sql`: Carga de 8 motos y sus respectivos registros de auditoría.
* `dql/consultas.sql`: Consultas para revisar reportes de inventario, auditoría y estadísticas de vehículos.

## Pasos para ejecutar
1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.