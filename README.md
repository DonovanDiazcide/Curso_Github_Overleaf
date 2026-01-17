# Taller: Colaboración en Artículos Académicos
## Git + GitHub + Overleaf + VS Code

> **Duración**: 2 horas  
> **Modalidad**: Práctica guiada  
> **Producto final**: Artículo de práctica con contribuciones de todos los participantes

---

## 🎯 Objetivo

Establecer un flujo de trabajo colaborativo profesional para escribir artículos académicos en LaTeX, combinando:
- **Overleaf** para compilación en la nube
- **GitHub** para control de versiones y revisión de cambios
- **VS Code** para edición local rápida

---

## 👥 Participantes

| Nombre | Sistema Operativo | Idioma | Rol |
|--------|-------------------|--------|-----|
| **Mauricio** | Windows | Inglés | Owner del proyecto (Overleaf Premium) |
| **José Miguel** | Windows | Español | Colaborador |
| **Rodrigo** | macOS | Español | Colaborador |

---

## 📋 Antes del Taller: Instalación

**⚠️ IMPORTANTE**: Completa la instalación **ANTES** del taller (45-60 minutos).

### Encuentra tu guía según tu sistema:

| Tu Sistema | Guía de Instalación |
|------------|---------------------|
| Windows (inglés) | [`00-instalacion/windows-ingles.md`](00-instalacion/windows-ingles.md) |
| Windows (español) | [`00-instalacion/windows-espanol.md`](00-instalacion/windows-espanol.md) |
| macOS | [`00-instalacion/mac-espanol.md`](00-instalacion/mac-espanol.md) |

### Verificación rápida

Antes del taller, confirma que estos comandos funcionan:

```bash
git --version        # → git version 2.x.x
pdflatex --version   # → pdfTeX 3.x (TeX Live 202x)
```

---

## 📚 Contenido del Taller

| Tiempo | Parte | Contenido | Material |
|--------|-------|-----------|----------|
| 0:00 - 0:10 | Verificación | Confirmar instalaciones | — |
| 0:10 - 0:25 | **Parte 1** | Conceptos: Git, GitHub, Overleaf | [`01-conceptos/`](01-conceptos/README.md) |
| 0:25 - 0:45 | **Parte 2** | Configuración inicial | [`02-configuracion-inicial/`](02-configuracion-inicial/README.md) |
| 0:45 - 1:15 | **Parte 3** | Flujo básico: add → commit → push | [`03-flujo-basico/`](03-flujo-basico/README.md) |
| 1:15 - 1:35 | **Parte 4** | Ramas, PRs, conflictos | [`04-ramas-y-conflictos/`](04-ramas-y-conflictos/README.md) |
| 1:35 - 1:55 | **Parte 5** | Práctica libre | [`05-practica-libre/`](05-practica-libre/README.md) |
| 1:55 - 2:00 | Cierre | Resumen y recursos | — |

---

## 🔄 El Flujo de Trabajo

```
┌─────────────────────────────────────────────────────────────┐
│                    GitHub (Repositorio)                      │
│  • Backup en la nube    • Pull Requests    • Historial      │
└─────────────────────────────────────────────────────────────┘
                              ↑↓ sync
┌─────────────────────────────────────────────────────────────┐
│              Overleaf (Owner: Mauricio Premium)              │
│  • Compilación en nube  • Verificación final                │
└─────────────────────────────────────────────────────────────┘
                              ↑↓ git push/pull
         ┌────────────────────┼────────────────────┐
         ↓                    ↓                    ↓
   ┌───────────┐        ┌───────────┐        ┌───────────┐
   │ José M.   │        │ Mauricio  │        │ Rodrigo   │
   │ VS Code   │        │ VS Code   │        │ VS Code   │
   │ LOCAL     │        │ LOCAL     │        │ LOCAL     │
   └───────────┘        └───────────┘        └───────────┘
```

---

## 📁 Estructura del Repositorio

