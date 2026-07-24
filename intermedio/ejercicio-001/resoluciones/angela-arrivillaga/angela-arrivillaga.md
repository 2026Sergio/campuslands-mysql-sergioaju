# Resolución Ejercicio 001 - Intermedio

## Descripción
Solución al ejercicio 001 enfocado en un torneo de eSports MOBA. Se implementa una relación entre equipos y jugadores para consultar métricas e indicadores de rendimiento utilizando `INNER JOIN`.

## Estructura de archivos
* `ddl/schema.sql`: Creación de la base de datos y tablas (`equipos` y `jugadores`).
* `dml/inserts.sql`: Inserción de 4 equipos y 8 jugadores.
* `dql/consultas.sql`: 5 consultas analíticas con `INNER JOIN`, agrupaciones y ordenamiento.

## Orden de ejecución
1. Ejecutar `ddl/schema.sql` en phpMyAdmin.
2. Ejecutar `dml/inserts.sql` para cargar los registros.
3. Ejecutar `dql/consultas.sql` para revisar los reportes.