# Ejercicio Avanzado 003: Inventario de Skins Shooter

## 👤 Datos del Desarrollador
- **Nombre:** Edgar Sánchez
- **Fecha:** 23/07/2026
- **Tecnología / SGBD:** MySQL

---

## 📌 Descripción del Proyecto
Este módulo permite la gestión y categorización analítica del inventario de skins para un juego tipo shooter. Mediante el desarrollo de funciones almacenadas y la integración de funciones nativas de MySQL, automatiza la generación de códigos de identificación, la clasificación comercial de ítems según su precio y el cálculo del valor económico total del inventario.

---

## 💡 Solución Planteada
1. **Modelado de Datos:**
   - Estructura relacional de dos tablas (`colecciones` y `skins`) con reglas de integridad referencial.
   - Validaciones mediante restricciones `CHECK` para garantizar datos numéricos coherentes.

2. **Uso de Funciones SQL:**
   - **`calcular_valor_inventario_skin`**: Función determinista que calcula el valor bruto total acumulado multiplicando el precio unitario por las existencias.
   - **`categorizar_valor_skin`**: Función con lógica condicional (`IF-ELSEIF`) para clasificar ítems en rangos comerciales (Coleccionista, Gama Alta, Gama Media, Económica).
   - **`generar_codigo_item`**: Función de manipulación de cadenas que combina funciones como `CONCAT`, `UPPER`, `LEFT`, `REPLACE` y `LPAD` para estructurar identificadores estandarizados.