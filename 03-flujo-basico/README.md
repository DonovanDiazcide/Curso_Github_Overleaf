# Parte 3: Flujo de Trabajo Básico

> **Duración**: 25 minutos  
> **Objetivo**: Dominar el ciclo diario: Editar en Overleaf → Push a GitHub → Pull Request → Merge

---

## Resumen de esta parte

| Paso | Descripción | Tiempo |
|------|-------------|--------|
| 3.1 | Entender el ciclo de trabajo | 3 min |
| 3.2 | Mauricio crea la estructura del artículo | 5 min |
| 3.3 | Todos sincronizan y obtienen los archivos | 3 min |
| 3.4 | Cada quien edita su sección en su Overleaf | 8 min |
| 3.5 | Subir cambios a GitHub (Push) | 3 min |
| 3.6 | Crear Pull Request | 3 min |

---

## 3.1 El ciclo de trabajo

En nuestro flujo, cada "versión" que suben a GitHub es intencional — incluye un mensaje que explica el *por qué* del cambio.

```
📸 Versión 1: "Estructura inicial del artículo"
    Estado: main.tex, introduction.tex (vacíos)
    Autor: Mauricio

📸 Versión 2: "Completé la sección de introducción"
    Estado: introduction.tex (con 3 párrafos)
    Autor: José Miguel

📸 Versión 3: "Describí la metodología y herramientas"
    Estado: methods.tex (con contenido)
    Autor: Rodrigo
```

### ¿Por qué es útil?

- **Historial completo**: Pueden ver exactamente qué cambió, cuándo y quién lo hizo
- **Mensajes descriptivos**: Cada versión tiene una explicación del "por qué"
- **Reversibilidad**: Si algo sale mal, pueden ver el estado anterior en GitHub

### Buenas prácticas para los mensajes de Push

| ✅ Hacer | ❌ Evitar |
|----------|----------|
| Mensajes descriptivos: "Completé análisis de resultados" | Mensajes vagos: "cambios" o "actualización" |
| Un Push por tarea completada | Acumular muchos cambios sin hacer Push |
| Hacer Push cuando tienen un avance coherente | Hacer Push con cambios a medias que rompen compilación |

---

## 3.2 Estructura del artículo (Mauricio)

> **Mauricio**: Crea estos archivos en el proyecto **"Articulo-Main"** de Overleaf.

### Estructura de archivos

```
articulo-taller-colaboracion/
├── main.tex                 ← Archivo principal
├── sections/
│   ├── introduction.tex     ← José Miguel editará esto
│   ├── methods.tex          ← Rodrigo editará esto
│   ├── results.tex          ← Mauricio editará esto
│   └── conclusion.tex       ← Para después
└── references.bib           ← Bibliografía
```

<!-- 📸 CAPTURA: Panel izquierdo de Overleaf mostrando el árbol de archivos del proyecto (main.tex, carpeta sections/ con los .tex, references.bib) -->
![Árbol de archivos del proyecto en Overleaf](img/01-overleaf-estructura-archivos.png)

### Archivo: `main.tex`

```latex
\documentclass[12pt,a4paper]{article}

% Paquetes básicos
\usepackage[utf8]{inputenc}
\usepackage[spanish]{babel}
\usepackage{amsmath,amsfonts,amssymb}
\usepackage{graphicx}
\usepackage{hyperref}
\usepackage{natbib}

% Configuración de márgenes
\usepackage[margin=2.5cm]{geometry}

% Título y autores
\title{Artículo de Práctica: Colaboración con GitHub, Overleaf y LaTeX}
\author{
    Mauricio\textsuperscript{1} \and 
    José Miguel\textsuperscript{1} \and 
    Rodrigo\textsuperscript{1}
}
\date{\today}

\begin{document}

\maketitle

\begin{abstract}
Este documento es un ejercicio práctico para aprender a colaborar en artículos académicos usando GitHub y Overleaf. Cada autor contribuirá una sección diferente.
\end{abstract}

% Incluir secciones desde archivos separados
\input{sections/introduction}
\input{sections/methods}
\input{sections/results}
\input{sections/conclusion}

% Bibliografía
\bibliographystyle{apalike}
\bibliography{references}

\end{document}
```

### Archivo: `sections/introduction.tex`

