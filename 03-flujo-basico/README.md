# Parte 3: Flujo de Trabajo Básico

> **Duración**: 30 minutos  
> **Objetivo**: Dominar el ciclo diario de trabajo: Editar → Commit → Push → Sync

---

## Resumen de esta parte

| Paso | Descripción | Tiempo |
|------|-------------|--------|
| 3.1 | Entender el concepto de "foto" (commit) | 5 min |
| 3.2 | Mauricio crea el archivo inicial en Overleaf | 5 min |
| 3.3 | Todos sincronizan y obtienen el archivo | 3 min |
| 3.4 | Cada quien edita su sección localmente | 10 min |
| 3.5 | Preparar y tomar la foto (add + commit) | 5 min |
| 3.6 | Subir cambios (push) | 2 min |

---

## 3.1 El concepto de "tomarle una foto al proyecto"

En Git, un **commit** es como tomar una **foto instantánea** de su proyecto en un momento específico.

```
📸 Foto 1: "Estructura inicial"
    Estado: main.tex, introduction.tex (vacíos)
    Fecha: 2024-01-15 10:00
    Autor: Mauricio

📸 Foto 2: "Agregué contenido a la introducción"  
    Estado: introduction.tex (con 3 párrafos)
    Fecha: 2024-01-15 11:30
    Autor: José Miguel

📸 Foto 3: "Completé la metodología"
    Estado: methods.tex (con contenido)
    Fecha: 2024-01-15 12:00
    Autor: Rodrigo
```

### ¿Por qué es útil?

- **Historial completo**: Pueden ver exactamente qué cambió, cuándo y quién lo hizo
- **Máquina del tiempo**: Pueden volver a cualquier foto anterior si algo sale mal
- **Propuestas de versión**: Pueden tener diferentes "álbumes" (ramas) con versiones alternativas del artículo

### Buenas prácticas para commits

| ✅ Hacer | ❌ Evitar |
|----------|----------|
| Commits pequeños y frecuentes | Un solo commit gigante con todo |
| Mensajes descriptivos: "Agregué análisis de resultados" | Mensajes vagos: "cambios" o "asdf" |
| Un commit por idea/tarea completada | Mezclar cambios no relacionados |

---

## 3.2 Archivo inicial del artículo (Mauricio)

> **Mauricio**: Copien este contenido y péguenlo en su proyecto de Overleaf.

### Estructura de archivos a crear

```
articulo-taller-colaboracion/
├── main.tex                 ← Archivo principal
├── sections/
│   ├── introduction.tex     ← José Miguel editará esto
│   ├── methods.tex          ← Rodrigo editará esto
│   ├── results.tex          ← Mauricio editará esto
│   └── conclusion.tex       ← Para después
├── references.bib           ← Bibliografía
└── .gitignore               ← Ignorar archivos auxiliares
```

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
\title{Artículo de Práctica: Colaboración con Git y LaTeX}
\author{
    Mauricio\textsuperscript{1} \and 
    José Miguel\textsuperscript{1} \and 
    Rodrigo\textsuperscript{1}
}
\date{\today}

\begin{document}

\maketitle

\begin{abstract}
Este documento es un ejercicio práctico para aprender a colaborar en artículos académicos usando Git, GitHub, Overleaf y VS Code. Cada autor contribuirá una sección diferente.
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

[Pendiente: describir Git, GitHub, Overleaf, VS Code]

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

### Archivo: `.gitignore`

```
# Archivos auxiliares de LaTeX
*.aux
*.log
*.out
*.toc
*.lof
*.lot
*.bbl
*.blg
*.synctex.gz
*.fdb_latexmk
*.fls

# Archivos de respaldo
*.bak
*~

# Carpeta de output de algunos editores
output/

# Archivos del sistema
.DS_Store
Thumbs.db
```

---

## 3.3 Sincronizar y obtener el archivo (Todos)

Una vez que Mauricio ha creado los archivos en Overleaf y los ha subido a GitHub:

### Mauricio: Subir cambios de Overleaf a GitHub

1. En Overleaf, ir a **Menu** → **GitHub**
2. Click en **"Push Overleaf changes to GitHub"**
3. Escribir un mensaje: "Estructura inicial del artículo"
4. Click en **"Push"**

### José Miguel y Rodrigo: Obtener los archivos

En la terminal (dentro de la carpeta del proyecto):

```bash
git pull origin main
```

**Verificar** que llegaron los archivos:

```bash
ls sections/
```

Deberían ver: `introduction.tex  methods.tex  results.tex  conclusion.tex`

---

## 3.4 Cada quien edita su sección (Todos)

Ahora viene la parte práctica. Cada persona editará **localmente** en VS Code:

