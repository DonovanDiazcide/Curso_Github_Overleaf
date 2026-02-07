# Taller: Colaboración en Artículos Académicos
## Git + GitHub + Overleaf + VS Code

[![Compilar LaTeX](https://github.com/DonovanDiazcide/Curso_Github_Overleaf/actions/workflows/compile-latex.yml/badge.svg)](https://github.com/DonovanDiazcide/Curso_Github_Overleaf/actions/workflows/compile-latex.yml)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![DOI](https://img.shields.io/badge/cite-CITATION.cff-blue)](CITATION.cff)

> **Duración**: 2 horas  
> **Modalidad**: Práctica guiada  
> **Producto final**: Artículo de práctica con contribuciones de todos los participantes  
> **Basado en**: [arXiv:2408.09344](https://arxiv.org/abs/2408.09344) - GitHub para investigación colaborativa y reproducible

---

## 📚 Tabla de Contenidos

- [🎯 Objetivo](#-objetivo)
- [👥 Participantes](#-participantes)
- [📋 Antes del Taller: Instalación](#-antes-del-taller-instalación)
- [📚 Contenido del Taller](#-contenido-del-taller)
- [🔄 El Flujo de Trabajo](#-el-flujo-de-trabajo)
- [📁 Estructura del Repositorio](#-estructura-del-repositorio)
- [🤝 Contribuir](#-contribuir)
- [📖 Cómo Citar](#-cómo-citar)
- [📜 Licencia](#-licencia)

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
| 1:15 - 1:35 | **Parte 4** | Ramas, PRs, conflictos | [`04_ramas_y_conflictos/`](04_ramas_y_conflictos/README.md) |
| 1:35 - 1:55 | **Parte 5** | Práctica libre | [`05-practica-libre/`](05-practica-libre/README.md) |
| 1:55 - 2:00 | Cierre | Resumen y recursos | — |

---

## 🔄 El Flujo de Trabajo

El flujo va de **local → GitHub → Overleaf**:

```
 ① TRABAJO LOCAL (donde todo empieza)
   ┌───────────┐        ┌───────────┐        ┌───────────┐
   │ José M.   │        │ Mauricio  │        │ Rodrigo   │
   │ VS Code   │        │ VS Code   │        │ VS Code   │
   │ LOCAL     │        │ LOCAL     │        │ LOCAL     │
   └─────┬─────┘        └─────┬─────┘        └─────┬─────┘
         └──── push/pull ────┼──── push/pull ────┘
                              │
 ② GITHUB (repositorio compartido)
   ┌─────────────────────────────────────────────┐
   │  Backup • Pull Requests • Historial       │
   └─────────────────────────────────────────────┘
                              │ sync (Mauricio)
 ③ OVERLEAF (verificación final)
   ┌─────────────────────────────────────────────┐
   │  Compilación en nube • Verificación final  │
   └─────────────────────────────────────────────┘
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
├── 04_ramas_y_conflictos/         # Parte 4: Branches & PRs
│   └── README.md
│
├── 05-practica-libre/             # Parte 5: Ejercicio final
│   └── README.md
│
├── taller-otree-git/              # 🆕 Taller alternativo: Git para oTree
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

## 🧪 Taller Alternativo: Git y GitHub para oTree

Este repositorio también incluye un **taller alternativo** enfocado en el uso de Git y GitHub para proyectos de economía experimental con oTree.

| Característica | Descripción |
|----------------|-------------|
| **Duración** | 3-4 horas |
| **Proyecto base** | Public Goods Game (oTree) |
| **Enfoque** | Programación colaborativa en Python/oTree |
| **Referencia académica** | Fehr & Gächter (2000), "Cooperation and Punishment in Public Goods Experiments" |

📁 **Material**: [`taller-otree-git/README.md`](taller-otree-git/README.md)

Este taller incluye:
- Flujo de trabajo con tareas medianas y tareas pequeñas
- Ejemplos prácticos con el Juego del Bien Público
- Tareas asignables para cada participante con soluciones completas
- Integración con Claude/IA para desarrollo asistido

---

## 🆘 Problemas Comunes

| Problema | Solución |
|----------|----------|
| `git push` rechazado | Hacer `git pull origin main` primero |
| LaTeX no compila en VS Code | Verificar MiKTeX/MacTeX en PATH, reiniciar VS Code |
| Overleaf no muestra cambios | Menu → GitHub → "Pull from GitHub" |
| Conflicto de merge | Ver [Parte 4](04_ramas_y_conflictos/README.md) |
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

## 🤝 Contribuir

¡Las contribuciones son bienvenidas! Si encuentras un error, tienes una sugerencia, o quieres mejorar el material:

1. **Reporta problemas**: Abre un [Issue](https://github.com/DonovanDiazcide/Curso_Github_Overleaf/issues/new/choose)
2. **Propón mejoras**: Lee nuestra [Guía de Contribución](CONTRIBUTING.md)
3. **Envía cambios**: Crea un Pull Request siguiendo el template

### Áreas donde puedes contribuir

- 🐛 Reportar bugs o errores en las instrucciones
- 📝 Mejorar la documentación y tutoriales
- 🌍 Traducir material a otros idiomas
- ✨ Agregar nuevos ejemplos o casos de uso
- 🎨 Mejorar diagramas y visualizaciones
- ✅ Agregar tests o validaciones

---

## 📖 Cómo Citar

Si usas este material en tu curso, taller, o publicación, por favor cita:

### Formato APA

```
Curso GitHub Overleaf Contributors. (2026). Taller: Colaboración en Artículos 
Académicos con Git, GitHub y Overleaf [Software]. 
https://github.com/DonovanDiazcide/Curso_Github_Overleaf
```

### BibTeX

```bibtex
@software{curso_github_overleaf_2026,
  title = {Taller: Colaboración en Artículos Académicos con Git, GitHub y Overleaf},
  author = {{Curso GitHub Overleaf Contributors}},
  year = {2026},
  url = {https://github.com/DonovanDiazcide/Curso_Github_Overleaf},
  note = {Material educativo basado en arXiv:2408.09344}
}
```

También puedes usar el archivo [CITATION.cff](CITATION.cff) que GitHub reconoce automáticamente.

### Artículo de referencia

Este taller está basado en las mejores prácticas descritas en:

> Pérez, F., et al. (2024). GitHub is an effective platform for collaborative 
> and reproducible laboratory research. *arXiv preprint arXiv:2408.09344*.

---

## 📜 Licencia

Este proyecto está licenciado bajo la Licencia MIT - ver el archivo [LICENSE](LICENSE) para más detalles.

**En resumen:**
- ✅ Uso comercial
- ✅ Modificación
- ✅ Distribución
- ✅ Uso privado
- ℹ️ Incluir aviso de licencia y copyright

---

## 🙏 Créditos

Desarrollado para el taller de colaboración académica.

**Basado en investigación de:**
- [arXiv:2408.09344](https://arxiv.org/abs/2408.09344) - "GitHub is an effective platform for collaborative and reproducible laboratory research" (Pérez et al., 2024)
- [KRR-UP LaTeX Collaboration Guide](https://github.com/krr-up/latex-collaboration-guide)
- [Noble Lab: 10 Tips for Collaborative Writing](https://willfondrie.com/2024/02/10-tips-for-collaborative-writing-with-latex-and-github/)

**Herramientas utilizadas:**
- [Git](https://git-scm.com/) - Control de versiones distribuido
- [GitHub](https://github.com/) - Plataforma de colaboración
- [Overleaf](https://www.overleaf.com/) - Editor LaTeX en línea
- [VS Code](https://code.visualstudio.com/) - Editor de código
- [LaTeX Workshop](https://marketplace.visualstudio.com/items?itemName=James-Yu.latex-workshop) - Extensión para VS Code

---

## 🌟 Agradecimientos

Gracias a todos los participantes y contribuidores que han ayudado a mejorar este material educativo.

---
---

*¿Preguntas o sugerencias? Abre un Issue en este repositorio.*
