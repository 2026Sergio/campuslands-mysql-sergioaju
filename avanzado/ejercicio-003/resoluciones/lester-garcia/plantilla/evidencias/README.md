# Ejercicio: Inventario de Skins Shooter

## Nombre del alumno:Lester Garcia
_____________________________________

---

# Descripción general del ejercicio

Se desarrolló una base de datos en MySQL para administrar el inventario de skins de un videojuego tipo Shooter. La solución permite registrar jugadores, categorías de skins, inventario y compras, además de implementar funciones SQL para reutilizar lógica de consulta.

---

# Explicación general de la solución

El proyecto está organizado en tres archivos principales:

- **ddl.sql:** creación de la base de datos, tablas y relaciones.
- **dml.sql:** inserción de datos de prueba consistentes.
- **dql.sql:** consultas de análisis y creación de funciones SQL.

Las funciones implementadas permiten:

- Obtener la cantidad de skins que posee un jugador.
- Consultar el precio de una skin.
- Obtener la rareza de una skin.
- Calcular el total gastado por un jugador.
- Consultar la categoría de una skin.

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
- Consultas devolviendo resultados consistentes.
- Funciones SQL creadas correctamente y utilizadas mediante sentencias `SELECT`.
