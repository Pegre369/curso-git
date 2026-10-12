# Chuleta de comandos Git

[← Inicio](../README.md)

## Configuración (una vez)

```powershell
git config --global user.name "Nombre Apellido"
git config --global user.email "correo@empresa.com"
git config --global init.defaultBranch main
```

## Empezar

| Comando | Qué hace |
|---------|----------|
| `git clone <url>` | Descarga un repositorio con todo su historial |
| `git init` | Convierte la carpeta actual en repositorio |
| `git remote add origin <url>` | Conecta el repositorio local con GitHub |
| `git remote -v` | Muestra a qué remoto estás conectado |

## Día a día

| Comando | Qué hace |
|---------|----------|
| `git status` | Qué archivos cambiaron |
| `git diff` | Qué líneas cambiaron |
| `git add <archivo>` / `git add .` | Prepara cambios |
| `git commit -m "mensaje"` | Guarda los cambios preparados |
| `git push` | Sube commits a GitHub |
| `git pull` | Baja commits de GitHub |
| `git log --oneline --graph` | Historial resumido |

## Ramas

| Comando | Qué hace |
|---------|----------|
| `git branch` | Lista ramas |
| `git switch -c <rama>` | Crea una rama y entra a ella |
| `git switch <rama>` | Cambia de rama |
| `git merge <rama>` | Une `<rama>` a la actual |
| `git push -u origin <rama>` | Sube una rama nueva |
| `git branch -d <rama>` | Borra una rama local |
| `git stash` / `git stash pop` | Guarda y recupera cambios temporalmente |

## Deshacer

| Comando | Qué hace |
|---------|----------|
| `git restore <archivo>` | Descarta cambios no preparados |
| `git restore --staged <archivo>` | Quita un archivo de staging |
| `git commit --amend` | Corrige el último commit (sin push) |
| `git reset --soft HEAD~1` | Deshace el último commit y conserva los cambios (sin push) |
| `git revert <id>` | Revierte un commit ya subido |
| `git reflog` | Historial de todo lo que hiciste (para rescates) |

## Migración

| Comando | Qué hace |
|---------|----------|
| `git clone --bare <origen>` | Copia solo el historial (para migrar) |
| `git push --mirror <destino>` | Sube todas las ramas y tags |
| `git lfs fetch --all` / `git lfs push --all <destino>` | Migra archivos LFS |
| `git subtree add --prefix=<carpeta> <url> <rama>` | Importa otro repo en una carpeta, con historial |
| `git ls-remote --heads --tags <url>` | Lista ramas y tags de un remoto (para verificar) |
| `git remote set-url origin <url-nueva>` | Apunta tu copia local al repo nuevo |
