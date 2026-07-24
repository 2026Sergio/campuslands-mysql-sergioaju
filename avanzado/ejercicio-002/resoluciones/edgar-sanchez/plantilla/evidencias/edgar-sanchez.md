# Ejercicio Avanzado 002: Ranking Battle Royale

## 👤 Datos del Desarrollador
- **Nombre:** Edgar Sánchez
- **Fecha:** 23/07/2026
- **Tecnología / SGBD:** MySQL

---

## 📌 Descripción del Proyecto
Este módulo administra la tabla de posiciones y el historial de rendimiento de un videojuego Battle Royale. Automatiza la actualización de estadísticas, recalcula la división correspondiente según la puntuación obtenida y consulta los primeros lugares de la tabla de clasificación.

---

## 💡 Solución Planteada
1. **Lógica en Base de Datos:**
   - La tabla `jugadores` se conecta con `divisiones` para clasificar según la puntuación obtenida.
   - El procedimiento `registrar_resultado_partida` recibe los datos del enfrentamiento, guarda el registro en el historial, suma las estadísticas y recalcula el rango automáticamente.
   - El procedimiento `obtener_top_jugadores` genera una vista de los mejores jugadores con sus porcentajes de efectividad.