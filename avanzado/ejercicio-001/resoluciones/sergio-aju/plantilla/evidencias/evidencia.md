# Módulo de Datos: Transacciones para Torneo Esports MOBA

Solución en **MySQL** enfocada en el nivel avanzado inicial, implementando **transacciones ACID** (`START TRANSACTION`, `COMMIT`, `ROLLBACK`) para garantizar la integridad de datos críticos en operaciones financieras o de premios entre equipos dentro de un torneo MOBA.

## Estructura del Proyecto
- `ddl/schema.sql`: Creación del esquema relacional que incluye la tabla de `equipos` y el registro de auditoría `transferencias_historial`, aplicando restricciones estrictas (`CHECK`, `PRIMARY KEY`, `FOREIGN KEY`).
- `dml/inserts.sql`: Inserción de 8 registros base e implementación de un bloque transaccional para operaciones seguras de transferencia de fondos.
- `dql/consultas.sql`: Consultas analíticas orientadas al reporte financiero, cruces mediante `INNER JOIN`, funciones de agregación y subconsultas.

## Instrucciones de Ejecución
Ejecuta los scripts en orden en tu gestor de MySQL:
1. `SOURCE ddl/schema.sql;`
2. `SOURCE dml/inserts.sql;`
3. `SOURCE dql/consultas.sql;`