# Módulo de Datos: Funciones SQL para Inventario de Skins Shooter

Solución en **MySQL** enfocada en el nivel avanzado inicial, implementando **funciones personalizadas (Stored Functions)** para realizar cálculos reutilizables sobre los costos de elementos cosméticos (skins) en un videojuego tipo shooter.

## Estructura del Proyecto
- `ddl/schema.sql`: Creación de la base de datos y la tabla `skins` con restricciones estrictas (`ENUM`, `DECIMAL`, `CHECK`).
- `dml/inserts.sql`: Inserción de 10 registros detallados y creación de la función `fn_calcular_descuento` para la manipulación lógica de precios.
- `dql/consultas.sql`: Consultas analíticas que emplean la función personalizada, agrupaciones (`GROUP BY`), filtros avanzados (`HAVING`) y funciones de agregación.

## Instrucciones de Ejecución
Ejecuta los scripts en orden en tu gestor de MySQL:
1. `SOURCE ddl/schema.sql;`
2. `SOURCE dml/inserts.sql;`
3. `SOURCE dql/consultas.sql;`