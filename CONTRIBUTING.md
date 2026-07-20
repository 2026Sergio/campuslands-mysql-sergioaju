# Guia de contribucion

## Flujo obligatorio

Todo estudiante debe trabajar desde `dev` y abrir Pull Request hacia `dev`.

No se aceptan entregas directas a `main`.

## Estructura de resoluciones

Formato obligatorio:

```text
<nivel>/ejercicio-XXX/resoluciones/nombre-apellido/
```

Ejemplo:

```text
basico/ejercicio-001/resoluciones/juan-perez/
```

## Estandar de commits

Usa Conventional Commits:

| Tipo | Uso | Ejemplo |
| --- | --- | --- |
| `feat` | Nueva solucion o funcionalidad | `feat(mysql): resolver ejercicio 001` |
| `fix` | Correccion de una solucion | `fix(mysql): corregir foreign key` |
| `docs` | Documentacion o evidencias | `docs(mysql): agregar capturas de consulta` |
| `style` | Formato sin cambiar resultado | `style(mysql): ordenar script ddl` |
| `refactor` | Reorganizacion sin cambiar comportamiento | `refactor(mysql): separar consultas` |
| `test` | Validaciones o pruebas | `test(mysql): agregar consulta de validacion` |
| `chore` | Mantenimiento | `chore(mysql): limpiar archivos temporales` |

## Antes del PR

- Ejecuta tus scripts en MySQL.
- Revisa `git status`.
- Confirma que tu PR apunta a `dev`.
- Confirma que no tocaste archivos base ni respuestas ajenas.
