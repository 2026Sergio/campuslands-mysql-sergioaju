# Ejercicio Avanzado 004: Garaje de Motos

## 👤 Datos del Desarrollador
- **Nombre:** Edgar Sánchez
- **Fecha:** 23/07/2026
- **Tecnología / SGBD:** MySQL

---

## 📌 Descripción del Proyecto
Este módulo automatiza la validación de reglas de negocio y la trazabilidad de operaciones dentro de un garaje de motocicletas utilizando **Triggers en MySQL**. Garantiza que no se asignen trabajos a personal inactivo, calcula automáticamente el volumen de trabajo e historial laboral de los mecánicos y audita las modificaciones de costos en los servicios.

---

## 💡 Solución Planteada
1. **Disparadores Implementados:**
   - **`tg_validar_mecanico_activo` (`BEFORE INSERT`)**: Intercepta la inserción de un servicio y utiliza `SIGNAL SQLSTATE '45000'` para abortar la operación si el mecánico asignado tiene un estatus `Inactivo`.
   - **`tg_actualizar_estadisticas_mecanico` (`AFTER INSERT`)**: Mantiene sincronizados los campos `horas_totales_trabajadas` y `total_servicios_realizados` en la tabla `mecanicos` cada vez que se registra una nueva orden.
   - **`tg_auditar_cambio_precio` (`AFTER UPDATE`)**: Evalúa mediante las pseudotablas `OLD` y `NEW` si hubo cambios en el precio final del mantenimiento. De ser así, registra de forma automática una entrada en `auditoria_precios_mantenimiento` capturando el precio anterior, el nuevo y el usuario que realizó la transacción.