| Persona | Archivo a editar | Tarea |
|---------|------------------|-------|
| **José Miguel** | `sections/introduction.tex` | Escribir 2-3 párrafos de introducción |
| **Rodrigo** | `sections/methods.tex` | Describir las herramientas y el flujo |
| **Mauricio** | `sections/results.tex` | Agregar beneficios y una tabla comparativa |

### Instrucciones para todos:

1. Abran VS Code con el proyecto
2. Naveguen a su archivo en el panel izquierdo (Explorer)
3. Hagan sus ediciones
4. Guarden frecuentemente (`Ctrl+S` / `Cmd+S`) para ver el PDF actualizado
5. Cuando terminen, **no cierren VS Code** — continuaremos con el commit

### Ejemplo de edición (José Miguel)

José Miguel abre `sections/introduction.tex` y lo cambia a:

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
    \item Git para control de versiones
    \item GitHub para almacenamiento y revisión
    \item Overleaf para compilación en la nube
    \item VS Code para edición local eficiente
\end{itemize}
```

### Ejemplo de edición (Rodrigo)

Rodrigo abre `sections/methods.tex` y lo cambia a:

```latex
\section{Metodología}

Para este proyecto utilizamos un flujo de trabajo basado en herramientas 
de código abierto que permiten la colaboración distribuida en documentos 
académicos escritos en LaTeX.

\subsection{Herramientas utilizadas}

El flujo integra cuatro herramientas complementarias:
\begin{itemize}
    \item \textbf{Git}: Control de versiones local
    \item \textbf{GitHub}: Repositorio remoto compartido
    \item \textbf{Overleaf}: Compilación LaTeX en la nube
    \item \textbf{VS Code}: Editor local con vista previa de PDF
\end{itemize}

\subsection{Flujo de trabajo}

El ciclo diario de trabajo consiste en:
\begin{enumerate}
    \item Obtener cambios recientes (\texttt{git pull})
    \item Editar localmente en VS Code
    \item Preparar y guardar avances (\texttt{git add} + \texttt{git commit})
    \item Compartir cambios (\texttt{git push})
    \item Verificar en Overleaf (ocasionalmente)
\end{enumerate}
```

### Ejemplo de edición (Mauricio)

Mauricio abre `sections/results.tex` y lo cambia a:

```latex
\section{Resultados}

Implementamos el flujo de trabajo propuesto durante el desarrollo de este 
artículo. A continuación presentamos los resultados observados.

\subsection{Beneficios de la colaboración}

Durante las dos horas del taller, el equipo logró:
\begin{itemize}
    \item Configurar un entorno de trabajo compartido
    \item Realizar múltiples contribuciones en paralelo
    \item Mantener un historial completo de cambios
\end{itemize}

\subsection{Comparación con métodos tradicionales}

El flujo basado en Git ofrece control de versiones intencional, historial 
completo y trabajo simultáneo, a diferencia del enfoque tradicional basado 
en enviar archivos por correo electrónico.
```

---

## 3.5 Preparar y tomar la foto (git add + git commit)

> ⚠️ **CONCEPTO IMPORTANTE**: Esta sección explica cómo controlar exactamente qué archivos incluir en cada "foto".

### El proceso de dos pasos

```
┌─────────────────────────────────────────────────────────────┐
│  Su carpeta de trabajo (Working Directory)                  │
│                                                              │
│  📄 introduction.tex  [MODIFICADO]                          │
│  📄 methods.tex       [MODIFICADO]                          │
│  📄 notas-personales.txt [NUEVO - en .gitignore, ignorado] │
│  📄 borrador-idea.tex    [NUEVO - todavía no está listo]    │
└─────────────────────────────────────────────────────────────┘
                            │
                            │ git add introduction.tex
                            │ (o git add . si notas-personales
                            │  ya está en .gitignore)
                            ▼
┌─────────────────────────────────────────────────────────────┐
│  Área de preparación (Staging Area)                         │
│                                                              │
│  📄 introduction.tex  ← Listo para la foto                  │
└─────────────────────────────────────────────────────────────┘
                            │
                            │ git commit -m "mensaje"
                            ▼
