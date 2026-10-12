# Manual de Git y GitHub: de cero a migrar tus repositorios

Manual práctico en español para quien **nunca ha usado Git** y necesita, además de aprender lo básico, **llevar sus proyectos a un repositorio nuevo sin perder el historial**.

Está pensado para líderes y equipos de TI que quieren adoptar control de versiones como práctica estándar: cada capítulo explica primero el *por qué* y después el *cómo*, con comandos listos para copiar.

> Los ejemplos usan **Windows** (PowerShell), pero los comandos de Git son idénticos en macOS y Linux.

---

## Ruta de aprendizaje

| # | Capítulo | Qué aprenderás | Tiempo aprox. |
|---|----------|----------------|---------------|
| 1 | [Conceptos básicos](docs/01-conceptos.md) | Qué es Git, qué es GitHub y en qué se diferencian | 15 min |
| 2 | [Instalación y configuración](docs/02-instalacion.md) | Instalar Git, crear cuenta, autenticarte | 30 min |
| 3 | [Tu primer repositorio](docs/03-primer-repositorio.md) | Crear, clonar, guardar cambios y subirlos | 30 min |
| 4 | [Ramas y flujo diario](docs/04-ramas-y-flujo.md) | Trabajar en paralelo sin romper nada | 45 min |
| 5 | [Trabajo en equipo en GitHub](docs/05-trabajo-en-equipo.md) | Pull requests, revisiones, organizaciones y permisos | 45 min |
| 6 | [**Migrar repositorios con todo su historial**](docs/06-migracion.md) | Mover uno o varios proyectos a un repositorio nuevo | 1 h |
| 7 | [Buenas prácticas y seguridad](docs/07-buenas-practicas.md) | Estándares para todo el equipo | 20 min |
| 8 | [Solución de problemas](docs/08-solucion-de-problemas.md) | Cómo deshacer errores comunes | consulta |
| 9 | [Seguridad y gestión de colaboradores](docs/09-seguridad-y-colaboradores.md) | Agregar personas, roles, 2FA, CODEOWNERS, alertas y auditoría | 45 min |
| 10 | [Estrategia de ramas: Git Flow y tipos de rama](docs/10-estrategia-de-ramas.md) | `main`/`develop`, feature, release, hotfix, chore, refactor… y cómo nombrarlas | 1 h |
| — | [Índice de comandos](docs/indice-de-comandos.md) | Búsqueda por tarea y referencia alfabética | consulta |

## ¿Tienes prisa?

- **Solo quiero mover un repositorio a otro:** ve directo al [capítulo 6](docs/06-migracion.md) o usa el script [`scripts/migrar-repo.ps1`](scripts/migrar-repo.ps1).
- **Quiero juntar varios proyectos en un solo repositorio:** [capítulo 6, escenario C](docs/06-migracion.md#escenario-c-juntar-varios-proyectos-en-un-solo-repositorio) y el script [`scripts/combinar-repos.ps1`](scripts/combinar-repos.ps1).

## Contenido del repositorio

```
curso-git/
├── README.md                  ← estás aquí
├── LICENSE                    ← licencia del manual (CC BY 4.0)
├── docs/                      ← capítulos del manual
└── scripts/
    ├── LICENSE                ← licencia de los scripts (MIT)
    ├── migrar-repo.ps1        ← copia un repo a otro con todo su historial
    ├── combinar-repos.ps1     ← junta varios repos en uno, cada uno en su carpeta
    └── proyectos-ejemplo.csv  ← plantilla para combinar-repos.ps1
```

## Cómo contribuir

¿Encontraste un error o quieres agregar algo? Es la mejor práctica para aprender:

1. Haz un *fork* o crea una rama.
2. Edita el archivo `.md` correspondiente.
3. Abre un *pull request* explicando el cambio (ver [capítulo 5](docs/05-trabajo-en-equipo.md)).

## Licencia

© 2026 **Ing. Pedro Ordoñez**. Este repositorio usa dos licencias, una para cada tipo de contenido:

| Contenido | Licencia | Puedes… | Condición |
|---|---|---|---|
| **Manual**: este README y la carpeta `docs/` | [Creative Commons Atribución 4.0 (CC BY 4.0)](LICENSE) | Copiarlo, compartirlo, adaptarlo y usarlo, incluso con fines comerciales | Citar al autor, enlazar a la licencia e indicar si hiciste cambios |
| **Scripts**: la carpeta `scripts/` | [MIT](scripts/LICENSE) | Usarlos, modificarlos e integrarlos en tus propios proyectos | Conservar el aviso de copyright y la licencia |

**Cómo citar este manual:**

> *Manual de Git y GitHub: de cero a migrar tus repositorios*, por Ing. Pedro Ordoñez, bajo licencia [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/deed.es). Disponible en <https://github.com/pegre369/curso-git>.

Resúmenes de cada licencia: [CC BY 4.0, en español](https://creativecommons.org/licenses/by/4.0/deed.es) · [MIT, en inglés](https://choosealicense.com/licenses/mit/). El texto legal válido es el de los archivos `LICENSE`, en inglés.

Al enviar un pull request, aceptas que tu aporte se publique bajo la misma licencia que la parte del repositorio que modificas.
