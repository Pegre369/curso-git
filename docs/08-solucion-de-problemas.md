# 8. Solución de problemas

[← Buenas prácticas](07-buenas-practicas.md) · [Chuleta de comandos →](chuleta.md)

## Deshacer cosas

| Situación | Solución |
|-----------|----------|
| Modifiqué un archivo y quiero descartar los cambios | `git restore archivo.txt` |
| Hice `git add` por error | `git restore --staged archivo.txt` |
| Me equivoqué en el mensaje del último commit (aún sin push) | `git commit --amend -m "Mensaje correcto"` |
| Olvidé agregar un archivo al último commit (aún sin push) | `git add archivo.txt` y luego `git commit --amend --no-edit` |
| Quiero deshacer el último commit pero conservar los cambios (sin push) | `git reset --soft HEAD~1` |
| Quiero deshacer un commit **que ya subí** | `git revert <id-del-commit>` (crea un commit nuevo que lo revierte, sin reescribir historial) |
| Hice commit en la rama equivocada (sin push) | `git reset --soft HEAD~1`, `git switch rama-correcta`, y vuelve a hacer commit |
| "Perdí" commits tras un reset | `git reflog` muestra todo lo que hiciste; recupera con `git reset --hard <id>` |

> **Regla:** `amend` y `reset` reescriben historial. Úsalos **solo en commits que no has subido**. Para lo que ya está en GitHub, usa `revert`.

## Errores frecuentes

### `fatal: not a git repository`

No estás dentro de la carpeta del repositorio. Usa `cd` para entrar a ella.

### `! [rejected] main -> main (fetch first)` o `(non-fast-forward)`

Alguien subió cambios que tú no tienes. Bájalos primero:

```powershell
git pull
```
```powershell
git push
```

### `Support for password authentication was removed`

Estás usando tu contraseña de GitHub. Configura la autenticación del [capítulo 2.4](02-instalacion.md#24-autenticarte-con-github).

### `remote: Repository not found`

- La URL está mal escrita (revísala con `git remote -v`), o
- tu cuenta no tiene acceso al repositorio (si es privado, pide acceso), o
- Windows guardó credenciales de otra cuenta: abre *Administrador de credenciales → Credenciales de Windows*, elimina las entradas `git:https://github.com` e intenta de nuevo.

### `refusing to merge unrelated histories`

Intentas unir dos repositorios sin historia común (por ejemplo, creaste el repo en GitHub con README y también hiciste `git init` local). Si es intencional:

```powershell
git pull origin main --allow-unrelated-histories
```

### `error: failed to push some refs` al migrar con `--mirror`

- El repositorio destino **no está vacío**: créalo de nuevo sin README.
- Mensajes `deny updating a hidden ref` en `refs/pull/...`: ocurre si clonaste con `--mirror` en lugar de `--bare`. Son referencias internas de pull requests que GitHub no acepta; el resto (ramas y tags) sí se subió. Verifica con `git ls-remote`.

### `this exceeds GitHub's file size limit of 100.00 MB`

GitHub no acepta archivos mayores a 100 MB. Opciones:

- Si no debía subirse, agrégalo a `.gitignore` y elimínalo del historial con `git filter-repo --path archivo-grande --invert-paths`.
- Si se necesita, usa **Git LFS**: `git lfs install`, `git lfs track "*.iso"`, y `git lfs migrate import --include="*.iso"` para convertir el historial existente.

### Los saltos de línea cambian en todos los archivos (Windows)

Windows y Linux usan distintos finales de línea. Agrega un archivo `.gitattributes` en la raíz del repositorio:

```gitattributes
* text=auto
```

## ¿Dónde pedir ayuda?

- Documentación oficial de GitHub (en español): <https://docs.github.com/es>
- Libro gratuito *Pro Git* (en español): <https://git-scm.com/book/es/v2>
- Práctica interactiva de ramas: <https://learngitbranching.js.org/?locale=es_ES>
- Ayuda integrada: `git help <comando>`, por ejemplo `git help commit`.

---

[← Buenas prácticas](07-buenas-practicas.md) · [Chuleta de comandos →](chuleta.md)
