# Ejercicio: Ranking Battle Royale

## Nombre del alumno:Lester Garcia
_____________________________________

---

# Descripción general del ejercicio

Se desarrolló una base de datos en MySQL para administrar un sistema de ranking de jugadores de Battle Royale. La solución organiza la información de jugadores, temporadas, partidas, resultados y premios, permitiendo realizar consultas y automatizar operaciones mediante procedimientos almacenados.

---

# Explicación general de la solución

La solución está dividida en tres componentes principales:

- **ddl.sql:** crea la base de datos, las tablas y las relaciones mediante claves primarias y foráneas.
- **dml.sql:** inserta información de ejemplo con datos coherentes y realistas.
- **dql.sql:** contiene consultas para analizar la información y varios procedimientos almacenados que automatizan tareas frecuentes.

Los procedimientos almacenados implementados permiten:

- Listar todos los jugadores.
- Buscar un jugador por su nickname.
- Consultar los puntos de un jugador.
- Registrar un nuevo premio.
- Mostrar el Top 3 del ranking.

---

# Evidencia general

Orden de ejecución:

1. Ejecutar `ddl.sql`.
2. Ejecutar `dml.sql`.
3. Ejecutar `dql.sql`.

Resultados esperados:

- Base de datos creada correctamente.
- Tablas relacionadas mediante claves foráneas.
- Datos insertados sin errores.
- Consultas mostrando información consistente.
- Procedimientos almacenados creados y ejecutados correctamente mediante `CALL`.

