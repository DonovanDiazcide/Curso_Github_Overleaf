# Módulo 06: Automatización y Buenas Prácticas (Gentzkow & Shapiro)

## ¿De qué se trata este módulo?

En los módulos anteriores aprendiste a usar Git, GitHub, VS Code y Overleaf
para escribir artículos en LaTeX. Ahora vamos a integrar un conjunto de
**buenas prácticas de ingeniería de software** que harán tu flujo de trabajo
más robusto, reproducible y profesional.

Estas prácticas vienen de la guía *"Code and Data for the Social Sciences"*
de Matthew Gentzkow y Jesse M. Shapiro (2014), dos economistas de Stanford
que las desarrollaron después de años de experiencia con proyectos de
investigación.

> **Idea central:** Si tu proyecto de investigación no se puede reproducir
> con un solo comando, algo está mal.

---

## Los 7 principios y cómo aplicarlos

### Principio 1: Automatización (Capítulo 2 de G&S)

**La regla:** *"Automate everything that can be automated."*

**El problema:** Compilar un artículo en LaTeX requiere varios pasos:
`pdflatex` → `bibtex` → `pdflatex` → `pdflatex`. Si olvidas un paso,
las citas o referencias cruzadas no se resuelven.

**La solución:** Un script que lo hace todo con un solo comando.

#### En Mac/Linux

```bash
# Desde la carpeta del artículo:
make
```

#### En Windows

```cmd
:: Desde la carpeta del artículo:
scripts\compilar.bat
```

#### ¿Qué hace internamente?

1. Ejecuta `pdflatex` (primera pasada — genera el archivo .aux)
2. Ejecuta `bibtex` (resuelve las citas bibliográficas)
3. Ejecuta `pdflatex` (segunda pasada — incorpora la bibliografía)
4. Ejecuta `pdflatex` (tercera pasada — resuelve todas las referencias)
5. Copia el PDF final a la carpeta `output/`

Nunca más tendrás que recordar esta secuencia.

---

### Principio 2: Control de versiones (Capítulo 3 de G&S)

**La regla:** *"Run the whole directory before checking it back in."*

**El problema:** Subiste cambios a GitHub pero tu LaTeX tenía un error.
Ahora tus coautores no pueden compilar el documento.

**La solución:** Verificar ANTES de hacer commit.

```bash
# Paso 1: Verificar que todo compile
make check

# Si ves "✓ Documento compila correctamente":
git add -A
git commit -m "Agregar sección de resultados"
git push origin main
```

**Regla de oro:** Nunca hagas `git push` sin antes ejecutar `make check`.

---

### Principio 3: Directorios (Capítulo 4 de G&S)

**La regla:** *"Separate files into inputs and outputs."*

**El problema:** Tu carpeta tiene 47 archivos mezclados: `.tex`, `.pdf`,
`.aux`, `.log`, `.bbl`... No sabes cuáles son importantes y cuáles se
pueden borrar.

**La solución:** Separar por función.

```
articulo-plantilla/
├── main.tex            ← ENTRADA: archivo principal
├── references.bib      ← ENTRADA: bibliografía
├── Makefile            ← ENTRADA: instrucciones de compilación
├── sections/           ← ENTRADA: contenido del artículo
│   ├── introduction.tex
│   ├── related-work.tex
│   ├── methods.tex
│   ├── results.tex
│   └── conclusion.tex
├── figures/            ← ENTRADA: imágenes
├── scripts/            ← ENTRADA: scripts de automatización
│   ├── compilar.bat    (Windows)
│   └── compilar.sh     (Mac/Linux)
├── output/             ← SALIDA: PDF final (NO en Git)
└── temp/               ← TEMPORAL: archivos auxiliares (NO en Git)
```

**Reglas:**
- Los archivos de **entrada** (tu código) van en Git
- Los archivos de **salida** (el PDF) NO van en Git — se regeneran con `make`
- Los archivos **temporales** (.aux, .log) NO van en Git — se regeneran con `make`

