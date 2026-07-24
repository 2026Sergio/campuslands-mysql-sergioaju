# Módulo de Datos: Procedimientos Almacenados para Ranking Battle Royale

Solución en **MySQL** enfocada en el nivel avanzado inicial, implementando **procedimientos almacenados (Stored Procedures)** para encapsular la lógica de inserción y actualización de registros dentro de un sistema de ranking tipo Battle Royale.

## Estructura del Proyecto
- `ddl/schema.sql`: Creación de la base de datos con tablas relacionales `clanes` y `jugadores`, aplicando restricciones de integridad (`PRIMARY KEY`, `FOREIGN KEY`, `CHECK`).
- `dml/inserts.sql`: Inserción de datos iniciales (clanes y jugadores) y creación de procedimientos almacenados (`sp_registrar_jugador` y `sp_actualizar_puntos`).
- `dql/consultas.sql`: Consultas analíticas orientadas al reporte de rendimiento, cruces con `LEFT JOIN`, funciones de agregación y subconsultas.

## Instrucciones de Ejecución
Ejecuta los scripts en orden en tu gestor de MySQL:
1. `SOURCE ddl/schema.sql;`
2. `SOURCE dml/inserts.sql;`
3. `SOURCE dql/consultas.sql;`