┌─────────────────────────────────────────────────────────────┐
│  Historial de Git (Repository)                              │
│                                                              │
│  📸 "Completé la introducción" ← Nueva foto guardada        │
└─────────────────────────────────────────────────────────────┘
```

> 💡 **Sobre archivos personales en VS Code**: Es completamente normal y recomendable tener archivos personales (notas, borradores, ideas) en su carpeta de trabajo local. La clave es usar `.gitignore` para que Git los ignore automáticamente. De esta forma, pueden organizar todo su trabajo en un solo lugar sin riesgo de subir archivos privados al repositorio compartido.

### Regla de oro sobre `git add`

> **Cualquier archivo NUEVO que quieran compartir, deben agregarlo explícitamente con `git add`.**
> 
> Los archivos que **nunca** quieran compartir, agréguenlos al `.gitignore` desde el momento en que los crean. Los archivos que todavía no estén listos, simplemente **no les hagan `git add`** hasta que lo estén.

### Ejemplo concreto: José Miguel

José Miguel editó `introduction.tex` y también creó un archivo de notas personales que NO quiere subir:

```bash
# Ver qué archivos cambiaron
git status
```

Salida:
```
On branch main
Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
        modified:   sections/introduction.tex

Untracked files:
  (use "git add <file>..." to include in what will be committed)
        mis-notas-personales.txt
```

### Ejemplo concreto: Rodrigo

Rodrigo editó `methods.tex`:

```bash
git status
```

Salida:
```
On branch main
Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
        modified:   sections/methods.tex
```

```bash
git add sections/methods.tex
git commit -m "Describí las herramientas y el flujo de trabajo en metodología"
```

### Ejemplo concreto: Mauricio

Mauricio editó `results.tex`:

```bash
git status
```

Salida:
```
On branch main
Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
        modified:   sections/results.tex
```

```bash
git add sections/results.tex
git commit -m "Agregué beneficios y comparación en resultados"
```

### Formas de usar `git add`

#### Opción 1: Agregar UN archivo específico (RECOMENDADO para empezar)

```bash
# Solo agregar el archivo que quiero compartir
git add sections/introduction.tex
```

**Resultado**: Solo `introduction.tex` está preparado. `mis-notas-personales.txt` NO se subirá.

#### Opción 2: Agregar TODOS los archivos modificados y nuevos

```bash
# ⚠️ CUIDADO: Esto agrega TODO
git add .
```

**Resultado**: Tanto `introduction.tex` como `mis-notas-personales.txt` quedan preparados.

#### Opción 3: Agregar varios archivos específicos

```bash
# Agregar múltiples archivos por nombre
git add sections/introduction.tex sections/methods.tex
```

#### Opción 4: Usar `.gitignore` + `git add .` (RECOMENDADO para el día a día)

Si saben de antemano que ciertos archivos **nunca** deben subirse (notas personales, borradores privados, archivos temporales), pueden agregarlos al archivo `.gitignore` **antes** de usar `git add .`:

```bash
# Paso 1: Agregar el archivo a .gitignore
echo "mis-notas-personales.txt" >> .gitignore
```

O abrir `.gitignore` en VS Code y agregar la línea manualmente:

```
# Archivos personales que no quiero compartir
mis-notas-personales.txt
borradores-privados/
```

```bash
# Paso 2: Ahora git add . ignora automáticamente esos archivos
git add .
```

**Resultado**: `introduction.tex` y `.gitignore` quedan preparados. `mis-notas-personales.txt` es **ignorado automáticamente** y nunca será rastreado por Git.

> 💡 **Consejo**: Si desde que crean un archivo personal saben que nunca lo van a compartir, agréguenlo al `.gitignore` inmediatamente. Así pueden usar `git add .` con confianza sin preocuparse por subir cosas que no quieren.

> 🔍 **¿Se les ocurren más formas de usar `git add`?** Seguro se puede. Están a un prompt de distancia de descubrir cómo hacerlo. Pregúntenle a su LLM de preferencia: *"¿Cómo puedo agregar solo archivos .tex con git add?"* o *"¿Cómo agrego todos los archivos excepto uno?"* — Git es muy flexible y hay muchas formas de controlar exactamente qué incluir.

### ¿Qué pasa si usaron `git add .` por error?

Si agregaron un archivo que no querían compartir, pueden **quitarlo del área de preparación** (sin perder sus cambios):

```bash
# "Des-trackear" un archivo antes de hacer commit
git restore --staged mis-notas-personales.txt
```

Ahora ese archivo ya no está preparado y no se incluirá en el commit.

### Verificar qué está preparado

```bash
git status
```

Salida después de agregar solo `introduction.tex`:
```
On branch main
Changes to be committed:
  (use "git restore --staged <file>..." to unstage)
        modified:   sections/introduction.tex

Untracked files:
  (use "git add <file>..." to include in what will be committed)
        mis-notas-personales.txt
