# Módulo de Datos: Inventario de Skins Shooter

Solución en **MySQL** enfocada en la práctica de la cláusula `GROUP BY` y funciones de agregación (`COUNT`, `AVG`, `SUM`, `MAX`) aplicada a la gestión y análisis de un inventario de elementos cosméticos (skins) de un videojuego tipo shooter.

## Estructura
- `ddl/schema.sql`: Creación de la base de datos y la tabla `skins` con restricciones de tipo `ENUM`, `DECIMAL` y validación de precios mediante `CHECK`.
- `dml/inserts.sql`: Inserción de 10 registros variados que permiten probar diferentes agrupaciones por rareza, tipo de arma y estado.
- `dql/consultas.sql`: Consultas analíticas utilizando `GROUP BY` y `HAVING` orientadas a reportes de inventario y métricas de costos.

## Ejecución
Ejecuta los scripts en orden en tu gestor de MySQL:
1. `SOURCE ddl/schema.sql;`
2. `SOURCE dml/inserts.sql;`
3. `SOURCE dql/consultas.sql;`