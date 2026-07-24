# Resolución Ejercicio 004 (Avanzado) - Triggers Garaje de Motos

**Estudiante:** Allison Vargas  
**Nivel:** Avanzado Inicial  

## Descripción
Uso de un Trigger en MySQL (`trg_auditoria_mantenimiento_motos`) para registrar de forma automatizada cualquier cambio en el estado de mantenimiento de las motocicletas hacia una tabla de auditoría.

## Estructura
- `ddl/schema.sql`: Creación de las tablas `motos`, `auditoria_mantenimiento` y la lógica del Trigger.
- `dml/inserts.sql`: Carga de 8 motocicletas y ejecución de sentencias `UPDATE` para probar el disparador.
- `dql/consultas.sql`: 5 consultas para revisar estados, trazabilidad en auditoría y agregaciones de costos.
