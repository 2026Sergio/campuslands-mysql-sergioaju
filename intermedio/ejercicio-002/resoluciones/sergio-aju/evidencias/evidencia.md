# Módulo de Datos: Ranking Battle Royale

Solución en **MySQL** enfocada en el uso de operaciones `LEFT JOIN` para la gestión de un ranking de un videojuego tipo Battle Royale, permitiendo analizar relaciones donde existan registros opcionales o sin asociaciones (clanes sin jugadores o jugadores libres).

## Estructura
- `ddl/schema.sql`: Creación de la base de datos con tablas `clanes` y `jugadores`, implementando clave foránea con `ON DELETE SET NULL`.
- `dml/inserts.sql`: Datos de prueba que incluyen casos límite (clanes vacíos y jugadores sin clan) para validar el comportamiento del `LEFT JOIN`.
- `dql/consultas.sql`: Consultas analíticas y de reporte utilizando `LEFT JOIN`, funciones de agregación y filtros.

## Ejecución
Ejecuta los scripts en orden en tu gestor de MySQL:
1. `SOURCE ddl/schema.sql;`
2. `SOURCE dml/inserts.sql;`
3. `SOURCE dql/consultas.sql;`