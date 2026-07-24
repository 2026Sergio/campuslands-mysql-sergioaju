# Módulo de Datos: Garaje de Motores (Motos)

Solución en **MySQL** enfocada en el uso de la cláusula `HAVING` para filtrar resultados agrupados en un sistema de gestión de un taller o garaje de motocicletas.

## Estructura
- `ddl/schema.sql`: Creación de la base de datos y la tabla `motos` con restricciones de tipo `ENUM`, `DECIMAL` y validación de precios mediante `CHECK`.
- `dml/inserts.sql`: Inserción de 10 registros detallados que permiten probar filtros avanzados de agregación con `HAVING`.
- `dql/consultas.sql`: Consultas analíticas orientadas al filtrado de grupos utilizando funciones como `COUNT`, `SUM`, `AVG` y `MAX` en combinación con `HAVING`.

## Ejecución
Ejecuta los scripts en orden en tu gestor de MySQL:
1. `SOURCE ddl/schema.sql;`
2. `SOURCE dml/inserts.sql;`
3. `SOURCE dql/consultas.sql;`