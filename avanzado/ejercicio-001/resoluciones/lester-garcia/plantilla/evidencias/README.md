# Ejercicio: Torneo Esports MOBA

## Nombre del alumno: Lester Garcia.
______________________________________

---

# Descripción general del ejercicio

Se desarrolló una base de datos en MySQL inspirada en un torneo de Esports MOBA. El proyecto tiene como objetivo practicar la creación de bases de datos relacionales, inserción de información consistente, consultas SQL y el manejo de transacciones para garantizar la integridad de los datos.

La solución se encuentra organizada en tres archivos principales:

- ddl.sql
- dml.sql
- dql.sql

---

# Explicación general de la solución

La base de datos está conformada por cinco tablas relacionadas:

- Equipos
- Jugadores
- Torneos
- Partidas
- Estadísticas de Jugadores

Las relaciones permiten almacenar información de un torneo profesional de forma organizada.

Posteriormente se agregan registros de ejemplo para todas las tablas.

Finalmente se realizan consultas que responden diferentes necesidades de información utilizando:

- JOIN
- GROUP BY
- ORDER BY
- AVG
- COUNT
- Subconsultas

Además, se implementan transacciones utilizando:

- START TRANSACTION
- COMMIT
- ROLLBACK
- SAVEPOINT

con el propósito de demostrar el control de operaciones críticas sobre la base de datos.

---

# Evidencia general

La ejecución del proyecto debe realizarse en el siguiente orden:

1. Ejecutar ddl.sql
2. Ejecutar dml.sql
3. Ejecutar dql.sql

Resultados esperados:

- Base de datos creada correctamente.
- Tablas relacionadas mediante claves foráneas.
- Datos insertados sin errores.
- Consultas devolviendo información consistente.
- Transacciones ejecutándose correctamente con COMMIT, ROLLBACK y SAVEPOINT.

La evidencia consiste en capturas de pantalla donde se observe:

- Creación de la base de datos.
- Inserción de registros.
- Resultado de las consultas.
- Ejecución de las transacciones.
- Estado final de las tablas después de COMMIT y ROLLBACK.