El archivo `.gitignore` se encarga de esto automáticamente.

---

### Principio 4: Claves únicas (Capítulo 5 de G&S)

**La regla:** *"Store cleaned data in tables with unique, non-missing keys."*

En LaTeX, esto se traduce a **etiquetas consistentes**.

**Convención para `\label{}`:**

| Tipo | Formato | Ejemplo |
|------|---------|---------|
| Sección | `sec:nombre-seccion` | `\label{sec:introduccion}` |
| Figura | `fig:nombre-figura` | `\label{fig:diagrama-flujo}` |
| Tabla | `tab:nombre-tabla` | `\label{tab:mapeo-gs}` |
| Ecuación | `eq:nombre-ecuacion` | `\label{eq:regresion-base}` |

**Convención para claves de BibTeX:**

```
apellido_primer_autor + año + primera_palabra_titulo
```

Ejemplo: `gentzkow2014code`, `chacon2014pro`, `perez2024github`

---

### Principio 5: Abstracción (Capítulo 6 de G&S)

**La regla:** *"Abstract to eliminate redundancy."*

**El problema:** Escribiste `\textbf{Git}` 30 veces en tu artículo.
Ahora quieres cambiar el formato a versalitas. Tienes que buscar y
reemplazar 30 veces, rezando por no olvidar ninguna.

**La solución:** Definir comandos reutilizables en `main.tex`:

```latex
% Definir UNA vez:
\newcommand{\herramienta}[1]{\textbf{#1}}

% Usar en todo el documento:
\herramienta{Git}
\herramienta{GitHub}
\herramienta{Overleaf}
```

Si decides cambiar el formato, modificas UNA línea:

```latex
\newcommand{\herramienta}[1]{\textsc{#1}}  % Ahora en versalitas
```

Los comandos definidos en la plantilla son:

| Comando | Propósito | Ejemplo |
|---------|-----------|---------|
| `\herramienta{Git}` | Nombres de herramientas | **Git** |
| `\comando{git push}` | Comandos de terminal | `git push` |
| `\archivo{main.tex}` | Nombres de archivo | `main.tex` |
| `\principio{Automatización}` | Principios G&S | AUTOMATIZACIÓN |
| `\gs` | Referencia al artículo | Gentzkow y Shapiro (2014) |

---

### Principio 6: Documentación (Capítulo 7 de G&S)

**La regla:** *"Don't write documentation you will not maintain."*

**El problema:** Escribiste un README de 5 páginas explicando cada archivo.
Seis meses después, la estructura cambió y el README ya no corresponde
a la realidad.

**La solución:** Código auto-documentado.

**Malo** (comenta QUÉ hace, no POR QUÉ):
```latex
% Cargar el paquete graphicx
\usepackage{graphicx}
% Establecer la ruta de figuras
\graphicspath{{figures/}}
```

**Bueno** (comenta POR QUÉ, o no comenta si es obvio):
```latex
% Rutas portables: las figuras se referencian sin ruta absoluta (G&S Cap. 4)
\usepackage{graphicx}
\graphicspath{{figures/}}
```

**Aún mejor** (el código se explica solo):
```latex
\usepackage{graphicx}
\graphicspath{{figures/}}
```

Si el nombre de la carpeta ya dice que contiene figuras, el comentario
es redundante.

---

### Principio 7: Gestión de proyectos (Capítulo 8 de G&S)

**La regla:** *"Email is not a task management system."*

**El problema:** Le mandaste un correo a tu coautor diciendo "revisa la
sección 3". Tres semanas después ninguno de los dos recuerda si se hizo.

**La solución:** GitHub Issues.

#### Crear una tarea (Issue)

