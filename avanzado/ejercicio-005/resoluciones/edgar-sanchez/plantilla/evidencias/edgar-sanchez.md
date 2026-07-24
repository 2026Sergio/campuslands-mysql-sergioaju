# Ejercicio Avanzado 005: Taller Mecánico de Motos

## 👤 Datos del Desarrollador
- **Nombre:** Edgar Sánchez
- **Fecha:** 23/07/2026
- **Tecnología / SGBD:** MySQL

---

## 📌 Descripción del Proyecto
Este módulo administra la recepción, historial de servicios e información de clientes de un taller mecánico de motocicletas. Su objetivo principal es demostrar la optimización de consultas SQL mediante el diseño eficiente de **Índices en MySQL**, acelerando operaciones de filtrado, uniones (`JOIN`) y búsquedas recurrentes.

---

## 💡 Solución Planteada
1. **Estrategia de Indización Aplicada:**
   - **`idx_clientes_documento`**: Índice sobre `documento_identidad` para agilizar las búsquedas directas de expedientes de clientes durante la recepción.
   - **`idx_motos_placa`** e **`idx_motos_cliente`**: Optimiza la búsqueda individual por matrícula y acelera las uniones relacionales (`JOIN`) con la tabla `clientes`.
   - **`idx_ordenes_estado_fecha`**: Índice compuesto sobre `(estado_orden, fecha_ingreso)` diseñado para responder velozmente a los paneles de control que filtran órdenes activas dentro de un rango de fechas.

2. **Verificación de Rendimiento:**
   - La inclusión de la sentencia `EXPLAIN` permite verificar que MySQL utiliza los índices asignados (tipo `ref` / `const`), evitando el escaneo completo de tablas (*FULL TABLE SCAN*) en el motor de almacenamiento.