# Guía Rápida: Colaboración en LaTeX con Overleaf + GitHub (Forks)

> Una página para tener a mano durante y después del taller  
> **Flujo 100% en el navegador — sin instalaciones locales**

---

## 🔄 El Flujo en 6 Pasos

```
1. GitHub: Sync fork              ← Obtener cambios de main
2. Overleaf: Pull from GitHub     ← Traer cambios a tu proyecto
3. [Editar en Overleaf]           ← Escribir, compilar, ver PDF
4. Overleaf: Push to GitHub       ← Subir tu trabajo a tu fork
5. GitHub: Create Pull Request    ← Solicitar revisión
6. GitHub: Review + Merge         ← Aprobar e integrar en main
```

---

## 📋 Acciones Esenciales

### En GitHub (navegador)

| Quiero... | Dónde | Cómo |
|-----------|-------|------|
| Traer cambios de main a mi fork | Mi fork en GitHub | **"Sync fork"** → **"Update branch"** |
| Proponer mis cambios a main | Mi fork en GitHub | **"Contribute"** → **"Open pull request"** |
| Revisar cambios de un compañero | Repo principal → Pull requests | Click en el PR → **"Files changed"** |
| Aprobar un PR | Dentro del PR | **"Review changes"** → **"Approve"** → **"Submit review"** |
| Fusionar un PR aprobado | Dentro del PR | **"Merge pull request"** → **"Create a merge commit"** |
| Ver tareas pendientes | Repo principal → Issues | Leer o crear nuevos Issues |

### En Overleaf (navegador)

| Quiero... | Dónde | Cómo |
|-----------|-------|------|
| Traer cambios de GitHub | Mi proyecto Overleaf | **Menu** → **GitHub** → **"Pull GitHub changes into Overleaf"** |
| Subir mis cambios a GitHub | Mi proyecto Overleaf | **Menu** → **GitHub** → **"Push Overleaf changes to GitHub"** → escribir mensaje |
| Compilar el PDF | Mi proyecto Overleaf | Click en **"Recompile"** (o se auto-compila) |

---

## 🏗️ Arquitectura

```
 OVERLEAF (Navegador)                 GITHUB (Navegador)
 ════════════════════                 ═══════════════════

 ┌──────────────────┐           ┌─────────────────────────┐
 │ Articulo-Main    │ ← sync → │ mauricio/articulo (main) │
 │ (versión oficial)│           └────────────┬────────────┘
 └──────────────────┘                        │
                                   ┌─────────┼──────────┐
                                   │  PRs    │    PRs   │
                                   │         │          │
 ┌──────────────────┐    ┌────────┴───┐  ┌──┴─────────┐
 │ Articulo-JM      │←→ │ josemiguel/ │  │ rodrigo/   │ ←→┌──────────────────┐
 │ Workspace        │    │ articulo    │  │ articulo   │    │ Articulo-Rodrigo │
 └──────────────────┘    │ (fork)      │  │ (fork)     │    │ Workspace        │
                         └────────────┘  └────────────┘    └──────────────────┘
```

---

## 🔁 Ciclo Diario de Trabajo

### Al empezar a trabajar:
1. **GitHub** → mi fork → **"Sync fork"** → "Update branch"
2. **Overleaf** → mi proyecto → Menu → GitHub → **"Pull from GitHub"**

### Mientras trabajo:
3. **Editar** en Overleaf → compilar → ver PDF → iterar

### Al terminar un avance:
4. **Overleaf** → Menu → GitHub → **"Push to GitHub"** → escribir mensaje descriptivo

### Cuando quiero que revisen:
5. **GitHub** → mi fork → **"Contribute"** → **"Open pull request"**
6. Compañeros revisan → aprueban → **Merge**

### Después del merge:
7. Repetir pasos 1-2 para obtener la versión actualizada

---

## ⚠️ Resolver Conflictos

### En un Pull Request (GitHub):

Si GitHub dice **"This branch has conflicts"**:

1. Click en **"Resolve conflicts"**
2. Buscar los marcadores en el editor web:
   ```
   <<<<<<< josemiguel/articulo:main
   Tu versión del texto
   =======
   La versión de main
   >>>>>>> mauricio/articulo:main
   ```
3. Decidir qué mantener (o combinar ambas)
4. Eliminar los marcadores (`<<<<<<<`, `=======`, `>>>>>>>`)
5. Click **"Mark as resolved"**
6. Click **"Commit merge"**
7. Ahora sí se puede hacer Merge normalmente

### En Overleaf ↔ GitHub:

Si hay conflicto al hacer Push desde Overleaf:
1. Overleaf crea una **rama temporal** en GitHub
2. Ir a GitHub y resolver el conflicto ahí (como arriba)
3. Volver a Overleaf y hacer **"Pull from GitHub"**

---

## ✅ Mensajes de Push: Buenas Prácticas

| ✅ Hacer | ❌ Evitar |
|----------|----------|
| "Completé la introducción con motivación y objetivos" | "cambios" |
| "Corregí errores de compilación en methods.tex" | "actualización" |
| "Agregué tabla comparativa en resultados" | "cosas nuevas" |
| Un Push por tarea completada | Muchos cambios acumulados sin Push |

---

## 📁 Estructura del Proyecto

```
articulo-taller-colaboracion/
├── main.tex                 ← Archivo principal
├── sections/
│   ├── introduction.tex     ← José Miguel
│   ├── related-work.tex     ← José Miguel
│   ├── methods.tex          ← Rodrigo
│   ├── results.tex          ← Mauricio
│   └── conclusion.tex       ← Rodrigo
└── references.bib           ← Bibliografía
```

---

## 🔑 Conceptos Clave

| Término | Significado |
|---------|-------------|
| **Fork** | Copia personal del repo en tu cuenta de GitHub |
| **Sync fork** | Traer los últimos cambios de main a tu fork |
| **Push to GitHub** | Subir cambios de Overleaf a tu fork en GitHub |
| **Pull from GitHub** | Traer cambios de GitHub a tu proyecto Overleaf |
| **Pull Request (PR)** | Solicitud para integrar cambios al repo principal |
| **Merge** | Fusionar cambios aprobados en main |
| **Issue** | Tarea o pendiente del proyecto |

---

## 🆘 Problemas Comunes

| Problema | Solución |
|----------|----------|
| "Sync fork" no aparece | Tu fork ya está actualizado, o no estás en la página de tu fork |
| Push falla desde Overleaf | Hacer Pull from GitHub primero para sincronizar |
| Conflicto en PR | Resolver en GitHub web (ver sección de conflictos arriba) |
| No veo opción de GitHub en Overleaf | Verificar que el proyecto fue creado por usuario Premium con GitHub vinculado |
| Cambios de main no aparecen en Overleaf | Hacer Sync fork en GitHub → luego Pull from GitHub en Overleaf |
| No puedo crear PR | Verificar que hiciste Push y que tu fork tiene cambios respecto a main |

---

## 🔗 Enlaces Útiles

- **Overleaf GitHub Sync**: [docs.overleaf.com](https://docs.overleaf.com/integrations-and-add-ons/git-integration-and-github-synchronization/github)
- **GitHub Forks**: [docs.github.com](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/working-with-forks)
- **Pro Git Book**: [git-scm.com/book](https://git-scm.com/book/en/v2)
- **Overleaf Docs**: [overleaf.com/learn](https://www.overleaf.com/learn)

---

## 👥 Roles del Equipo

| Persona | Rol | Overleaf | GitHub |
|---------|-----|----------|--------|
| **Mauricio** | Owner (Premium) | Crea todos los proyectos | Dueño del repo principal |
| **José Miguel** | Colaborador | Edita en JM Workspace | Trabaja en su fork |
| **Rodrigo** | Colaborador | Edita en Rodrigo Workspace | Trabaja en su fork |

---

*Imprime esta página o tenla abierta en otra pestaña durante el taller.*
