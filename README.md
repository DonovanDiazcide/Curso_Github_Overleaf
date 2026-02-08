# Taller: Git + GitHub + Overleaf para Artículos Académicos en LaTeX

> **Duración total**: ~2 horas  
> **Audiencia**: Investigadores y estudiantes que colaboran en artículos LaTeX  
> **Prerequisito**: Completar la [instalación previa](00-instalacion/README.md) (45-60 min antes del taller)

---

## ¿Qué aprenderán?

Un flujo de trabajo profesional para escribir artículos académicos en LaTeX de forma colaborativa, usando **control de versiones intencional**:

- **Git**: Sistema que guarda "fotos" (commits) de su proyecto con historial completo
- **GitHub**: Plataforma para compartir, revisar y aprobar cambios antes de integrarlos
- **VS Code**: Editor local con todas las herramientas de LaTeX
- **Overleaf**: Solo para verificación final en la nube

Este enfoque está alineado con las buenas prácticas de investigación reproducible (Gentzkow & Shapiro, "Code and Data for the Social Sciences").

---

## Estructura del Taller

| Parte | Contenido | Duración | Archivo |
|-------|-----------|----------|---------|
| **Instalación** | Configurar herramientas antes del taller | 45-60 min | [00-instalacion/](00-instalacion/README.md) |
| **Parte 1** | Conceptos fundamentales: Git, GitHub, flujo de trabajo | 15 min | [01-conceptos/](01-conceptos/README.md) |
| **Parte 2** | Configuración inicial: Overleaf → GitHub → Local | 20 min | [02-configuracion-inicial/](02-configuracion-inicial/README.md) |
| **Parte 3** | Flujo básico: Editar → Commit → Push → Sync | 30 min | [03-flujo-basico/](03-flujo-basico/README.md) |
| **Parte 4** | Ramas, Pull Requests y resolución de conflictos | 20 min | [04_ramas_y_conflictos/](04_ramas_y_conflictos/README.md) |
| **Parte 5** | Práctica libre y cierre | 25 min | [05-practica-libre/](05-practica-libre/README.md) |

---

## El Flujo de Trabajo

```
┌─────────────────────────────────────────────────────────────┐
│              FLUJO DIARIO: Local → GitHub → Overleaf        │
└─────────────────────────────────────────────────────────────┘

  1. git pull                    ← Obtener cambios de otros
  2. [Editar en VS Code]         ← Trabajar localmente  
  3. git add archivo.tex         ← Preparar cambios
  4. git commit -m "mensaje"     ← Tomar "foto" con descripción
  5. git push                    ← Subir a GitHub
  6. Overleaf: Pull from GitHub  ← Sincronizar (verificación final)
```

### Conceptos clave

- **Control de versiones intencional**: Ustedes deciden cuándo guardar una "versión" significativa (commit), con un mensaje que explica el *por qué*
- **Historial completo preservado**: Todos los commits se mantienen accesibles (usando "Create a merge commit" al integrar cambios)
- **Revisión antes de integrar**: Los Pull Requests permiten que compañeros revisen cambios antes de fusionarlos

---

## Materiales Incluidos

### Para participantes

| Recurso | Descripción |
|---------|-------------|
| [guia-rapida.md](guia-rapida.md) | Referencia de una página con comandos esenciales |
| [articulo-prueba/](articulo-prueba/) | Artículo LaTeX de ejemplo para práctica |
| [plantilla-articulo/](plantilla-articulo/) | Plantilla base para nuevos proyectos |

### Para instructores

| Recurso | Descripción |
|---------|-------------|
| [recursos/notas-instructor.md](recursos/notas-instructor.md) | Notas y guía para facilitar el taller |
| [recursos/analisis-dificultad-trivias.md](recursos/analisis-dificultad-trivias.md) | Análisis de las preguntas de trivia |
| [recursos/fuentes-citadas.md](recursos/fuentes-citadas.md) | Referencias y fuentes utilizadas |

### Variante para proyectos de programación

| Recurso | Descripción |
|---------|-------------|
| [taller-otree-git/](taller-otree-git/README.md) | Versión del taller adaptada para proyectos oTree (Python) |

---

## Antes del Taller

Los participantes deben completar la instalación **antes** de asistir:

1. Ir a [00-instalacion/](00-instalacion/README.md)
2. Elegir la guía según su sistema operativo
3. Verificar que todo funciona ejecutando:
   ```bash
   git --version
   pdflatex --version
   ```

---

## Licencia

Este material está disponible para uso educativo. Referencia recomendada: Gentzkow & Shapiro, "Code and Data for the Social Sciences" para principios de control de versiones en investigación.
