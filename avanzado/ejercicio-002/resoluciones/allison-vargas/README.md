# Resolución Ejercicio 002 (Avanzado) - Stored Procedures Battle Royale

**Estudiante:** Allison Vargas  
**Nivel:** Avanzado Inicial  

## Descripción
Diseño e implementación de un Stored Procedure (`registrar_resultado_partida`) que procesa los eventos de cada partida de Battle Royale, calcula automáticamente la puntuación obtenida e incrementa las estadísticas globales y el rango del jugador.

## Estructura
- `ddl/schema.sql`: Creación de tablas e implementación del procedimiento almacenado.
- `dml/inserts.sql`: Inserción de jugadores y llamadas a `CALL registrar_resultado_partida(...)`.
- `dql/consultas.sql`: Consultas analíticas para Leaderboard, Win Rate y K/D ratio.