```
taller-colaboracion-latex/
│
├── README.md                      ← Estás aquí
│
├── 00-instalacion/                # Guías de instalación por OS
│   ├── README.md
│   ├── windows-ingles.md
│   ├── windows-espanol.md
│   └── mac-espanol.md
│
├── 01-conceptos/                  # Parte 1: Teoría
│   └── README.md
│
├── 02-configuracion-inicial/      # Parte 2: Setup
│   └── README.md
│
├── 03-flujo-basico/               # Parte 3: add/commit/push
│   └── README.md
│
├── 04-ramas-y-conflictos/         # Parte 4: Branches & PRs
│   └── README.md
│
├── 05-practica-libre/             # Parte 5: Ejercicio final
│   └── README.md
│
├── plantilla-articulo/            # Archivos LaTeX de práctica
│   ├── main.tex
│   ├── sections/
│   │   ├── introduction.tex
│   │   ├── related-work.tex
│   │   ├── methods.tex
│   │   ├── results.tex
│   │   └── conclusion.tex
│   ├── references.bib
│   └── .gitignore
│
└── recursos/                      # Material de apoyo
    ├── guia-rapida.md             # ⭐ Una página para imprimir
    ├── cheatsheet.md              # Comandos de referencia
    ├── notas-instructor.md        # Para quien facilita
    └── fuentes-citadas.md         # Referencias oficiales
```

---

## 🚀 Recursos Rápidos

| Recurso | Descripción | Para quién |
|---------|-------------|------------|
| [**⭐ Guía Rápida**](recursos/guia-rapida.md) | Una página con todo lo esencial | Todos (imprimir) |
| [**Cheatsheet**](recursos/cheatsheet.md) | Comandos Git de referencia | Todos |
| [**Notas Instructor**](recursos/notas-instructor.md) | Facilitación y troubleshooting | Instructor |
| [**Fuentes Citadas**](recursos/fuentes-citadas.md) | Referencias oficiales | Verificación |

---

## 🆘 Problemas Comunes

| Problema | Solución |
|----------|----------|
| `git push` rechazado | Hacer `git pull origin main` primero |
| LaTeX no compila en VS Code | Verificar MiKTeX/MacTeX en PATH, reiniciar VS Code |
| Overleaf no muestra cambios | Menu → GitHub → "Pull from GitHub" |
| Conflicto de merge | Ver [Parte 4](04-ramas-y-conflictos/README.md) |
| Comando no encontrado | Reiniciar terminal, verificar instalación |

---

## 📖 Recursos Externos

| Recurso | URL | Descripción |
|---------|-----|-------------|
| Pro Git Book | [git-scm.com/book](https://git-scm.com/book/en/v2) | Libro oficial, gratuito |
| GitHub Skills | [skills.github.com](https://skills.github.com/) | Cursos interactivos |
| Overleaf Learn | [overleaf.com/learn](https://www.overleaf.com/learn) | Tutoriales LaTeX |
| Learn Git Branching | [learngitbranching.js.org](https://learngitbranching.js.org/) | Práctica visual |

---

## ✅ Checklist del Participante

### Antes del taller
- [ ] Instalé Git y funciona (`git --version`)
- [ ] Instalé VS Code
- [ ] Instalé MiKTeX (Windows) o MacTeX (Mac)
- [ ] Instalé la extensión LaTeX Workshop
- [ ] Puedo compilar un archivo .tex en VS Code
- [ ] Tengo cuenta de GitHub

### Durante el taller
- [ ] Cloné el repositorio
- [ ] Hice al menos un commit
- [ ] Hice push a GitHub
- [ ] Creé una rama
- [ ] Creé un Pull Request
- [ ] Resolví (o vi resolver) un conflicto

### Después del taller
- [ ] Guardé la guía rápida
- [ ] Practiqué el flujo en un proyecto personal
- [ ] Exploré los recursos adicionales

---

## 📝 Licencia

Este material está disponible para uso educativo. Siéntete libre de adaptarlo para tus propios talleres.

---

## 🙏 Créditos

Desarrollado para el taller de colaboración académica.

**Referencias académicas**:
- arXiv:2408.09344 - "GitHub is an effective platform for collaborative and reproducible laboratory research"
- [KRR-UP LaTeX Collaboration Guide](https://github.com/krr-up/latex-collaboration-guide)
- [Noble Lab: 10 Tips for Collaborative Writing](https://willfondrie.com/2024/02/10-tips-for-collaborative-writing-with-latex-and-github/)

---

*¿Preguntas o sugerencias? Abre un Issue en este repositorio.*