```latex
\section{Introducción}

% === JOSÉ MIGUEL: Edita esta sección ===

Este es el texto inicial de la introducción. 

José Miguel reemplazará este contenido con una introducción sobre la importancia de la colaboración en proyectos académicos.

\subsection{Motivación}

[Pendiente: explicar por qué es importante tener un flujo de trabajo colaborativo]

\subsection{Objetivos}

[Pendiente: listar los objetivos del artículo]
```

### Archivo: `sections/methods.tex`

```latex
\section{Metodología}

% === RODRIGO: Edita esta sección ===

Este es el texto inicial de la metodología.

Rodrigo reemplazará este contenido con una descripción del flujo de trabajo propuesto.

\subsection{Herramientas utilizadas}

[Pendiente: describir GitHub y Overleaf]

\subsection{Flujo de trabajo}

[Pendiente: describir el ciclo de trabajo diario]
```

### Archivo: `sections/results.tex`

```latex
\section{Resultados}

% === MAURICIO: Edita esta sección ===

Este es el texto inicial de resultados.

Mauricio agregará contenido sobre los beneficios observados del flujo de trabajo.

\subsection{Beneficios de la colaboración}

[Pendiente: describir ventajas encontradas]

\subsection{Comparación con métodos tradicionales}

[Pendiente: tabla comparativa]
```

### Archivo: `sections/conclusion.tex`

```latex
\section{Conclusión}

% === PARA DESPUÉS ===

[Esta sección se completará en la Parte 5 del taller]
```

### Archivo: `references.bib`

```bibtex
@article{perez2024github,
  title={GitHub is an effective platform for collaborative and reproducible laboratory research},
  author={P{\'e}rez, Fernando and others},
  journal={arXiv preprint arXiv:2408.09344},
  year={2024}
}

@book{chacon2014pro,
  title={Pro Git},
  author={Chacon, Scott and Straub, Ben},
  year={2014},
  publisher={Apress},
  note={Disponible en \url{https://git-scm.com/book}}
}

@misc{overleaf2024docs,
  title={Overleaf Documentation},
  author={{Overleaf}},
  year={2024},
  howpublished={\url{https://www.overleaf.com/learn}}
}
```

### Subir la estructura a GitHub

Después de crear todos los archivos en el proyecto "Main" de Overleaf:

1. En Overleaf, ir a **Menu** → **GitHub**
2. Click en **"Push Overleaf changes to GitHub"**

<!-- 📸 CAPTURA: Diálogo de Push en Overleaf mostrando el campo para escribir el mensaje de commit y el botón Push -->
![Diálogo Push to GitHub en Overleaf](img/02-overleaf-push-dialog.png)

3. Escribir mensaje: `"Estructura inicial del artículo con secciones asignadas"`
4. Click en **"Push"**

---

## 3.3 Sincronizar y obtener los archivos (José Miguel y Rodrigo)

Ahora que la estructura está en GitHub (`mauricio/articulo`), JM y Rodrigo necesitan traerla a sus forks y proyectos Overleaf.

### Paso 1: Sincronizar el fork en GitHub

1. Ir a su fork en GitHub (ej: `josemiguel/articulo-taller-colaboracion`)
2. Verán un mensaje: **"This branch is X commits behind mauricio:main"**

<!-- 📸 CAPTURA: Fork en GitHub mostrando el menú "Sync fork" con el botón "Update branch" -->
![Menú Sync fork en GitHub con botón Update branch](img/04-github-sync-fork.png)

3. Click en **"Sync fork"** → **"Update branch"**
4. Su fork ahora tiene los mismos archivos que el repositorio principal

### Paso 2: Traer los archivos a Overleaf

1. Abrir su proyecto Overleaf (ej: `Articulo-JM-Workspace`)
2. Ir a **Menu** → **GitHub**
3. Click en **"Pull GitHub changes into Overleaf"**

<!-- 📸 CAPTURA: Diálogo de Pull en Overleaf mostrando los cambios que se van a traer de GitHub -->
![Diálogo Pull from GitHub en Overleaf](img/05-overleaf-pull-dialog.png)

4. Los archivos del artículo aparecerán en su proyecto

### Verificar

- Deberían ver `main.tex`, la carpeta `sections/` con todos los archivos `.tex`, y `references.bib`
- Al compilar, el PDF debería generarse correctamente

---

## 3.4 Cada quien edita su sección (Todos)

Ahora viene la parte práctica. Cada persona edita **en su propio proyecto Overleaf**:

