# Ejercicio 003: Inventario de Skins Shooter

## 👤 Datos del Desarrollador
- **Nombre:** Edgar Sánchez
- **Fecha:** 23/07/2026
- **Tecnología / SGBD:** MySQL v8.0

---

## 📌 Descripción del Proyecto
Este proyecto aborda la gestión analítica del catálogo e inventario para un videojuego *Shooter*. Permite agrupar ítems cosméticos según su tipo de arma, nivel de rareza y colección de origen, calculando indicadores financieros clave como el precio promedio por categoría, la valoración total del inventario y el volumen disponible en almacén.

---

## 💡 Solución Planteada
1. **Modelado y Relaciones:**
   - Se definió una estructura $1:N$ entre `colecciones` y `skins` con reglas de integridad referencial.
   - Se aplicaron restricciones `CHECK` para validar categorías fijas de armas, rarezas y valores numéricos no negativos.

2. **Dominio de GROUP BY y Agregaciones:**
   - Se entregó la hoja de consultas de prueba agrupada bajo un único comentario inicial.
   - Se implementaron agrupamientos simples y multivariable (`GROUP BY arma_tipo, rareza`).
   - Se aplicó filtrado de grupos consolidado con la cláusula `HAVING` combinando agregaciones relacionales (`SUM`, `AVG`, `MAX`, `COUNT`).
   - Se utilizaron subconsultas basadas en agrupamientos para aplicar actualizaciones automáticas de precios en colecciones *High-Tier* y para depurar colecciones sin stock.
   - Se calculó el valor bruto total del inventario multiplicando el stock por el precio unitario agrupado por colección (`ORDER BY` + `LIMIT`).