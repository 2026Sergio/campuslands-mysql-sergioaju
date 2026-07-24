# Autor

Sergio-Ajú

# Módulo de Datos: Torneo Esports MOBA

Solución técnica desarrollada en **MySQL** para la gestión y análisis de datos de un torneo de videojuegos competitivos (MOBA), aplicando buenas prácticas de diseño relacional y consultas analíticas con `INNER JOIN`.

## Estructura del Proyecto
- `ddl/schema.sql`: Creación de la base de datos y definición de tablas (`equipos`, `jugadores`) con restricciones de integridad (`PRIMARY KEY`, `FOREIGN KEY`, `CHECK`, `ENUM`).
- `dml/inserts.sql`: Inserción de datos relacionales realistas (5 equipos y 10 jugadores).
- `dql/consultas.sql`: Consultas orientadas a reportes de negocio, filtros avanzados, funciones de agregación y ordenamientos cruzados.

## Instrucciones de Ejecución
Ejecuta los scripts en orden en tu gestor de base de datos MySQL favorito (Workbench, DBeaver, consola, etc.):

1. Ejecutar el script DDL:
   ```sql
   SOURCE ddl/schema.sql;