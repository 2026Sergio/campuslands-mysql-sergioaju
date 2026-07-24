# Resolución Ejercicio 002 (Intermedio) - LEFT JOIN Battle Royale

**Estudiante:** Allison Vargas  
**Nivel:** Intermedio Inicial  

## Descripción
Modelado relacional entre `clanes` y `jugadores`. Se hace uso extensivo de `LEFT JOIN` para consultar datos incluyendo casos en los que un jugador no pertenece a un clan o un clan no posee integrantes activos.

## Estructura
- `ddl/schema.sql`: Creación de las tablas `clanes` y `jugadores` con relaciones mediante clave foránea (`FOREIGN KEY`).
- `dml/inserts.sql`: Carga de 4 clanes y 8 jugadores (incluye registros nulos para probar combinaciones).
- `dql/consultas.sql`: 5 consultas analíticas enfocadas en `LEFT JOIN`, agrupaciones y funciones como `COALESCE`.
