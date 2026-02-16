# Taller: GitHub + Overleaf para Artículos Académicos en LaTeX

> **Versión 2**: Flujo 100% en el navegador (sin VS Code ni instalaciones locales)  
> **Duración total**: ~1.5 horas  
> **Audiencia**: Investigadores y estudiantes que colaboran en artículos LaTeX  
> **Prerequisito**: Completar la [configuración previa](00-instalacion/README.md) (15-20 min antes del taller)

---

## ¿Qué aprenderán?

Un flujo de trabajo profesional para escribir artículos académicos en LaTeX de forma colaborativa, usando **control de versiones intencional** — todo desde el navegador:

- **Overleaf**: Editor de LaTeX en la nube donde escriben y compilan
- **GitHub**: Plataforma para compartir, revisar y aprobar cambios antes de integrarlos
- **Forks**: Cada quien tiene su propio espacio de trabajo (proyecto Overleaf + repositorio GitHub) conectado al proyecto principal

Este enfoque está alineado con las buenas prácticas de investigación reproducible (Gentzkow & Shapiro, "Code and Data for the Social Sciences"), **sin necesidad de instalar herramientas adicionales** en su computadora.

---

## Estructura del Taller

| Parte | Contenido | Duración | Archivo |
|-------|-----------|----------|---------|
| **Instalación** | Crear cuentas antes del taller | 15-20 min | [00-instalacion/](00-instalacion/README.md) |
| **Parte 1** | Conceptos fundamentales: Overleaf, GitHub, flujo de trabajo | 15 min | [01-conceptos/](01-conceptos/README.md) |
| **Parte 2** | Configuración inicial: Overleaf → GitHub → Forks | 20 min | [02-configuracion-inicial/](02-configuracion-inicial/README.md) |
| **Parte 3** | Flujo básico: Editar → Push → Pull Request → Sync | 25 min | [03-flujo-basico/](03-flujo-basico/README.md) |
| **Parte 4** | Pull Requests, revisión y resolución de conflictos | 15 min | [04_ramas_y_conflictos/](04_ramas_y_conflictos/README.md) |
| **Parte 5** | Práctica libre y cierre | 20 min | [05-practica-libre/](05-practica-libre/README.md) |

---

## El Flujo de Trabajo

```
┌─────────────────────────────────────────────────────────────┐
│        FLUJO: Overleaf (tu fork) → GitHub → Main            │
└─────────────────────────────────────────────────────────────┘

  1. GitHub: Sync fork              ← Obtener últimos cambios de main
  2. Overleaf: Pull from GitHub     ← Traer cambios a tu proyecto
  3. [Editar en Overleaf]           ← Escribir, compilar, iterar
  4. Overleaf: Push to GitHub       ← Subir tu trabajo al fork
  5. GitHub: Create Pull Request    ← Solicitar revisión
  6. GitHub: Review + Merge         ← Aprobar e integrar en main
```

### Conceptos clave

- **Control de versiones intencional**: Ustedes deciden cuándo subir una versión significativa a GitHub, con un mensaje que explica el *por qué*
- **Revisión antes de integrar**: Los Pull Requests permiten que compañeros revisen cambios antes de fusionarlos a la versión principal
- **Cada quien tiene su espacio**: Los forks dan a cada persona su propio proyecto Overleaf donde pueden trabajar libremente sin afectar a los demás

---

## Arquitectura: Los 3 Proyectos de Overleaf

```
┌────────────────────────────────────────────────────────────────┐
│                    ARQUITECTURA DEL TALLER                     │
└────────────────────────────────────────────────────────────────┘

  Proyecto Overleaf "Main"            ← Versión oficial del artículo
  (Owner: Mauricio Premium)               Solo recibe cambios vía PR
        ↕ sync                            aprobados en GitHub
  GitHub: mauricio/articulo (main)
        ↑                    ↑
        │ Pull Request       │ Pull Request
        │                    │
  GitHub: josemiguel/        GitHub: rodrigo/
  articulo (fork)            articulo (fork)
        ↕ sync                    ↕ sync
  Proyecto Overleaf           Proyecto Overleaf
  "JM Workspace"              "Rodrigo Workspace"
  (Compartido por Mauricio)   (Compartido por Mauricio)
```

> 💡 **¿Por qué Mauricio crea los proyectos?** Porque tiene cuenta Premium, y la sincronización GitHub↔Overleaf es una función Premium. Al crear Mauricio los proyectos y compartirlos, José Miguel y Rodrigo pueden usar la sincronización sin necesitar cuenta Premium propia.

---

## Materiales Incluidos

### Para participantes

| Recurso | Descripción |
|---------|-------------|
| [guia-rapida.md](guia-rapida.md) | Referencia de una página con los pasos esenciales |
| [articulo-prueba/](articulo-prueba/) | Artículo LaTeX de ejemplo para práctica |
| [plantilla-articulo/](plantilla-articulo/) | Plantilla base para nuevos proyectos |

### Para instructores

| Recurso | Descripción |
|---------|-------------|
| [recursos/notas-instructor.md](recursos/notas-instructor.md) | Notas y guía para facilitar el taller |
| [recursos/analisis-dificultad-trivias.md](recursos/analisis-dificultad-trivias.md) | Análisis de las preguntas de trivia |
| [recursos/fuentes-citadas.md](recursos/fuentes-citadas.md) | Referencias y fuentes utilizadas |

---

## Antes del Taller

Los participantes deben completar la configuración **antes** de asistir:

1. Ir a [00-instalacion/](00-instalacion/README.md)
2. Crear cuenta de GitHub (si no tienen)
3. Tener acceso a Overleaf (al menos un miembro con cuenta Premium)

---

## Licencia

Este material está disponible para uso educativo. Referencia recomendada: Gentzkow & Shapiro, "Code and Data for the Social Sciences" para principios de control de versiones en investigación.
