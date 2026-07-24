# Resolución Ejercicio 001 (Básico) - Jugadores Esports MOBA

**Estudiante:** Allison Vargas  
**Nivel:** Básico Inicial  

## Descripción
Diseño y población de la tabla `jugadores` para gestionar el perfil, métricas de rendimiento (KDA, puntos) y estado de competidores en un torneo MOBA.

## Estructura
- `ddl/schema.sql`: Definición de la tabla `jugadores` con restricciones de valores (`ENUM`, `CHECK`).
- `dml/inserts.sql`: Carga inicial de 8 jugadores con roles y estadísticas variadas.
- `dql/consultas.sql`: 5 consultas analíticas enfocadas en promedios, rankings y estados.
