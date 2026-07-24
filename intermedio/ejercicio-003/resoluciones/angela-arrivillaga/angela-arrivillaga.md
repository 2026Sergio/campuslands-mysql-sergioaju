# Resolución Ejercicio 003 - Intermedio

## Descripción
Solución al ejercicio 003 enfocado en el inventario de skins para un juego de disparos (shooter). Se implementan consultas analíticas utilizando la cláusula `GROUP BY` junto a funciones de agregación (`COUNT`, `SUM`, `AVG`, `MAX`, `MIN`) y filtros acumulados (`HAVING`).

## Estructura de archivos
* `ddl/schema.sql`: Creación de la base de datos y la tabla `skins`.
* `dml/inserts.sql`: Carga de 9 registros representativos con variadas rarezas y tipos de armas.
* `dql/consultas.sql`: 5 consultas analíticas para responder preguntas de negocio agrupadas.

## Orden de ejecución
1. Ejecutar `ddl/schema.sql` en phpMyAdmin.
2. Ejecutar `dml/inserts.sql` para cargar los datos.
3. Ejecutar `dql/consultas.sql` para obtener los reportes analíticos.