```

✅ Solo `introduction.tex` se incluirá en el commit.

### Tomar la foto (commit)

```bash
git commit -m "Completé la sección de introducción con motivación y objetivos"
```

**Buenas prácticas para mensajes de commit:**
- Usar verbos en pasado o infinitivo: "Agregué...", "Corregí...", "Agregar..."
- Ser específico: qué sección, qué cambio principal
- Máximo 50-72 caracteres en la primera línea

---

## 3.6 Subir cambios a GitHub (git push)

Una vez que hiciste commit, los cambios están guardados **localmente**. Para compartirlos:

```bash
git push origin main
```

> 📌 **Nota sobre ramas**: En esta parte del taller, todos trabajan directamente sobre `main` porque cada quien edita un archivo diferente (sin riesgo de conflictos). En la **[Parte 4](../04_ramas_y_conflictos/README.md)**, aprenderán a trabajar en **ramas individuales** y usar **Pull Requests** para un flujo más profesional donde los cambios se revisan antes de integrarse a `main`. Si en algún momento al hacer `git push` surgen problemas inesperados, la Parte 4 también cubre cómo resolver conflictos.

### Si alguien más subió cambios antes que ustedes

Git les dirá que primero deben bajar los cambios de los demás:

```bash
# Primero, obtener los cambios de otros
git pull origin main

# Luego, subir los tuyos
git push origin main
```

### Verificar en GitHub

1. Vayan a su repositorio en GitHub
2. Deberían ver su commit reciente en la lista
3. Click en el commit para ver exactamente qué cambió

---

## 3.7 Verificación final: Sincronizar Overleaf (Mauricio)

Después de que todos hayan subido sus cambios a GitHub y se hayan integrado en `main`:

> 💡 Este es el **último paso** del flujo: Local → GitHub → **Overleaf**. Solo se sincroniza una vez que los cambios ya están en `main`.

1. En Overleaf, ir a **Menu** → **GitHub**
2. Click en **"Pull GitHub changes into Overleaf"**
3. Overleaf descargará todos los cambios de José Miguel y Rodrigo
4. Compilar para verificar que todo funciona junto en la nube

---

## Resumen del ciclo de trabajo

```
┌─────────────────────────────────────────────────────────────┐
│                  CICLO DIARIO DE TRABAJO                     │
└─────────────────────────────────────────────────────────────┘

    ┌──────────────────────────────────────┐
    │  1. INICIO: Obtener cambios recientes │
    │     git pull origin main              │
    └──────────────────────────────────────┘
                      │
                      ▼
    ┌──────────────────────────────────────┐
    │  2. TRABAJAR: Editar en VS Code       │
    │     - Guardar frecuentemente (Ctrl+S) │
    │     - Ver PDF actualizado             │
    └──────────────────────────────────────┘
                      │
                      ▼
    ┌──────────────────────────────────────┐
    │  3. PREPARAR: Elegir qué compartir    │
    │     git add archivo.tex               │
    │     (o git add . para todo)           │
    └──────────────────────────────────────┘
                      │
                      ▼
    ┌──────────────────────────────────────┐
    │  4. FOTO: Guardar el avance           │
    │     git commit -m "descripción"       │
    └──────────────────────────────────────┘
                      │
                      ▼
    ┌──────────────────────────────────────┐
    │  5. COMPARTIR: Subir a GitHub         │
    │     git push origin main              │
    └──────────────────────────────────────┘
                      │
                      ▼
    ┌──────────────────────────────────────┐
    │  6. VERIFICAR: Sincronizar Overleaf   │
    │     (Mauricio: Pull from GitHub)      │
    └──────────────────────────────────────┘
```

---

## Comandos rápidos de referencia

| Qué quiero hacer | Comando |
|------------------|---------|
| Ver estado actual | `git status` |
| Obtener cambios de otros | `git pull origin main` |
| Agregar UN archivo | `git add ruta/archivo.tex` |
| Agregar TODOS los cambios | `git add .` |
| Ignorar un archivo permanentemente | Agregar al `.gitignore` |
| Quitar archivo del staging | `git restore --staged archivo.tex` |
| Tomar la foto | `git commit -m "mensaje"` |
| Subir mis cambios | `git push origin main` |
| Ver historial de fotos | `git log --oneline` |

---

## Checkpoint ✅

Antes de continuar a la Parte 4, verifiquen que:

- [ ] Entienden la diferencia entre `git add archivo.tex` y `git add .`
- [ ] Saben cómo usar `.gitignore` para excluir archivos personales
- [ ] Saben cómo quitar un archivo del staging si lo agregaron por error
- [ ] Hicieron al menos un commit con sus cambios
- [ ] Subieron sus cambios a GitHub con `git push`
- [ ] Pueden ver sus cambios en la página de GitHub

---

**Anterior**: [← Parte 2 - Configuración Inicial](../02-configuracion-inicial/README.md)

**Siguiente**: [Parte 4 - Ramas y Conflictos →](../04_ramas_y_conflictos/README.md)