1. Ve a tu repositorio en GitHub
2. Click en la pestaña **Issues**
3. Click en **New issue**
4. Escribe un título claro: "Revisar sección de metodología"
5. En la descripción, detalla qué se necesita
6. Asigna un responsable (Assignees)
7. Click en **Submit new issue**

#### Cerrar una tarea al hacer commit

Cuando termines la tarea, referencia el Issue en tu mensaje de commit:

```bash
git commit -m "Reescribir sección de metodología. Closes #3"
```

GitHub cerrará automáticamente el Issue #3. Así, el historial de tareas
queda vinculado al historial de cambios.

---

## Ejercicio práctico

### Paso 1: Configurar el proyecto

```bash
# Clonar el repositorio
git clone https://github.com/TU-USUARIO/TU-REPO.git
cd TU-REPO

# Verificar la estructura
ls articulo-plantilla/
```

### Paso 2: Compilar por primera vez

```bash
cd articulo-plantilla

# Mac/Linux:
make

# Windows:
scripts\compilar.bat
```

Verifica que se generó `output/main.pdf`.

### Paso 3: Hacer un cambio y verificar

1. Abre `sections/introduction.tex` en VS Code
2. Agrega una oración al final de la introducción
3. Guarda el archivo
4. Ejecuta `make check`
5. Si dice "✓", haz commit y push:

```bash
git add sections/introduction.tex
git commit -m "Agregar contexto a la introducción"
git push origin main
```

### Paso 4: Crear un Issue en GitHub

1. Ve a GitHub → Issues → New issue
2. Título: "Completar sección de resultados"
3. Descripción: "Agregar tabla comparativa de flujos de trabajo"
4. Asigna a un compañero

### Paso 5: Resolver el Issue

1. Tu compañero edita `sections/results.tex`
2. Ejecuta `make check`
3. Hace commit con referencia al Issue:
   ```bash
   git commit -m "Agregar tabla comparativa. Closes #1"
   ```
4. Hace push

---

## Guías por participante

### Mauricio (Windows, principiante)

Tu flujo diario:
1. Abre **Git Bash** (no CMD ni PowerShell)
2. `cd` a la carpeta del repositorio
3. `git pull origin main` (obtener cambios)
4. Abre VS Code y edita
5. En Git Bash: `scripts/compilar.bat` para compilar
6. `make check` para verificar (o usa Git Bash con `make`)
7. `git add`, `git commit`, `git push`

**Consejo:** Si `make` no funciona en CMD, usa Git Bash que incluye
herramientas Unix.

### José Miguel (Windows, intermedio)

Tu flujo diario:
1. Terminal integrada de VS Code
2. `git pull origin main`
3. Edita en VS Code con LaTeX Workshop
4. La extensión compila automáticamente al guardar
5. Antes de push: `make check` en terminal
6. `git add`, `git commit -m "mensaje descriptivo"`, `git push`

**Consejo:** Configura un atajo en VS Code para ejecutar `make check`.

### Rodrigo (Mac, avanzado)

Tu flujo diario:
1. Terminal: `git pull origin main`
2. Edita en VS Code o tu editor preferido
3. `make` para compilar, `make view` para ver el PDF
4. `make check` antes de commit
5. `git add`, `git commit`, `git push`

**Consejo avanzado:** Puedes crear un pre-commit hook:
```bash
# .git/hooks/pre-commit
#!/bin/bash
make check
```
Después hazlo ejecutable:
```bash
chmod +x .git/hooks/pre-commit
```
Esto ejecuta `make check` automáticamente cada vez que haces commit.
Si falla, el commit se cancela.

---

## Referencia rápida

| Acción | Comando |
|--------|---------|
| Compilar todo | `make` |
| Verificar antes de commit | `make check` |
| Limpiar temporales | `make clean` |
| Limpiar todo | `make veryclean` |
| Ver el PDF | `make view` |
| Compilar en Windows | `scripts\compilar.bat` |
| Verificar en Windows | `scripts\compilar.bat check` |
