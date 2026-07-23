# ✨ Solución ejercicio avanzado: 03

## _Henrik Anderson Oloroso García 💯_

### Creación de las tablas 📑

Para este ejercicio se crearon dos tablas relacionadas entre sí, con el objetivo de representar un inventario de skins pertenecientes a un videojuego shooter y permitir realizar operaciones utilizando funciones SQL.

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

### Funciones SQL utilizadas ⚙️

En este ejercicio se utilizaron diferentes funciones SQL para transformar, calcular y clasificar la información almacenada.

Las funciones utilizadas fueron:

- `UPPER`: convierte el texto de la rareza a mayúsculas.
- `LOWER`: convierte el tipo de arma a minúsculas.
- `CONCAT`: permite construir una descripción combinando diferentes valores de texto.
- `ROUND`: redondea los resultados numéricos a una cantidad específica de decimales.
- `CASE`: permite clasificar las skins según su precio mediante diferentes condiciones.

*Estas funciones permiten transformar los datos almacenados y generar información derivada sin modificar los valores originales de las tablas.*

### Consultas ✅

Las consultas que se realizaron fueron:

- Convertir los valores de `rareza` a mayúsculas y los valores de `tipo_arma` a minúsculas utilizando `UPPER` y `LOWER`.
- Construir una descripción personalizada de cada skin utilizando `CONCAT`.
- Calcular el precio de cada skin incluyendo un impuesto del `19%` y redondear el resultado utilizando `ROUND`.
- Relacionar las tablas `skins_shooter` e `inventario_skins_shooter` mediante `INNER JOIN` para calcular el valor total de cada skin disponible en el inventario.
- Clasificar las skins según su precio utilizando `CASE`, separándolas en las categorías `Precio alto`, `Precio medio` y `Precio bajo`.

*Las consultas permiten practicar funciones de texto, funciones numéricas y expresiones condicionales en MySQL. También se utilizó `INNER JOIN` para combinar información de las dos tablas y realizar cálculos utilizando los valores relacionados.*

### Explicación final 📝

*La solución permite practicar el uso de funciones SQL en MySQL para transformar y analizar información almacenada en una base de datos. Se utilizaron funciones de texto como `UPPER`, `LOWER` y `CONCAT`, funciones numéricas como `ROUND` y una expresión condicional `CASE` para generar resultados derivados.*

*Además, se mantuvieron separadas las tablas de información de las skins y del inventario, utilizando una clave foránea para establecer la relación entre ambas. De esta manera, las funciones SQL pueden aplicarse tanto sobre datos individuales como sobre información obtenida mediante la combinación de tablas.*