| Persona | Proyecto Overleaf | Archivo a editar | Tarea |
|---------|-------------------|------------------|-------|
| **José Miguel** | Articulo-JM-Workspace | `sections/introduction.tex` | Escribir 2-3 párrafos de introducción |
| **Rodrigo** | Articulo-Rodrigo-Workspace | `sections/methods.tex` | Describir las herramientas y el flujo |
| **Mauricio** | Articulo-Main | `sections/results.tex` | Agregar beneficios y comparación |

> ⚠️ **Nota para Mauricio**: En este ejercicio, Mauricio edita directamente en "Main" para simplificar. En un flujo real, incluso Mauricio debería tener su propio fork/workspace para que sus cambios también pasen por revisión.

### Ejemplo de edición (José Miguel)

José Miguel abre `sections/introduction.tex` en su proyecto Overleaf y lo cambia a:

```latex
\section{Introducción}

La colaboración efectiva es fundamental en la investigación académica moderna. 
Los proyectos de investigación involucran cada vez más a equipos distribuidos 
geográficamente, lo que hace necesario contar con herramientas que faciliten 
el trabajo conjunto.

En particular, la escritura de artículos académicos presenta desafíos únicos: 
múltiples autores necesitan editar el mismo documento, mantener un historial 
de cambios, y asegurar que todos trabajen sobre la versión más reciente.

\subsection{Motivación}

El flujo de trabajo tradicional basado en enviar archivos por correo electrónico 
presenta numerosos problemas: versiones duplicadas, pérdida de cambios, y 
dificultad para rastrear quién modificó qué.

\subsection{Objetivos}

Este artículo presenta un flujo de trabajo colaborativo que combina:
\begin{itemize}
    \item GitHub para control de versiones y revisión
    \item Overleaf para edición y compilación de LaTeX en la nube
\end{itemize}
```

### Ejemplo de edición (Rodrigo)

Rodrigo abre `sections/methods.tex` en su proyecto Overleaf:

```latex
\section{Metodología}

Para este proyecto utilizamos un flujo de trabajo basado en herramientas 
en la nube que permiten la colaboración distribuida en documentos 
académicos escritos en LaTeX.

\subsection{Herramientas utilizadas}

El flujo integra dos herramientas complementarias:
\begin{itemize}
    \item \textbf{Overleaf}: Editor de LaTeX en la nube con compilación instantánea
    \item \textbf{GitHub}: Repositorio compartido con revisión de cambios vía Pull Requests
\end{itemize}

\subsection{Flujo de trabajo}

El ciclo diario de trabajo consiste en:
\begin{enumerate}
    \item Sincronizar el fork con la versión principal (GitHub: Sync fork)
    \item Traer cambios al editor (Overleaf: Pull from GitHub)
    \item Editar y compilar en Overleaf
    \item Subir cambios al fork (Overleaf: Push to GitHub)
    \item Solicitar revisión (GitHub: Pull Request)
\end{enumerate}
```

---

## 3.5 Subir cambios a GitHub (Push)

Cuando terminaron de editar y la compilación funciona correctamente:

### José Miguel (en su Overleaf):

1. Verificar que el PDF compila correctamente
2. Ir a **Menu** → **GitHub**
3. Click en **"Push Overleaf changes to GitHub"**
4. Escribir un mensaje descriptivo: `"Completé la introducción con motivación y objetivos"`
5. Click en **"Push"** (o "Commit")

### Rodrigo (en su Overleaf):

1. Verificar compilación
2. **Menu** → **GitHub** → **"Push Overleaf changes to GitHub"**
3. Mensaje: `"Describí las herramientas y el flujo de trabajo en metodología"`
4. Click en **"Push"**

### Mauricio (en Overleaf "Main"):

1. Verificar compilación
2. **Menu** → **GitHub** → **"Push Overleaf changes to GitHub"**
3. Mensaje: `"Agregué beneficios y comparación en resultados"`
4. Click en **"Push"**

### ¿Qué pasó?

| Persona | Los cambios se subieron a... |
|---------|------------------------------|
| José Miguel | `josemiguel/articulo-taller-colaboracion` (su fork) |
| Rodrigo | `rodrigo/articulo-taller-colaboracion` (su fork) |
| Mauricio | `mauricio/articulo-taller-colaboracion` (directamente a main) |

> Los cambios de JM y Rodrigo están en sus forks, pero **todavía no están en main**. Para eso necesitan crear un Pull Request.

---

## 3.6 Crear Pull Request (José Miguel y Rodrigo)

