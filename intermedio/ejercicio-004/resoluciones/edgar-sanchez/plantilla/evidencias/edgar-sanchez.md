# Ejercicio 004: Garaje de Motos

## 👤 Datos del Desarrollador
- **Nombre:** Edgar Sánchez
- **Fecha:** 23/07/2026
- **Tecnología / SGBD:** MySQL v8.0

---

## 📌 Descripción del Proyecto
Este proyecto de nivel intermedio gestiona el control operativo y financiero de un garaje/taller de motocicletas. Permite auditar el desempeño laboral de los mecánicos, evaluar la rentabilidad por tipo de mantenimiento, clasificar servicios según la cilindrada de los vehículos y filtrar indicadores agregados de volumen e ingresos.

---

## 💡 Solución Planteada
1. **Estructura Relacional:**
   - Se diseñaron las tablas `mecanicos` y `mantenimientos_motos` conectadas mediante una clave foránea (`FOREIGN KEY`) con reglas de borrado y actualización en cascada.
   - Se añadieron restricciones `CHECK` para garantizar datos matemáticos lógicos (cilindradas entre 50cc y 2500cc, costos no negativos y horas de trabajo superiores a cero).

2. **Uso Avanzado de la Cláusula HAVING:**
   - Se agrupó la información por tipos de servicios y técnicos mediante `GROUP BY`.
   - Se aplicó la cláusula `HAVING` para filtrar resultados basados explícitamente en agregaciones (ej. `COUNT() >= 3`, `AVG() > 200.00`, `SUM() > 10.0`).
   - Se integraron subconsultas basadas en `HAVING` para automatizar bonificaciones salariales (`UPDATE`) y para la depuración de mecánicos con baja carga de trabajo (`DELETE`).
   - Se generó un ranking comercial con los mecánicos de mayor ticket promedio de servicio (`ORDER BY` + `LIMIT`).