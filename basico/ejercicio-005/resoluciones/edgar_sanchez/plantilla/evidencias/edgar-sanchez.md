# Ejercicio 005: Taller Mecánico de Motos

## 👤 Datos del Desarrollador
- **Nombre:** Edgar Sánchez
- **Fecha:** 23/07/2026
- **Tecnología / SGBD:** MySQL v8.0

---

## 📌 Descripción del Proyecto
Este proyecto desarrolla la solución de base de datos para la administración de las órdenes de trabajo de un taller mecánico de motocicletas. La estructura permite dar seguimiento a los servicios requeridos, registrar repuestos y costos de mano de obra, actualizar estados de trabajo y extraer reportes financieros sobre los servicios prestados.

---

## 💡 Solución Planteada
1. **Modelado y Consultas de Selección (SELECT):**
   - Se diseñó la tabla `ordenes_taller` con restricciones `CHECK` para limitar las categorías de servicio a un conjunto cerrado y asegurar que los campos de costo sean valores positivos.
   - El ejercicio está enfocado en el uso avanzado de sentencias `SELECT` para calcular columnas derivadas al vuelo (como la suma de repuestos y mano de obra para obtener el total de la factura).

2. **Carga y Manipulación de Datos:**
   - Se registraron 20 órdenes de trabajo realistas abarcando diferentes modelos de motocicletas y estados de atención (*Completado*, *En Proceso*, *En Espera*, *Cancelado*).

3. **Script SQL Unificado:**
   - Se entregó la hoja de consultas de prueba bajo un único comentario inicial con:
     - Selección de servicios completados de alto valor mediante operaciones aritméticas en el `WHERE`.
     - Reporte financiero y cantidad de servicios prestados por categoría (`GROUP BY` + `HAVING`).
     - Cierre automático de servicios expresos de bajo tiempo de ejecución (`UPDATE`).
     - Eliminación de registros cancelados e inactivos (`DELETE`).
     - Listado de las 5 reparaciones con mayor costo total para análisis administrativo (`ORDER BY` + `LIMIT`).