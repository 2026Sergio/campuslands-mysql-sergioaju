# Ejercicio Avanzado 001: Torneo Esports MOBA

## 👤 Datos del Desarrollador
- **Nombre:** Edgar Sánchez
- **Fecha:** 23/07/2026
- **Tecnología / SGBD:** MySQL v8.0 (Motor InnoDB)

---

## 📌 Descripción del Proyecto
Este módulo de nivel avanzado gestiona el mercado financiero de transferencias (*fichajes*) dentro de un torneo profesional de eSports. Garantiza la consistencia atómica de datos al simular traspasos económicos entre organizaciones, descontando el presupuesto del comprador, acreditando al vendedor, actualizando el contrato del jugador y guardando auditoría.

---

## 💡 Solución Planteada
1. **Atomicidad e Integridad de Motor:**
   - Se configuraron las tablas en el motor **InnoDB** para habilitar el soporte explícito de transacciones y claves foráneas.
   - Se aplicaron restricciones `CHECK` para validar presupuestos no negativos.

2. **Gestión Transaccional (ACID):**
   - Se implementó un flujo completo con `START TRANSACTION`, `SAVEPOINT`, `COMMIT` y `ROLLBACK`.
   - La transacción asegura que si alguno de los pasos falla (por ejemplo, saldo insuficiente en la organización compradora), toda la operación se revierte por completo sin dejar la base de datos en un estado inconsistente.
   - Se incluyó una tabla de auditoría (`fichajes_historial`) para mantener la trazabilidad de cada movimiento financiero ejecutado.