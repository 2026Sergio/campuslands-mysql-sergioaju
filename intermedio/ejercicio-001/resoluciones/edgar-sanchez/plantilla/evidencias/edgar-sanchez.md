# Ejercicio 001: Torneo Esports MOBA

## 👤 Datos del Desarrollador
- **Nombre:** Edgar Sánchez
- **Fecha:** 23/07/2026
- **Tecnología / SGBD:** MySQL v8.0

---

## 📌 Descripción del Proyecto
Este módulo de nivel intermedio implementa la base de datos relacional para la gestión de un torneo profesional de eSports del género MOBA. Modela la relación entre organizaciones (equipos) y sus pro players, permitiendo consultar métricas de rendimiento deportivo (KDA), costos de nómina por región y cruzamiento de datos mediante claves foráneas.

---

## 💡 Solución Planteada
1. **Modelado Relacional y FK:**
   - Se crearon las tablas `equipos` (entidad padre) y `jugadores` (entidad hijo).
   - Se estableció una relación de uno a muchos ($1:N$) mediante una clave foránea (`FOREIGN KEY`) en la tabla `jugadores`, integrando reglas de cascada (`ON DELETE CASCADE`, `ON UPDATE CASCADE`) para preservar la integridad referencial.

2. **Demostración de INNER JOIN:**
   - Se redactó una serie de consultas relacionales utilizando `INNER JOIN` en una sola hoja con un único comentario de apertura.
   - Las consultas permiten cruzar información de rendimiento individual con la región o tag del equipo, realizar agrupaciones con métricas consolidadas (`SUM`, `AVG`), aplicar incrementos salariales condicionados a resultados y filtrar al Top 5 mundial de competidores.