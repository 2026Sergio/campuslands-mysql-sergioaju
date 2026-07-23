# Ejercicio 002: Ranking Battle Royale

## 👤 Datos del Desarrollador
- **Nombre:** Edgar Sánchez
- **Fecha:** 23/07/2026
- **Tecnología / SGBD:** MySQL v8.0

---

## 📌 Descripción del Proyecto
Este proyecto aborda la gestión de clasificaciones en un juego tipo *Battle Royale* utilizando relaciones de base de datos relacionales ($1:N$). Permite registrar usuarios y sus correspondientes partidas clasificatorias para calcular métricas de supervivencia, bajas y puntuación MMR, enfocándose en la detección de jugadores inactivos o sin partidas registradas.

---

## 💡 Solución Planteada
1. **Modelado y Claves Foráneas:**
   - Se crearon las tablas `jugadores` y `partidas_clasificatorias` vinculadas mediante la clave foránea `jugador_id` con reglas de cascada (`ON DELETE CASCADE`, `ON UPDATE CASCADE`).
   - Se aplicaron restricciones `CHECK` para validar los rangos de colocación (puestos de 1 a 100) y tiempos de partida válidos.

2. **Demostración de LEFT JOIN:**
   - Se estructuró un script de consultas agrupado en una sola hoja bajo un único comentario inicial.
   - Mediante la cláusula `LEFT JOIN`, se logró conservar a todos los jugadores en los resultados independientemente de si tienen partidas asociadas.
   - Se hizo uso de la función `COALESCE()` para evitar valores nulos (`NULL`) en métricas agregadas (`SUM`, `AVG`), transformándolos a $0$.
   - Se implementó la detección y depuración de cuentas inactivas mediante el patrón `WHERE p.partida_id IS NULL`.