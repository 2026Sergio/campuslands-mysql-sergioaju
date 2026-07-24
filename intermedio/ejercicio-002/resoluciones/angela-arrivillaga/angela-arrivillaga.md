# Resolución Ejercicio 002 - Intermedio

## Descripción
Solución al ejercicio 002 enfocado en un ranking de Battle Royale. Se aplican consultas con `LEFT JOIN` para incluir en los reportes a todos los jugadores, permitiendo detectar usuarios inactivos y calcular estadísticas globales.

## Estructura de archivos
* `ddl/schema.sql`: Creación de las tablas `jugadores` y `partidas`.
* `dml/inserts.sql`: Carga de 5 jugadores y 8 partidas (con caso límite de jugador sin partidas).
* `dql/consultas.sql`: 5 consultas analíticas con `LEFT JOIN`, filtros de inactividad (`IS NULL`) y funciones de agregación.

## Orden de ejecución
1. Ejecutar `ddl/schema.sql` en phpMyAdmin.
2. Ejecutar `dml/inserts.sql` para cargar los datos.
3. Ejecutar `dql/consultas.sql` para verificar los reportes.