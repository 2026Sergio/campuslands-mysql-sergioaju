# Ejercicio 004: Garaje de Motos

## 👤 Datos del Desarrollador
- **Nombre:** Edgar Sánchez
- **Fecha:** 23/07/2026
- **Tecnología :** MySQL 

---

## 📌 Descripción del Proyecto
Este proyecto implementa el módulo de base de datos para la gestión operativa y comercial de un garaje / concesionario de motocicletas. Permite clasificar vehículos por cilindrada y tipo, controlar disponibilidad para alquileres, calcular tarifas y auditar el nivel de uso mediante el kilometraje recorrido.

---

## 💡 Solución Planteada
1. **Modelado y Validación:**
   - Se estructuró la tabla `motos_garaje` utilizando restricciones `CHECK` para evitar la entrada de datos ilógicos, asegurando rangos de cilindrada válidos ($50cc - 2500cc$), años de fabricación coherentes y valores positivos en kilometraje y precios.

2. **Practica de Inserción (INSERT):**
   - Se aplicó una sentencia `INSERT INTO` masiva con 20 registros variados que abarcan distintas categorías (*Deportiva*, *Naked*, *Touring*, *Scooter*, etc.), poblando el sistema con combinaciones realistas de marcas, estados de disponibilidad y desgaste por uso.

3. **Consultas Técnicas Unificadas:**
   - Se entregó un script limpio de consultas agrupadas en una sola hoja bajo un único comentario inicial. El script incluye:
     - Selección de unidades de alta cilindrada con disponibilidad inmediata (`WHERE`).
     - Resumen estadístico del parque vehicular agrupado por segmento (`GROUP BY` + `HAVING`).
     - Ajuste inflacionario/temporada en tarifas de gama alta (`UPDATE`).
     - Retiro o purga de flota antigua con alto kilometraje (`DELETE`).
     - Reporte de las 5 unidades en mejor estado operativo con menor desgaste (`ORDER BY` + `LIMIT`).