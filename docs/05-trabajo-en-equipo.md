# 5. Trabajo en equipo en GitHub

[← Ramas y flujo diario](04-ramas-y-flujo.md) · [Siguiente: Migrar repositorios →](06-migracion.md)

## Pull requests (PR)

Un pull request es una **solicitud formal** para unir una rama a `main`. Es el corazón del trabajo en equipo porque permite revisar el código **antes** de que llegue a producción.

> Aquí verás lo esencial: abrir, revisar y unir. Para la administración del día a día (borradores, etiquetas, responder revisiones, conflictos, filtros y comandos `gh pr`) consulta el [capítulo 11](11-administrar-pull-requests.md).

### Abrir un pull request

1. Sube tu rama (`git push -u origin feature/mi-cambio`).
2. En GitHub aparecerá un aviso amarillo **Compare & pull request**. Haz clic.
3. Escribe:
   - **Título:** qué hace el cambio.
   - **Descripción:** por qué, cómo probarlo, capturas si aplica. Si resuelve un issue, escribe `Closes #12` para cerrarlo automáticamente al hacer merge.
4. En la barra derecha asigna **Reviewers** (revisores).
5. **Create pull request**.

Con GitHub CLI:

```powershell
gh pr create --base main --title "Agrega exportación a Excel" --body "Closes #12"
```

### Revisar un pull request

1. Pestaña **Files changed**: verás las diferencias línea por línea.
2. Clic en el **+** junto a una línea para comentar.
3. **Review changes** → elige:
   - **Comment:** solo comentarios.
   - **Approve:** aprobado.
   - **Request changes:** debe corregirse antes de unir.

### Unir (merge) el pull request

Cuando esté aprobado, botón **Merge pull request**. Las opciones:

| Opción | Resultado | Cuándo usarla |
|--------|-----------|---------------|
| **Create a merge commit** | Conserva todos los commits de la rama | Historial detallado |
| **Squash and merge** | Junta todos los commits en uno solo | **Recomendada** para equipos que empiezan: historial de `main` limpio |
| **Rebase and merge** | Coloca los commits uno tras otro sin commit de merge | Equipos con experiencia |

Después, **Delete branch** para mantener el repositorio ordenado.

## Issues: tareas y reportes de errores

La pestaña **Issues** funciona como un sistema de tickets ligero:

- Crea un issue por cada tarea, error o mejora.
- Usa **Labels** (`bug`, `mejora`, `urgente`) y **Assignees** (responsables).
- Agrúpalos en **Milestones** (por ejemplo, "Versión 2.0").
- Para tableros tipo Kanban usa **Projects** (*pestaña Projects → New project → Board*).

## Organizaciones y equipos

Para una empresa, los repositorios deben pertenecer a una **organización**, no a cuentas personales.

1. *Tu avatar → Your organizations → New organization*.
2. Elige el plan (el gratuito permite repos privados ilimitados).
3. Invita miembros: *Organización → People → Invite member*.
4. Crea **equipos** por área: *Teams → New team* (por ejemplo, `desarrollo`, `infraestructura`, `soporte`).
5. Da acceso a repositorios por equipo, no persona por persona.

### Niveles de permiso por repositorio

| Rol | Puede |
|-----|-------|
| **Read** | Ver y clonar |
| **Triage** | Gestionar issues y PRs, sin escribir código |
| **Write** | Subir código y crear ramas |
| **Maintain** | Gestionar el repositorio sin acceso a configuración sensible |
| **Admin** | Todo, incluyendo borrar el repositorio |

> **Principio de mínimo privilegio:** la mayoría del equipo necesita *Write*; reserva *Admin* para 1–2 personas.

## Proteger la rama `main`

Evita que alguien suba código a producción sin revisión.

*Repositorio → Settings → Rules → Rulesets → New ruleset → New branch ruleset*:

1. **Enforcement status:** *Active*.
2. **Target branches:** *Add target → Include default branch*.
3. Activa:
   - ✅ **Restrict deletions**: nadie puede borrar `main`.
   - ✅ **Require a pull request before merging**, con al menos **1 aprobación**.
   - ✅ **Block force pushes**: nadie puede reescribir el historial.
   - ✅ **Require status checks to pass**, si usas GitHub Actions para pruebas automáticas.

> Los rulesets en repositorios privados requieren un plan de pago (GitHub Team o superior). En el plan gratuito funcionan en repositorios públicos.

## Automatización con GitHub Actions (introducción)

GitHub Actions ejecuta tareas automáticas (pruebas, compilación, despliegue) cada vez que ocurre algo en el repositorio. Se define en archivos `.github/workflows/*.yml`. Ejemplo mínimo que verifica cada PR:

```yaml
name: Verificación
on:
  pull_request:
    branches: [main]
jobs:
  pruebas:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - run: echo "Aquí van tus pruebas (npm test, dotnet test, pytest, etc.)"
```

Explora plantillas en la pestaña **Actions** de cualquier repositorio.

---

[← Ramas y flujo diario](04-ramas-y-flujo.md) · [Siguiente: Migrar repositorios →](06-migracion.md)
