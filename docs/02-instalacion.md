# 2. Instalación y configuración

[← Conceptos](01-conceptos.md) · [Siguiente: Tu primer repositorio →](03-primer-repositorio.md)

## 2.1 Crear una cuenta en GitHub

1. Entra a <https://github.com/signup>.
2. Usa tu **correo corporativo** si la cuenta será para trabajo.
3. Elige un nombre de usuario profesional (aparecerá en todos tus commits públicos).
4. **Activa la verificación en dos pasos (2FA):** *Settings → Password and authentication → Two-factor authentication*. GitHub la exige a quienes contribuyen código, y es indispensable para una cuenta de TI.

> **Para la empresa:** crea una **organización** (*Your organizations → New organization*) en lugar de usar cuentas personales para los repositorios corporativos. Así los repositorios pertenecen a la empresa y no a una persona. Ver [capítulo 5](05-trabajo-en-equipo.md#organizaciones-y-equipos).

## 2.2 Instalar Git

### Windows

**Opción A — instalador gráfico:** descarga desde <https://git-scm.com/download/win> y acepta las opciones por defecto.

**Opción B — desde PowerShell** (requiere `winget`, incluido en Windows 10/11 actualizados):

```powershell
winget install --id Git.Git -e --source winget
```

### macOS

```bash
xcode-select --install
```

### Linux (Debian/Ubuntu)

```bash
sudo apt install git
```

### Verificar la instalación

Cierra y vuelve a abrir la terminal, y ejecuta:

```powershell
git --version
```

Debe mostrar algo como `git version 2.x.x`.

## 2.3 Configuración inicial (solo una vez)

Git necesita saber quién eres para firmar tus commits:

```powershell
git config --global user.name "Tu Nombre Apellido"
```
```powershell
git config --global user.email "tu-correo@empresa.com"
```

Que la rama principal se llame `main` (estándar actual de GitHub):

```powershell
git config --global init.defaultBranch main
```

Comprueba la configuración:

```powershell
git config --global --list
```

> **Importante:** el correo debe ser uno registrado en tu cuenta de GitHub (*Settings → Emails*) para que los commits aparezcan vinculados a tu perfil. Si no quieres exponer tu correo en repositorios públicos, GitHub te ofrece uno privado del tipo `12345678+usuario@users.noreply.github.com` en esa misma página.

## 2.4 Autenticarte con GitHub

GitHub **no acepta tu contraseña** para operaciones de Git. Hay tres formas de autenticarte; elige una.

### Opción A — Git Credential Manager (la más fácil en Windows)

Viene incluido con Git para Windows. La primera vez que hagas `git clone` o `git push` a un repositorio privado, se abrirá el navegador para iniciar sesión en GitHub. Después, recuerda tus credenciales. **No tienes que hacer nada más.**

### Opción B — GitHub CLI (`gh`)

Herramienta oficial de línea de comandos. Además de autenticar, permite crear repositorios, PRs, etc. sin salir de la terminal.

```powershell
winget install --id GitHub.cli
```
```powershell
gh auth login
```

Responde: `GitHub.com` → `HTTPS` → `Yes` (autenticar Git) → `Login with a web browser`.

### Opción C — Llaves SSH (recomendada para uso intensivo)

```powershell
ssh-keygen -t ed25519 -C "tu-correo@empresa.com"
```

Presiona Enter para aceptar la ruta por defecto y define una frase de seguridad. Luego copia la llave **pública**:

```powershell
Get-Content "$env:USERPROFILE\.ssh\id_ed25519.pub" | Set-Clipboard
```

Pégala en GitHub: *Settings → SSH and GPG keys → New SSH key*. Prueba la conexión:

```powershell
ssh -T git@github.com
```

> Con SSH, las URLs de los repositorios tienen la forma `git@github.com:usuario/repo.git` en lugar de `https://github.com/usuario/repo.git`.

## 2.5 Herramientas recomendadas (opcionales)

| Herramienta | Para qué | Enlace |
|-------------|----------|--------|
| **GitHub Desktop** | Interfaz gráfica, ideal para empezar sin comandos | <https://desktop.github.com> |
| **Visual Studio Code** | Editor con Git integrado (ver cambios, hacer commits) | <https://code.visualstudio.com> |

> **Consejo:** aprende primero los comandos de este manual. Una vez que entiendes qué hace cada uno, las interfaces gráficas se vuelven obvias; al revés no ocurre lo mismo.

---

[← Conceptos](01-conceptos.md) · [Siguiente: Tu primer repositorio →](03-primer-repositorio.md)
