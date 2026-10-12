# 7. Buenas prácticas y seguridad

[← Migrar repositorios](06-migracion.md) · [Siguiente: Solución de problemas →](08-solucion-de-problemas.md)

Estas reglas sirven como **estándar de equipo**. Se recomienda adoptarlas por escrito desde el primer día.

## Estándares del equipo

1. **Todo el código vive en la organización de GitHub**, nunca solo en una computadora ni en cuentas personales.
2. **Nadie sube directo a `main`.** Todo cambio entra por pull request con al menos una aprobación.
3. **Una rama por tarea**, con nombre descriptivo (`feature/…`, `fix/…`).
4. **Commits pequeños y frecuentes**, con mensajes claros.
5. **`git pull` al empezar el día**, `git push` al terminarlo.
6. **Cada repositorio tiene un `README.md`** que explica qué es, cómo instalarlo y a quién contactar.
7. **Las versiones entregadas se marcan con tags** (`v1.0.0`, `v1.1.0`…).

## Seguridad

### Nunca subas secretos

Contraseñas, tokens, llaves API, cadenas de conexión o certificados **no deben estar en el repositorio**. Aunque los borres después, **siguen en el historial**.

**Cómo prevenirlo:**

- Usa variables de entorno o archivos `.env` incluidos en `.gitignore`.
- Sube un archivo de ejemplo sin valores reales (`.env.example`).
- Activa **Secret Protection / push protection** de GitHub (*Settings → Advanced Security*): bloquea el push si detecta un secreto conocido. Está disponible gratis en repositorios públicos.

**Si ya subiste un secreto:**

1. **Revócalo de inmediato** (cambia la contraseña o regenera el token). Asume que está comprometido.
2. Después, si es necesario, elimínalo del historial con `git filter-repo` y avisa al equipo para que vuelvan a clonar.

### Protege las cuentas

- 2FA obligatoria para toda la organización: *Organization → Settings → Authentication security → Require two-factor authentication*.
- Revisa periódicamente quién tiene acceso: *Organization → People*.
- Cuando alguien sale de la empresa, remuévelo de la organización el mismo día.
- Prefiere tokens **fine-grained** con fecha de expiración y permisos mínimos.

### Activa las alertas de dependencias

*Settings → Advanced Security* → activa **Dependabot alerts** y **Dependabot security updates**. GitHub avisará y propondrá PRs cuando una librería que usas tenga vulnerabilidades conocidas.

## Estructura recomendada de un repositorio

```
mi-proyecto/
├── README.md          ← qué es, cómo instalar, cómo usar
├── .gitignore
├── LICENSE            ← solo si el proyecto es público
├── CODEOWNERS         ← (opcional) responsables que revisan cada carpeta
├── docs/              ← documentación adicional
├── src/               ← código fuente
├── tests/             ← pruebas
└── .github/
    ├── workflows/     ← GitHub Actions
    └── pull_request_template.md
```

### Plantilla de pull request

Crea `.github/pull_request_template.md` y GitHub la mostrará automáticamente en cada PR:

```markdown
## ¿Qué cambia?

## ¿Por qué?

## ¿Cómo se probó?

- [ ] Probado localmente
- [ ] No incluye contraseñas ni datos sensibles
- [ ] Documentación actualizada si aplica

Closes #
```

## Plan de adopción sugerido para el área de TI

| Semana | Objetivo |
|--------|----------|
| 1 | Crear organización, activar 2FA y capacitar al equipo con los capítulos 1–4 |
| 2 | Migrar 1 proyecto piloto (capítulo 6) y trabajar con PRs |
| 3 | Definir estándares (este capítulo) y proteger `main` |
| 4 | Migrar el resto de los proyectos y archivar los repositorios o carpetas antiguas |
| 5+ | Introducir GitHub Actions para pruebas automáticas y Projects para seguimiento |

---

[← Migrar repositorios](06-migracion.md) · [Siguiente: Solución de problemas →](08-solucion-de-problemas.md)
