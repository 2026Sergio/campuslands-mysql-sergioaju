# ✨ Solución ejercicio intermedio: 03

## _Henrik Anderson Oloroso García 💯_

### Creación de las tablas 📑

Para este ejercicio se crearon dos tablas relacionadas entre sí, con el objetivo de representar un inventario de skins pertenecientes a un videojuego shooter y permitir realizar consultas agrupadas sobre la información almacenada.

La primera tabla es `skins_shooter`, que cuenta con los siguientes campos:

- skin_id
- nombre_skin
- rareza
- tipo_arma
- precio
- estado

La segunda tabla es `inventario_skins_shooter`, que cuenta con los siguientes campos:

- inventario_id
- skin_id
- cantidad

*El campo `skin_id` de la tabla `skins_shooter` está configurado como PK y como `AUTO_INCREMENT`, por lo que identifica de manera única cada skin.*

*El campo `inventario_id` de la tabla `inventario_skins_shooter` está configurado como PK y como `AUTO_INCREMENT`, por lo que identifica de manera única cada registro del inventario.*

*La tabla `inventario_skins_shooter` tiene una relación con la tabla `skins_shooter` mediante el campo `skin_id`, el cual funciona como FK y referencia al campo `skin_id` de la tabla `skins_shooter`.*

### Creación de registros 📝

Se insertaron 15 registros en la tabla `skins_shooter` con los siguientes campos:

- nombre_skin
- rareza
- tipo_arma
- precio
- estado

También se insertaron 15 registros en la tabla `inventario_skins_shooter` con los siguientes campos:

- skin_id
- cantidad

*Los campos `skin_id` e `inventario_id` que funcionan como PK y están configurados como `AUTO_INCREMENT` no se incluyeron directamente en los registros de sus respectivas tablas. MySQL asignará automáticamente los identificadores correspondientes.*

*El campo `skin_id` de `inventario_skins_shooter` se utilizó para establecer la relación entre cada registro del inventario y una skin existente en la tabla `skins_shooter`.*

### Consultas ✅

Las consultas que se realizaron fueron:

- Agrupar las skins por nivel de rareza utilizando `GROUP BY`, contando la cantidad de skins y sumando las unidades disponibles en el inventario.
- Agrupar las skins por tipo de arma, contando la cantidad de skins y calculando las unidades totales disponibles.
- Agrupar las skins según su estado, mostrando la cantidad de skins y las unidades almacenadas en el inventario.
- Agrupar las skins por rareza y calcular el precio promedio de cada categoría utilizando `AVG`.
- Agrupar las skins por tipo de arma y calcular el valor total del inventario multiplicando el precio de cada skin por su cantidad disponible.

*Las consultas permiten practicar el uso de `GROUP BY` para organizar registros en categorías y obtener indicadores mediante funciones de agregación como `COUNT`, `SUM` y `AVG`. También se utilizó `INNER JOIN` para combinar la información de las skins con los datos de su inventario.*