Un **Pull Request** es una solicitud para integrar los cambios de su fork al repositorio principal.

### Paso 1: Ir a su fork en GitHub

1. Abrir GitHub en el navegador
2. Ir a su fork: `github.com/josemiguel/articulo-taller-colaboracion`
3. Verán un banner: **"This branch is X commit(s) ahead of mauricio:main"**

<!-- 📸 CAPTURA: Fork en GitHub mostrando banner "X commits ahead" con el botón "Contribute" y la opción "Open pull request" -->
![Fork en GitHub con banner de commits ahead y botón Contribute](img/03-github-fork-ahead.png)

4. Click en **"Contribute"** → **"Open pull request"**

### Paso 2: Configurar el Pull Request

| Campo | Qué poner |
|-------|-----------|
| **base repository** | `mauricio/articulo-taller-colaboracion` |
| **base** | `main` |
| **head repository** | `josemiguel/articulo-taller-colaboracion` (su fork) |
| **compare** | `main` |
| **Title** | "Completé la sección de introducción" |
| **Description** | Detalles de qué cambió, por qué, qué issues resuelve |

### Paso 3: Crear el PR

<!-- 📸 CAPTURA: Formulario de creación de Pull Request en GitHub con campos title, description, y la vista del diff abajo -->
![Formulario de creación de Pull Request en GitHub](img/06-github-create-pr.png)

1. Revisar los cambios mostrados (diff) — verificar que son correctos
2. Click en **"Create pull request"**

### Resultado

El PR ahora está visible en el repositorio principal. Los compañeros pueden:
- 👀 Ver los cambios línea por línea
- 💬 Agregar comentarios
- ✅ Aprobar o 🔄 pedir cambios

<!-- 📸 CAPTURA: Vista "Files changed" de un Pull Request mostrando el diff con líneas verdes (agregadas) y rojas (eliminadas) -->
![Vista Files Changed de un PR mostrando el diff](img/07-github-pr-files-changed.png)

> 💡 **En este punto**, los cambios de JM están propuestos pero NO integrados. Veremos la revisión y el merge en la Parte 4.

---

## Resumen del ciclo de trabajo

```
┌─────────────────────────────────────────────────────────────┐
│              CICLO DE TRABAJO (todo en navegador)            │
└─────────────────────────────────────────────────────────────┘

    ┌──────────────────────────────────────┐
    │  1. SYNC: Actualizar fork            │
    │     GitHub → Sync fork →             │
    │     Update branch                    │
    └──────────────────────────────────────┘
                      │
                      ▼
    ┌──────────────────────────────────────┐
    │  2. PULL: Traer a Overleaf           │
    │     Overleaf → Menu → GitHub →       │
    │     Pull from GitHub                 │
    └──────────────────────────────────────┘
                      │
                      ▼
    ┌──────────────────────────────────────┐
    │  3. EDITAR: Trabajar en Overleaf     │
    │     Escribir, compilar, verificar    │
    └──────────────────────────────────────┘
                      │
                      ▼
    ┌──────────────────────────────────────┐
    │  4. PUSH: Subir a GitHub             │
    │     Overleaf → Menu → GitHub →       │
    │     Push to GitHub + mensaje         │
    └──────────────────────────────────────┘
                      │
                      ▼
    ┌──────────────────────────────────────┐
    │  5. PR: Solicitar revisión           │
    │     GitHub fork → Contribute →       │
    │     Open pull request                │
    └──────────────────────────────────────┘
                      │
                      ▼
    ┌──────────────────────────────────────┐
    │  6. REVIEW + MERGE                   │
    │     Compañeros revisan y aprueban    │
    │     Mauricio hace merge              │
    └──────────────────────────────────────┘
```

---

## Checkpoint ✅

Antes de continuar a la Parte 4, verifiquen que:

- [ ] Editaron su sección asignada en su proyecto Overleaf
- [ ] El documento compila correctamente
- [ ] Hicieron Push a GitHub desde Overleaf con un mensaje descriptivo
- [ ] Crearon un Pull Request en GitHub (JM y Rodrigo)
- [ ] Pueden ver sus cambios en la pestaña "Files changed" del PR

---

**Anterior**: [← Parte 2 - Configuración Inicial](../02-configuracion-inicial/README.md)

**Siguiente**: [Parte 4 - Pull Requests, Revisión y Conflictos →](../04_ramas_y_conflictos/README.md)
