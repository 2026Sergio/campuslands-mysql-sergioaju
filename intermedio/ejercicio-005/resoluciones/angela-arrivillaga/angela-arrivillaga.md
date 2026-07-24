# Resolución Ejercicio 005 - Intermedio

## Descripción
Solución al ejercicio 005 sobre la gestión de un taller mecánico de motos. Se aplican subconsultas en MySQL para comparar registros individuales contra promedios generales, filtrar valores máximos y realizar cálculos dinámicos.

## Estructura de archivos
* `ddl/schema.sql`: Creación de la base de datos y la tabla `reparaciones`.
* `dml/inserts.sql`: Carga de 9 servicios de reparación con distintos costos y estados.
* `dql/consultas.sql`: 5 consultas analíticas con subconsultas anidadas.

## Instrucciones de ejecución
1. Ejecutar `ddl/schema.sql` en phpMyAdmin.
2. Ejecutar `dml/inserts.sql` para cargar los registros.
3. Ejecutar `dql/consultas.sql` para validar las subconsultas.