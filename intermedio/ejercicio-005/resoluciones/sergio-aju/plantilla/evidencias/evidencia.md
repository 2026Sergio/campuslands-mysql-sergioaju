# Módulo de Datos: Taller Mecánico de Motos (Subconsultas)

Solución en **MySQL** orientada a la práctica y aplicación de **subconsultas** (escalares, con `IN`, correlacionadas y en la cláusula `SELECT`) dentro de un sistema de gestión para un taller mecánico de motocicletas.

## Estructura
- `ddl/schema.sql`: Creación de la base de datos con las tablas `mecanicos` y `reparaciones`, aplicando restricciones de integridad referencial y validación de costos.
- `dml/inserts.sql`: Inserción de 4 mecánicos y 10 registros de reparaciones para permitir consultas complejas basadas en datos reales.
- `dql/consultas.sql`: Consultas analíticas que utilizan subconsultas para filtrar por promedios, máximos, valores condicionales y comparaciones avanzadas.

## Ejecución
Ejecuta los scripts en orden en tu gestor de MySQL:
1. `SOURCE ddl/schema.sql;`
2. `SOURCE dml/inserts.sql;`
3. `SOURCE dql/consultas.sql;`