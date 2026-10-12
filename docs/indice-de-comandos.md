# Índice de comandos

[← Inicio](../README.md)

Referencia de todos los comandos que aparecen en el manual. Se puede consultar de dos formas:

- **[Buscar por tarea](#buscar-por-tarea):** sabes *qué* quieres hacer, pero no el comando.
- **[Índice alfabético](#índice-alfabético):** conoces el comando y quieres ver sus variantes y en qué capítulo se explica.

> Notación: lo que va entre `<ángulos>` se reemplaza por tu valor. Por ejemplo, `git switch <rama>` → `git switch main`.

---

## Buscar por tarea

| Quiero… | Comando | Capítulo |
|---------|---------|:--------:|
| **Configurar Git por primera vez** | `git config --global user.name "<nombre>"` | [2](02-instalacion.md) |
| **Descargar un repositorio** | `git clone <url>` | [3](03-primer-repositorio.md) |
| **Convertir una carpeta en repositorio** | `git init` | [3](03-primer-repositorio.md) |
| **Ver qué cambió** | `git status` · `git diff` | [3](03-primer-repositorio.md) |
| **Guardar cambios** | `git add .` → `git commit -m "<mensaje>"` | [3](03-primer-repositorio.md) |
| **Subir mis cambios a GitHub** | `git push` | [3](03-primer-repositorio.md) |
| **Bajar los cambios de otros** | `git pull` | [3](03-primer-repositorio.md) |
| **Ver el historial** | `git log --oneline --graph` | [3](03-primer-repositorio.md) |
| **Trabajar en algo nuevo sin tocar `main`** | `git switch -c <rama>` | [4](04-ramas-y-flujo.md) |
| **Unir una rama terminada** | `git merge <rama>` | [4](04-ramas-y-flujo.md) |
| **Guardar cambios a medias para cambiar de rama** | `git stash` · `git stash pop` | [4](04-ramas-y-flujo.md) |
| **Marcar una versión** | `git tag -a v1.0.0 -m "<mensaje>"` | [4](04-ramas-y-flujo.md) |
| **Empezar una feature en Git Flow** | `git switch -c feature/<nombre> develop` | [10](10-estrategia-de-ramas.md#105-paso-a-paso) |
| **Corregir producción (hotfix)** | `git switch -c hotfix/<version>-<nombre> main` | [10](10-estrategia-de-ramas.md#105-paso-a-paso) |
| **Unir dejando constancia del merge** | `git merge --no-ff <rama>` | [10](10-estrategia-de-ramas.md#105-paso-a-paso) |
| **Pedir revisión de mis cambios** | `gh pr create` | [5](05-trabajo-en-equipo.md) |
| **Copiar un repo a otro con todo su historial** | `git clone --bare` → `git push --mirror` | [6](06-migracion.md) |
| **Juntar varios repos en uno** | `git subtree add --prefix=<carpeta> <url> <rama>` | [6](06-migracion.md) |
| **Cambiar la URL del repositorio remoto** | `git remote set-url origin <url>` | [6](06-migracion.md) |
| **Descartar cambios de un archivo** | `git restore <archivo>` | [8](08-solucion-de-problemas.md) |
| **Corregir el último commit** | `git commit --amend` | [8](08-solucion-de-problemas.md) |
| **Deshacer un commit que ya subí** | `git revert <id>` | [8](08-solucion-de-problemas.md) |
| **Recuperar algo que creí perdido** | `git reflog` | [8](08-solucion-de-problemas.md) |

---

## Índice alfabético

[add](#git-add) · [branch](#git-branch) · [clone](#git-clone) · [commit](#git-commit) · [config](#git-config) · [diff](#git-diff) · [fetch](#git-fetch) · [filter-repo](#git-filter-repo) · [init](#git-init) · [lfs](#git-lfs) · [log](#git-log) · [ls-remote](#git-ls-remote) · [merge](#git-merge) · [pull](#git-pull) · [push](#git-push) · [reflog](#git-reflog) · [remote](#git-remote) · [reset](#git-reset) · [restore](#git-restore) · [revert](#git-revert) · [stash](#git-stash) · [status](#git-status) · [subtree](#git-subtree) · [switch](#git-switch) · [tag](#git-tag) · [GitHub CLI (gh)](#github-cli-gh)

### `git add`
Prepara cambios para el próximo commit (los pasa al *staging*). · [Cap. 3](03-primer-repositorio.md)

| Variante | Uso |
|----------|-----|
| `git add <archivo>` | Prepara un archivo |
| `git add .` | Prepara todos los cambios de la carpeta actual |

### `git branch`
Lista, crea o borra ramas. · [Cap. 4](04-ramas-y-flujo.md)

| Variante | Uso |
|----------|-----|
| `git branch` | Lista ramas locales (la actual lleva `*`) |
| `git branch -a` | Incluye las ramas remotas |
| `git branch -d <rama>` | Borra una rama local ya unida |

### `git clone`
Descarga un repositorio remoto con todo su historial. · [Cap. 3](03-primer-repositorio.md), [Cap. 6](06-migracion.md)

| Variante | Uso |
|----------|-----|
| `git clone <url>` | Copia de trabajo normal |
| `git clone --bare <url>` | Solo el historial, sin archivos de trabajo (para migrar) |

### `git commit`
Guarda una "fotografía" de los cambios preparados. · [Cap. 3](03-primer-repositorio.md), [Cap. 8](08-solucion-de-problemas.md)

| Variante | Uso |
|----------|-----|
| `git commit -m "<mensaje>"` | Commit con mensaje |
| `git commit -am "<mensaje>"` | Prepara y guarda archivos ya conocidos por Git en un paso |
| `git commit --amend -m "<mensaje>"` | Corrige el último commit (solo si no se ha subido) |

### `git config`
Configura Git. · [Cap. 2](02-instalacion.md)

| Variante | Uso |
|----------|-----|
| `git config --global user.name "<nombre>"` | Tu nombre en los commits |
| `git config --global user.email "<correo>"` | Tu correo en los commits |
| `git config --global init.defaultBranch main` | Rama principal por defecto |
| `git config --global --list` | Muestra la configuración |

### `git diff`
Muestra las líneas que cambiaron y aún no se guardan. · [Cap. 3](03-primer-repositorio.md)

| Variante | Uso |
|----------|-----|
| `git diff` | Cambios no preparados |
| `git diff --staged` | Cambios ya preparados con `git add` |

### `git fetch`
Descarga commits del remoto **sin** mezclarlos con tu trabajo. · [Cap. 6](06-migracion.md)

| Variante | Uso |
|----------|-----|
| `git fetch` | Actualiza la información del remoto `origin` |
| `git fetch <remoto>` | De un remoto específico |

### `git filter-repo`
Reescribe el historial. Herramienta externa (`pip install git-filter-repo`). · [Cap. 6](06-migracion.md), [Cap. 8](08-solucion-de-problemas.md)

| Variante | Uso |
|----------|-----|
| `git filter-repo --to-subdirectory-filter <carpeta>` | Mueve todo el historial a una subcarpeta |
| `git filter-repo --path <archivo> --invert-paths` | Elimina un archivo de todo el historial |

### `git init`
Convierte la carpeta actual en un repositorio. · [Cap. 3](03-primer-repositorio.md)

| Variante | Uso |
|----------|-----|
| `git init` | Repositorio nuevo |
| `git init -b main` | Indica el nombre de la rama principal |

### `git lfs`
Maneja archivos grandes (Git Large File Storage). · [Cap. 6](06-migracion.md), [Cap. 8](08-solucion-de-problemas.md)

| Variante | Uso |
|----------|-----|
| `git lfs install` | Activa LFS en tu equipo |
| `git lfs track "*.iso"` | Indica qué archivos guarda LFS |
| `git lfs fetch --all` | Descarga todos los archivos LFS |
| `git lfs push --all <url>` | Sube todos los archivos LFS a otro remoto |

### `git log`
Muestra el historial de commits. · [Cap. 3](03-primer-repositorio.md)

| Variante | Uso |
|----------|-----|
| `git log --oneline` | Una línea por commit |
| `git log --oneline --graph --all` | Con el dibujo de ramas |
| `git log --oneline -- <carpeta>` | Solo commits que tocaron esa carpeta |

### `git ls-remote`
Lista las ramas y tags de un repositorio remoto sin descargarlo. · [Cap. 6](06-migracion.md)

| Variante | Uso |
|----------|-----|
| `git ls-remote --heads --tags <url>` | Para comparar origen y destino tras migrar |
| `git ls-remote --symref <url> HEAD` | Muestra cuál es la rama principal |

### `git merge`
Une otra rama a la rama actual. · [Cap. 4](04-ramas-y-flujo.md), [Cap. 6](06-migracion.md)

| Variante | Uso |
|----------|-----|
| `git merge <rama>` | Une `<rama>` a la actual |
| `git merge --no-ff <rama>` | Siempre crea un commit de merge (Git Flow, [Cap. 10](10-estrategia-de-ramas.md)) |
| `git merge --abort` | Cancela un merge con conflictos |
| `git merge <rama> --allow-unrelated-histories` | Une repositorios sin historia común |

### `git pull`
Baja los commits del remoto y los une a tu rama. · [Cap. 3](03-primer-repositorio.md)

| Variante | Uso |
|----------|-----|
| `git pull` | De la rama remota asociada |
| `git pull origin main --allow-unrelated-histories` | Cuando el remoto y el local empezaron por separado |

### `git push`
Sube tus commits al remoto. · [Cap. 3](03-primer-repositorio.md), [Cap. 4](04-ramas-y-flujo.md), [Cap. 6](06-migracion.md)

| Variante | Uso |
|----------|-----|
| `git push` | Sube la rama actual |
| `git push -u origin <rama>` | Primera subida de una rama nueva |
| `git push origin <tag>` | Sube un tag |
| `git push origin --delete <rama>` | Borra una rama en GitHub |
| `git push --mirror <url>` | Sube todas las ramas y tags (migración) |

### `git reflog`
Registro de todo lo que hiciste en tu equipo; sirve para rescatar commits "perdidos". · [Cap. 8](08-solucion-de-problemas.md)

### `git remote`
Gestiona las conexiones con repositorios remotos. · [Cap. 3](03-primer-repositorio.md), [Cap. 6](06-migracion.md)

| Variante | Uso |
|----------|-----|
| `git remote -v` | Muestra los remotos y sus URLs |
| `git remote add origin <url>` | Conecta con un remoto |
| `git remote set-url origin <url>` | Cambia la URL (tras migrar) |
| `git remote remove <nombre>` | Quita un remoto |

### `git reset`
Mueve la rama a otro commit. **Reescribe historial: solo para commits no subidos.** · [Cap. 8](08-solucion-de-problemas.md)

| Variante | Uso |
|----------|-----|
| `git reset --soft HEAD~1` | Deshace el último commit y conserva los cambios |
| `git reset --hard <id>` | Vuelve exactamente a ese commit (descarta cambios) |

### `git restore`
Descarta cambios en archivos. · [Cap. 8](08-solucion-de-problemas.md)

| Variante | Uso |
|----------|-----|
| `git restore <archivo>` | Descarta cambios no preparados |
| `git restore --staged <archivo>` | Quita el archivo del *staging* (conserva los cambios) |

### `git revert`
Crea un commit nuevo que deshace otro. Seguro para commits ya subidos. · [Cap. 8](08-solucion-de-problemas.md)

| Variante | Uso |
|----------|-----|
| `git revert <id>` | Revierte ese commit |

### `git stash`
Guarda cambios temporalmente sin hacer commit. · [Cap. 4](04-ramas-y-flujo.md)

| Variante | Uso |
|----------|-----|
| `git stash` | Guarda y limpia la carpeta |
| `git stash pop` | Recupera lo guardado |
| `git stash list` | Lista lo guardado |

### `git status`
Muestra qué archivos cambiaron y cuáles están preparados. · [Cap. 3](03-primer-repositorio.md)

### `git subtree`
Importa otro repositorio dentro de una carpeta, con su historial. · [Cap. 6](06-migracion.md)

| Variante | Uso |
|----------|-----|
| `git subtree add --prefix=<carpeta> <url> <rama>` | Importa el proyecto en `<carpeta>` |

### `git switch`
Cambia de rama. · [Cap. 4](04-ramas-y-flujo.md)

| Variante | Uso |
|----------|-----|
| `git switch <rama>` | Cambia a una rama existente |
| `git switch -c <rama>` | Crea la rama y cambia a ella |
| `git switch -c <rama> <base>` | Crea la rama a partir de otra (por ejemplo, `develop`) |

### `git tag`
Marca versiones. · [Cap. 4](04-ramas-y-flujo.md)

| Variante | Uso |
|----------|-----|
| `git tag` | Lista los tags |
| `git tag -a v1.0.0 -m "<mensaje>"` | Crea un tag con descripción |

### GitHub CLI (`gh`)
Herramienta oficial de GitHub para la terminal. · [Cap. 2](02-instalacion.md), [Cap. 5](05-trabajo-en-equipo.md), [Cap. 6](06-migracion.md)

| Comando | Uso |
|---------|-----|
| `gh auth login` | Inicia sesión en GitHub |
| `gh pr create` | Abre un pull request |
| `gh gei migrate-repo` | Migra repos entre organizaciones con issues y PRs |

---

[← Inicio](../README.md)
