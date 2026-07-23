# Ejercicio 003: Inventario de Skins Shooter

## 👤 Datos del Desarrollador
- **Nombre:** Edgar Sánchez
- **Fecha:** 23/07/2026
- **Tecnología usada:** MySQL

---

## 📌 Descripción del Proyecto
Este módulo gestiona la tienda digital e inventario de un videojuego tipo *Shooter*. Permite clasificar armas cosméticas por su rareza, valor comercial, disponibilidad en almacén y calidad estético-técnica (*float wear* o desgaste), ofreciendo consultas clave para la gestión comercial y filtrado rápido dentro del juego.

---

## 💡 Solución Planteada
1. **Diseño y Clave Primaria:**
   - Se diseñó la tabla `skins_inventario` garantizando la integridad entidad mediante la columna `skin_id` definida como `PRIMARY KEY` autoincremental (`AUTO_INCREMENT`). Esta elección asegura un identificador único, entero y eficiente para indexación.
   - Se incluyeron validaciones de tipo `CHECK` para restringir los precios, controlar que el valor de desgaste estético (*float_wear*) se mantenga en la escala estándar de 0.000 a 1.000, y definir un conjunto rígido de rarezas permitidas.

2. **Carga Sintética:**
   - Se insertaron 20 registros variados que abarcan desde cosméticos comunes de bajo costo hasta armas míticas y cuchillos de alta gama con contadores *StatTrak*.

3. **Consultas Técnicas Unificadas:**
   - Se construyó un script SQL consolidado que incluye filtrados de calidad de ítem (`WHERE`), agregados de valoración económica por rareza (`GROUP BY`), rebajas automatizadas por exceso de inventario (`UPDATE`), purga de ítems discontinuados (`DELETE`) y selección de ítems insignia para la tienda (`ORDER BY` + `LIMIT`).