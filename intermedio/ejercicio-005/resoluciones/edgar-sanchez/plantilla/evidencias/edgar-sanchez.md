# Ejercicio 005: Taller Mecánico de Motos

## 👤 Datos del Desarrollador
- **Nombre:** Edgar Sánchez
- **Fecha:** 23/07/2026
- **Tecnología:** MySQL

---

## 📌 Descripción del Proyecto
Este módulo administra la recepción, historial de servicios e indicadores financieros de un taller mecánico enfocado en motocicletas. Permite resolver preguntas complejas de negocio mediante **subconsultas SQL**, identificando clientes de alto valor, servicios por encima del costo promedio del taller y vehículos sin historial activo de mantenimientos.

---

## 💡 Solución Planteada
1. **Diseño de Base de Datos:**
   - Modelo relacional de tres tablas (`clientes` -> `motos` -> `reparaciones`).
   - Aplicación de restricciones de integridad (`CHECK` en años, cilindradas y costos) y borrado/actualización en cascada.

2. **Dominio de Subconsultas:**
   - **Subconsulta Escalar:** Utilizada en la cláusula `WHERE` para filtrar reparaciones cuyo costo total excede el promedio histórico del taller (`AVG`).
   - **Subconsulta Correlacionada:** Integrada en la cláusula `SELECT` para calcular dinámicamente métricas individuales por cliente sin necesidad de agregaciones masivas externas.
   - **Subconsulta con EXISTS:** Empleada para ubicar rápidamente motocicletas con órdenes de trabajo activas (`Pendiente` o `En Proceso`).
   - **DML Avanzado con Subconsultas:** 
     - Reclasificación automática de clientes a categoría `VIP` (`UPDATE`) cuando su gasto total acumulado supera los 1,500.00.
     - Depuración segura de vehículos antiguos sin registros en taller (`DELETE`) con subconsulta `NOT IN`.