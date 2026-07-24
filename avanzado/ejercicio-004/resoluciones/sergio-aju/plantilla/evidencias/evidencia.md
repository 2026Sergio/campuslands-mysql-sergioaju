# Módulo de Datos: Triggers para Garaje de Motos

Solución en **MySQL** enfocada en el nivel avanzado inicial, implementando **triggers (disparadores)** orientados a la auditoría y control automático de inserciones dentro de un sistema de gestión para un taller o garaje de motocicletas.

## Estructura del Proyecto
- `ddl/schema.sql`: Creación de la base de datos con las tablas `motos` y `bitacora_motos`, aplicando restricciones estrictas (`ENUM`, `DECIMAL`, `CHECK`, `PRIMARY KEY`).
- `dml/inserts.sql`: Creación del trigger `trg_after_insert_moto` y la inserción de 10 registros detallados que alimentan de manera automática la bitácora de eventos.
- `dql/consultas.sql`: Consultas analíticas para revisar la bitácora de auditoría, filtros avanzados de agrupación con `HAVING` y reportes de rendimiento.

## Instrucciones de Ejecución
Ejecuta los scripts en orden en tu gestor de MySQL:
1. `SOURCE ddl/schema.sql;`
2. `SOURCE dml/inserts.sql;`
3. `SOURCE dql/consultas.sql;`