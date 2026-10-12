# 3. Tu primer repositorio

[← Instalación](02-instalacion.md) · [Siguiente: Ramas y flujo diario →](04-ramas-y-flujo.md)

Hay dos puntos de partida. Elige el tuyo:

- **A.** Empiezas un proyecto nuevo → crea el repo en GitHub y clónalo.
- **B.** Ya tienes una carpeta con archivos (sin Git) → conviértela en repositorio y súbela.

## Camino A: crear en GitHub y clonar

### 1. Crear el repositorio en GitHub

1. Clic en **+** (arriba a la derecha) → **New repository**.
2. **Owner:** tu usuario o la organización de la empresa.
3. **Repository name:** en minúsculas y con guiones, por ejemplo `inventario-ti`.
4. **Visibility:** *Private* para proyectos internos.
5. Marca **Add a README file**.
6. En **Add .gitignore** elige la plantilla de tu lenguaje (por ejemplo, `Python`, `Node`, `VisualStudio`).
7. **Create repository**.

### 2. Clonarlo a tu computadora

En la página del repositorio, botón verde **Code** → copia la URL.

```powershell
cd $HOME\Documents
```
```powershell
git clone https://github.com/tu-usuario/inventario-ti.git
```
```powershell
cd inventario-ti
```

Ya tienes la carpeta `inventario-ti` conectada con GitHub.

## Camino B: subir una carpeta existente

1. Crea en GitHub un repositorio **vacío** (sin README, sin .gitignore, sin licencia).
2. En la terminal, dentro de tu carpeta:

```powershell
cd C:\Proyectos\mi-sistema
```
```powershell
git init
```
```powershell
git add .
```
```powershell
git commit -m "Versión inicial del proyecto"
```
```powershell
git remote add origin https://github.com/tu-usuario/mi-sistema.git
```
```powershell
git push -u origin main
```

> **Antes del `git add .`:** crea un archivo `.gitignore` (ver abajo) para no subir contraseñas, archivos temporales o carpetas pesadas como `node_modules` o `bin/`.

## El ciclo básico: editar → preparar → guardar → subir

Este es el ciclo que repetirás todos los días:

```powershell
git status                              # 1. ¿Qué cambió?
git add archivo.txt                     # 2. Preparar un archivo (o "git add ." para todos)
git commit -m "Describe el cambio"      # 3. Guardar la fotografía
git push                                # 4. Subir a GitHub
```

### Ejercicio práctico

1. Abre `README.md` con cualquier editor y agrega una línea: `Proyecto de inventario del área de TI.`
2. Ejecuta `git status`. Verás el archivo en rojo como *modified*.
3. Ejecuta `git diff` para ver exactamente qué líneas cambiaron (presiona `q` para salir).
4. Ejecuta `git add README.md` y luego `git status`. Ahora aparece en verde: está preparado.
5. Ejecuta `git commit -m "Agrega descripción al README"`.
6. Ejecuta `git push`.
7. Recarga la página del repositorio en GitHub: verás tu cambio y tu commit.

### Ver el historial

```powershell
git log --oneline --graph --all
```

En GitHub: pestaña **Code** → enlace **N commits** (arriba de la lista de archivos).

### Bajar cambios hechos por otros

```powershell
git pull
```

> **Regla de oro:** haz `git pull` **antes** de empezar a trabajar cada día.

## El archivo `.gitignore`

Lista lo que Git **no** debe registrar. Ejemplo:

```gitignore
# Credenciales y configuración local
.env
*.key
appsettings.Development.json

# Dependencias y compilados
node_modules/
bin/
obj/
__pycache__/

# Archivos del sistema y editores
.vs/
.vscode/
Thumbs.db
.DS_Store
```

Plantillas listas para cada lenguaje: <https://github.com/github/gitignore>.

## Cómo escribir buenos mensajes de commit

| ❌ Malo | ✅ Bueno |
|--------|---------|
| `cambios` | `Corrige cálculo de IVA en facturas` |
| `fix` | `Valida que el correo tenga formato correcto en el registro` |
| `asdf` | `Agrega reporte mensual de tickets cerrados` |

Regla práctica: el mensaje debe completar la frase *"Este commit…"*. Debe ser corto (menos de 72 caracteres), en imperativo y explicar **qué** y **por qué**, no cómo.

---

[← Instalación](02-instalacion.md) · [Siguiente: Ramas y flujo diario →](04-ramas-y-flujo.md)
