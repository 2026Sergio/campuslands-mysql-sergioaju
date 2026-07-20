# Flujo de entrega

## Resumen

```text
dev -> rama personal -> commit -> push -> Pull Request hacia dev -> revision -> merge
```

## Paso 1: actualizar dev

```bash
git switch dev
git pull origin dev
```

## Paso 2: crear rama

```bash
git switch -c alumno/nombre-apellido/ejercicio-001
```

## Paso 3: copiar plantilla

```bash
mkdir -p basico/ejercicio-001/resoluciones/juan-perez
cp -R basico/ejercicio-001/plantilla/* basico/ejercicio-001/resoluciones/juan-perez/
```

## Paso 4: resolver

Edita solo tu carpeta personal.

## Paso 5: validar

```bash
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < basico/ejercicio-001/resoluciones/juan-perez/ddl/schema.sql
```

## Paso 6: commit y push

```bash
git add basico/ejercicio-001/resoluciones/juan-perez
git commit -m "feat(mysql): resolver ejercicio 001"
git push -u origin alumno/nombre-apellido/ejercicio-001
```

## Paso 7: Pull Request

Base correcta: `dev`. Base incorrecta: `main`.
