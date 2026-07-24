# Resolución Ejercicio 002 - Avanzado

## Descripción
Solución al ejercicio 002 sobre un sistema de ranking Battle Royale. Se implementan procedimientos almacenados (`STORED PROCEDURES`) en MySQL para automatizar la actualización de puntos de los jugadores y la generación de reportes de posiciones por rango.

## Estructura de archivos
* `ddl/schema.sql`: Creación de la tabla `jugadores_br` y los procedimientos almacenados `registrar_partida` y `obtener_top_jugadores`.
* `dml/inserts.sql`: Carga inicial de 8 jugadores y pruebas de ejecución de procedimientos almacenados usando `CALL`.
* `dql/consultas.sql`: Consultas y llamadas a procedimientos almacenados para verificar clasificaciones e indicadores.

## Pasos para ejecutar
1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.