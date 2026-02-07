# Parte 6: Principios de Código y Datos (Code and Data)

> **Duración**: 45 minutos  
> **Objetivo**: Integrar las mejores prácticas de gestión de código y datos al flujo de trabajo colaborativo  
> **Referencia**: Gentzkow, M. & Shapiro, J. M. (2014). *"Code and Data for the Social Sciences: A Practitioner's Guide"*

---

## ¿Por qué necesitamos estos principios?

En las Partes 1–5 aprendimos a usar Git, GitHub, Overleaf y VS Code para colaborar. Eso es como aprender a conducir un auto. Pero conducir bien no es suficiente: también necesitas saber **hacia dónde vas**, **cómo organizar la carga** y **mantener el auto en buen estado**.

### Analogía: El escritorio desordenado

Imagina dos oficinas:

```
❌ Oficina caótica                          ✅ Oficina organizada
┌───────────────────────────┐              ┌───────────────────────────┐
│ datos_final_v3_FINAL.csv  │              │ datos/                    │
│ analisis.do               │              │   crudos/encuesta.csv     │
│ analisis_copia.do         │              │   limpios/encuesta_clean  │
│ articulo_v5_final.tex     │              │ codigo/                   │
│ figura1_viejo.png         │              │   01_limpiar.py           │
│ figura1_nuevo.png         │              │   02_analizar.py          │
│ notas_para_mi.txt         │              │ resultados/figuras/       │
│ TODO_urgente.docx         │              │ documentos/articulo.tex   │
│ ???                       │              │ README.md                 │
└───────────────────────────┘              └───────────────────────────┘
```

¿En cuál oficina te gustaría trabajar? ¿En cuál podrías retomar tu proyecto después de 6 meses y entender qué hiciste?

El artículo *"Code and Data for the Social Sciences"* de **Gentzkow y Shapiro** es la guía de referencia que usan los mejores departamentos de economía y ciencias sociales del mundo para organizar sus proyectos. En esta parte, vamos a aplicar sus **7 principios fundamentales** a nuestro flujo de trabajo.

> 💡 **¿Por qué importa esto?** Puedes saber usar Git perfectamente, pero si tus archivos están desordenados, tus datos mal documentados y tu código no es reproducible, el proyecto será un dolor de cabeza para ti y para tus colaboradores.

---

## Resumen de esta parte

| Sección | Tema | Tiempo |
|---------|------|--------|
| 6.1 | Automatización: "Un solo comando para todo" | 8 min |
| 6.2 | Control de Versiones (integración con el flujo existente) | 5 min |
| 6.3 | Estructura de Directorios: "Un lugar para cada cosa" | 8 min |
| 6.4 | Llaves (Keys): Identificadores únicos para datos | 5 min |
| 6.5 | Abstracción: "No te repitas" (DRY) | 7 min |
| 6.6 | Documentación: "Explica todo como si fueras a olvidarlo" | 7 min |
| 6.7 | Gestión de Tareas: "Divide y vencerás" | 5 min |

---

## 6.1 Automatización: "Un solo comando para todo"

### El principio

> *"Automate everything that can be automated."*  
> — Gentzkow & Shapiro (2014)

La idea central es simple: **todo el camino desde los datos crudos hasta el documento final debería ejecutarse con un solo comando**. Nada de abrir programas a mano, copiar resultados, pegar tablas ni compilar archivos uno por uno.

¿Por qué? Porque cada paso manual es una oportunidad para cometer un error. Si tu flujo requiere 15 pasos manuales, tarde o temprano vas a olvidar uno, ejecutarlos en el orden incorrecto, o usar la versión equivocada de un archivo.

```
❌ Proceso manual (propenso a errores)

  1. Abrir Excel → limpiar datos a mano
  2. Abrir Stata → correr regresión
  3. Copiar tabla al Word
  4. Abrir R → generar gráficas
  5. Guardar gráficas en carpeta (¿cuál?)
  6. Abrir LaTeX → insertar figuras
  7. Compilar PDF manualmente
  8. Rezar para que todo esté actualizado 🙏

✅ Proceso automatizado

  1. Ejecutar: make
  2. Listo ✓
```

### ¿Qué significa esto en la práctica?

Un **Makefile** (o un script equivalente) es un archivo que define las instrucciones para ejecutar tu proyecto completo. Funciona como una receta de cocina: le dices al computador "haz todo esto en este orden".

El flujo automatizado se ve así:

```
  datos crudos ──→ script limpieza ──→ datos limpios
                                            │
                                            ▼
                                     script análisis
                                            │
                              ┌─────────────┼─────────────┐
                              ▼             ▼             ▼
                          figuras/      tablas/      estimaciones
                              │             │             │
                              └──────┬──────┘─────────────┘
                                     ▼
                               articulo.tex ──→ articulo.pdf
```

### Tutorial: Tu primer Makefile para LaTeX

Un **Makefile** es un archivo de texto (sin extensión) que le dice al comando `make` qué hacer. Vamos a crear uno paso a paso para compilar nuestro artículo en LaTeX.

**Paso 1: Crear el archivo Makefile**

En la raíz de tu proyecto (por ejemplo, dentro de `plantilla-articulo/`), crea un archivo llamado `Makefile` (sin extensión, con M mayúscula):

<details>
<summary><strong>🪟 Windows (Git Bash o WSL)</strong></summary>

```bash
# Navega a la carpeta del proyecto
cd plantilla-articulo/

# Crea el Makefile con Git Bash
touch Makefile
```

> ⚠️ **Importante en Windows**: Usa Git Bash o WSL, no el CMD. El comando `make` no viene instalado por defecto en Windows. Para instalarlo:
> - **WSL** (recomendado): `sudo apt install make`
> - **Chocolatey**: `choco install make` (desde una terminal con permisos de administrador)

</details>

<details>
<summary><strong>🍎 macOS / Linux</strong></summary>

```bash
# Navega a la carpeta del proyecto
cd plantilla-articulo/

# Crea el Makefile
touch Makefile
```

> En macOS, `make` ya viene instalado con las herramientas de línea de comandos de Xcode. Si no lo tienes: `xcode-select --install`

</details>

**Paso 2: Escribir el contenido del Makefile**

Abre `Makefile` en VS Code y escribe lo siguiente:

```makefile
# Makefile para compilar artículo LaTeX
# Uso: ejecuta "make" en la terminal

# Nombre del archivo principal (sin extensión .tex)
MAIN = main

# Comando de compilación LaTeX (pdflatex viene con TeX Live / MiKTeX)
LATEX = pdflatex
BIBTEX = bibtex

# ── Regla principal ──────────────────────────────────────────
# "make" o "make all" ejecuta esto
all: $(MAIN).pdf

# ── Compilar el PDF ──────────────────────────────────────────
# Se ejecuta pdflatex dos veces para resolver referencias cruzadas
$(MAIN).pdf: $(MAIN).tex
	$(LATEX) $(MAIN).tex
	$(BIBTEX) $(MAIN) || true
	@# Si no hay bibliografía, BibTeX falla sin consecuencias.
	@# Si sí hay .bib y tiene errores, pdflatex los reportará abajo.
	$(LATEX) $(MAIN).tex
	$(LATEX) $(MAIN).tex

# ── Limpiar archivos temporales ──────────────────────────────
# "make clean" borra los archivos auxiliares que genera LaTeX
clean:
	rm -f $(MAIN).aux $(MAIN).bbl $(MAIN).blg $(MAIN).log \
	      $(MAIN).out $(MAIN).toc $(MAIN).fdb_latexmk \
	      $(MAIN).fls $(MAIN).synctex.gz

# ── Limpiar todo (incluido el PDF) ──────────────────────────
# "make distclean" borra TODO lo generado
distclean: clean
	rm -f $(MAIN).pdf

# ── Declarar que estos nombres no son archivos ───────────────
.PHONY: all clean distclean
```

> ⚠️ **MUY IMPORTANTE**: Las líneas indentadas dentro de cada regla **deben usar tabuladores (Tab), NO espacios**. Esto es un requisito de Makefiles. En VS Code puedes verificar esto mirando la esquina inferior derecha donde dice "Spaces" o "Tab Size".

**Paso 3: Usar el Makefile**

```bash
# Compilar el artículo (genera el PDF)
make

# Si quieres limpiar archivos temporales
make clean

# Si quieres borrar todo y empezar de cero
make distclean
```

### Tutorial: Script de limpieza de datos (ejemplo con Python)

Supongamos que tienes datos de una encuesta en un archivo CSV y necesitas limpiarlos antes de analizarlos. En lugar de hacerlo a mano en Excel, escribe un script:

**Archivo: `codigo/01_limpiar_datos.py`**

```python
"""
Script para limpiar datos de encuesta.
Entrada: datos/crudos/encuesta_raw.csv
Salida:  datos/limpios/encuesta_clean.csv

Autor: [Tu nombre]
Fecha: [Fecha de creación]
"""

import pandas as pd

# ── Cargar datos crudos ──────────────────────────────────────
df = pd.read_csv("datos/crudos/encuesta_raw.csv")

# ── Limpieza ─────────────────────────────────────────────────
# Eliminar filas con valores faltantes en la variable principal
df = df.dropna(subset=["ingreso"])

# Renombrar columnas a español para consistencia
df = df.rename(columns={
    "income": "ingreso",
    "age": "edad",
    "education": "educacion"
})

# Filtrar observaciones válidas (edad entre 18 y 65)
df = df[(df["edad"] >= 18) & (df["edad"] <= 65)]

# ── Guardar datos limpios ────────────────────────────────────
df.to_csv("datos/limpios/encuesta_clean.csv", index=False)

print(f"Datos limpios guardados: {len(df)} observaciones")
```

Y puedes agregar esto al Makefile:

```makefile
# Agregar ANTES de la regla "all"
datos/limpios/encuesta_clean.csv: datos/crudos/encuesta_raw.csv codigo/01_limpiar_datos.py
	python codigo/01_limpiar_datos.py
```

### ¿Cómo probamos que funciona?

```bash
# 1. Ejecutar make
make

# 2. Verificar que el PDF se generó
ls -la main.pdf

# 3. Verificar la fecha de modificación (debe ser reciente)
# macOS:
stat -f "%Sm" main.pdf
# Linux / WSL:
stat -c "%y" main.pdf

# 4. Abrir el PDF para revisar visualmente
# macOS:
open main.pdf
# Windows (desde Git Bash):
start main.pdf
# Linux:
xdg-open main.pdf
```

> ✅ Si el PDF se generó correctamente, ¡la automatización funciona! Ahora puedes hacer cambios en tu `.tex`, ejecutar `make`, y tener la certeza de que todo se recompila correctamente.

---

## 6.2 Control de Versiones (integración con el flujo existente)

### El principio

> *"Manage changes to code (and data) using version control software."*  
> — Gentzkow & Shapiro (2014)

En las Partes 1–5 ya aprendimos los fundamentos de Git y GitHub. El artículo de Gentzkow y Shapiro refuerza esto y agrega recomendaciones específicas sobre **qué** versionar y **qué no**.

### Lo que ya sabemos vs. lo que agrega el artículo

| Ya sabemos (Partes 1–5) | El artículo agrega |
|--------------------------|--------------------|
| Usar `git add`, `commit`, `push` | **Nunca** versionar archivos generados (PDF, figuras) |
| Trabajar con ramas y Pull Requests | Usar `.gitignore` de forma rigurosa |
| Resolver conflictos | Mensajes de commit vinculados a tareas específicas |
| Sincronizar con GitHub y Overleaf | Un cambio lógico por commit (no mezclar tareas) |
| Revisar código de colegas | Guardar datos crudos separados del código |

### Buenas prácticas adicionales del artículo

**1. Nunca versiones archivos generados**

Si un archivo se puede regenerar ejecutando código, **no debe estar en Git**. ¿Por qué? Porque ocupa espacio innecesariamente, genera conflictos falsos y confunde sobre cuál es la "fuente de verdad".

```
❌ NO versionar              ✅ SÍ versionar
─────────────────           ─────────────────
main.pdf                    main.tex
figuras/grafico1.png        codigo/generar_graficos.py
tablas/tabla1.tex           codigo/generar_tablas.py
datos/limpios/*.csv         datos/crudos/*.csv
*.aux, *.log, *.bbl         Makefile
```

**2. Commit temprano, commit frecuente**

No esperes a tener "todo listo". Haz commits pequeños y frecuentes:

```
❌ Un solo commit gigante:
   "Terminé todo el proyecto"

✅ Commits pequeños y descriptivos:
   "Agrego script de limpieza de datos"
   "Corrijo filtro de edad en limpieza"
   "Agrego regresión principal en análisis"
   "Genero tabla 1 con resultados"
```

**3. Un cambio lógico por commit**

Cada commit debe hacer **una sola cosa**. Si estás limpiando datos Y escribiendo la introducción, esos son **dos commits separados**.

**4. Mensajes significativos vinculados a tareas**

```
❌ Mensajes inútiles           ✅ Mensajes descriptivos
─────────────────────         ─────────────────────────
"cambios"                     "Agrego variable de control edad en regresión"
"asdf"                        "Corrijo error en filtro de datos faltantes"
"wip"                         "Actualizo tabla 2 con nuevos resultados"
"fix"                         "Resuelvo #12: agregar sección de metodología"
```

### Tutorial: Configurar .gitignore correctamente

El archivo `.gitignore` le dice a Git qué archivos debe **ignorar** (no rastrear). Esto es fundamental para no versionar archivos generados.

**Paso 1: Verificar qué estamos rastreando que no deberíamos**

```bash
# Ver todos los archivos rastreados por Git
git ls-files

# Buscar archivos que probablemente no deberían estar
git ls-files | grep -E "\.(pdf|aux|log|bbl|blg|fls|fdb_latexmk|synctex\.gz|out|toc)$"
```

**Paso 2: Crear o editar `.gitignore`**

En la raíz de tu proyecto, crea (o edita) el archivo `.gitignore`:

```gitignore
# ══════════════════════════════════════════════════════════════
# .gitignore para proyecto académico con LaTeX + código
# ══════════════════════════════════════════════════════════════

# ── Archivos generados por LaTeX ─────────────────────────────
*.aux
*.bbl
*.blg
*.fdb_latexmk
*.fls
*.log
*.out
*.synctex.gz
*.toc
*.pdf

# ── Datos generados (se pueden recrear con scripts) ──────────
datos/limpios/
resultados/

# ── Archivos del sistema operativo ───────────────────────────
.DS_Store
Thumbs.db

# ── Editores ─────────────────────────────────────────────────
*.swp
*~
.vscode/settings.json
```

**Paso 3: Si ya habías rastreado archivos generados, quitarlos**

```bash
# Quitar archivos del rastreo de Git (sin borrarlos del disco)
git rm --cached *.pdf *.aux *.log *.synctex.gz 2>/dev/null
git rm --cached -r datos/limpios/ resultados/ 2>/dev/null

# Hacer commit del .gitignore y la limpieza
git add .gitignore
git commit -m "Configuro .gitignore: excluyo archivos generados"
```

---

## 6.3 Estructura de Directorios: "Un lugar para cada cosa"

### El principio

> *"Separate directories for code, raw data, intermediate data, output, and documentation."*  
> — Gentzkow & Shapiro (2014)

La estructura de carpetas de un proyecto **no es un detalle menor**. Es la base sobre la que todo lo demás se construye. Si tus archivos están bien organizados, es mucho más fácil automatizar, documentar y colaborar.

### La estructura recomendada

```
mi-proyecto/
│
├── codigo/                    ← Scripts de análisis
│   ├── 01_limpiar_datos.py    ← Paso 1: limpieza
│   ├── 02_analizar.py         ← Paso 2: análisis
│   └── 03_generar_figuras.py  ← Paso 3: visualización
│
├── datos/
│   ├── crudos/                ← Datos originales (NUNCA se modifican)
│   │   ├── encuesta_2024.csv
│   │   └── README.md          ← Fuente, fecha, descripción
│   └── limpios/               ← Datos procesados (regenerables)
│       └── encuesta_clean.csv
│
├── resultados/
│   ├── figuras/               ← Gráficas generadas por scripts
│   │   ├── figura1.png
│   │   └── figura2.png
│   └── tablas/                ← Tablas generadas por scripts
│       └── tabla1.tex
│
├── documentos/                ← Artículo LaTeX
│   ├── main.tex
│   ├── sections/
│   │   ├── introduction.tex
│   │   ├── methods.tex
│   │   └── results.tex
│   └── bibliography.bib
│
├── Makefile                   ← Automatización (un comando para todo)
├── .gitignore                 ← Archivos que Git debe ignorar
└── README.md                  ← Documentación del proyecto
```

> 💡 **¿Por qué numerar los scripts?** (`01_`, `02_`, `03_`) Porque el orden importa: primero limpias, después analizas, después generas figuras. Los números hacen explícito el orden de ejecución.

### Regla de oro: Datos crudos son sagrados 🔒

Esta es quizás la regla más importante del artículo:

> **Los datos crudos NUNCA se modifican directamente.**

Imagina que los datos crudos son como un documento histórico en un museo: puedes verlo, puedes fotografiarlo, puedes analizarlo, pero **jamás le pones un marcador encima**.

```
❌ Lo que NO debes hacer:
   1. Abrir encuesta.csv en Excel
   2. Borrar filas "raras" a mano
   3. Guardar el archivo
   → ¡Ya no sabes qué borraste ni por qué!

✅ Lo que SÍ debes hacer:
   1. Dejar encuesta.csv intacto en datos/crudos/
   2. Escribir un script que limpie los datos
   3. Guardar el resultado en datos/limpios/
   → ¡Puedes reconstruir exactamente qué se hizo y por qué!
```

¿Por qué es tan importante? Porque si alguien (o tú mismo en 6 meses) pregunta "¿por qué eliminaste esas 47 observaciones?", puedes abrir tu script y mostrar exactamente la línea de código que lo hizo, con un comentario explicando la razón.

### Tutorial: Organizar un proyecto desde cero

Vamos a crear la estructura completa de carpetas para un proyecto nuevo.

<details>
<summary><strong>🪟 Windows (Git Bash o PowerShell)</strong></summary>

```bash
# Crear la estructura de carpetas
mkdir -p mi-proyecto/{codigo,datos/crudos,datos/limpios,resultados/figuras,resultados/tablas,documentos/sections}

# Entrar a la carpeta del proyecto
cd mi-proyecto

# Crear archivos base
touch Makefile
touch .gitignore
touch README.md
touch datos/crudos/README.md

# Inicializar Git
git init
```

> Si usas PowerShell en lugar de Git Bash:
> ```powershell
> # PowerShell no soporta la sintaxis con llaves
> New-Item -ItemType Directory -Force -Path mi-proyecto\codigo
> New-Item -ItemType Directory -Force -Path mi-proyecto\datos\crudos
> New-Item -ItemType Directory -Force -Path mi-proyecto\datos\limpios
> New-Item -ItemType Directory -Force -Path mi-proyecto\resultados\figuras
> New-Item -ItemType Directory -Force -Path mi-proyecto\resultados\tablas
> New-Item -ItemType Directory -Force -Path mi-proyecto\documentos\sections
> ```

</details>

<details>
<summary><strong>🍎 macOS / Linux</strong></summary>

```bash
# Crear la estructura de carpetas
mkdir -p mi-proyecto/{codigo,datos/crudos,datos/limpios,resultados/figuras,resultados/tablas,documentos/sections}

# Entrar a la carpeta del proyecto
cd mi-proyecto

# Crear archivos base
touch Makefile .gitignore README.md datos/crudos/README.md

# Inicializar Git
git init
```

</details>

**Verificación:**

```bash
# Ver la estructura creada (instala tree si no lo tienes)
# macOS: brew install tree
# Linux: sudo apt install tree
# Si no tienes tree, usa find:
find . -type f -o -type d | sort
```

Deberías ver algo como:

```
.
├── .gitignore
├── Makefile
├── README.md
├── codigo
├── datos
│   ├── crudos
│   │   └── README.md
│   └── limpios
├── documentos
│   └── sections
└── resultados
    ├── figuras
    └── tablas
```

### ¿Cómo se conecta con nuestro flujo de trabajo?

Todo lo que aprendimos en las Partes 1–5 sigue aplicando, solo que ahora los archivos están mejor organizados:

```
┌───────────────────────────────────────────────────────────────┐
│                FLUJO COMPLETO CON ESTRUCTURA                   │
└───────────────────────────────────────────────────────────────┘

  LOCAL (tu computadora)              NUBE
  ──────────────────────              ────

  1. git pull                    ←── GitHub (traer cambios)

  2. Editar en VS Code:
     - codigo/*.py               ← Modificar scripts
     - documentos/main.tex       ← Escribir artículo

  3. make                        ← Ejecutar todo automáticamente
     (limpia datos → analiza → genera figuras → compila PDF)

  4. git add codigo/ documentos/
     git commit -m "mensaje"     ← Guardar solo código y texto

  5. git push                    ──→ GitHub (subir cambios)

  6. Overleaf: Pull from GitHub  ──→ Verificación final
```

> 📖 **Nota**: Los archivos en `datos/limpios/`, `resultados/` y los PDF **no se suben a Git** porque están en el `.gitignore`. Se pueden regenerar ejecutando `make`.

---

## 6.4 Llaves (Keys): Identificadores únicos para datos

### El principio

> *"Store each piece of information once and only once, and use unique keys to link datasets."*  
> — Gentzkow & Shapiro (2014)

Cuando trabajas con datos, es fundamental que cada observación tenga un **identificador único** (una "llave") que permita conectarla con otros conjuntos de datos sin ambigüedad.

### Analogía: El número de carnet universitario

Piensa en tu universidad. Puede haber tres estudiantes llamados "María García". ¿Cómo las diferencias? Con el **número de carnet** (o matrícula), que es único para cada persona. Ese número es una **llave**.

```
❌ Sin llaves: confusión                ✅ Con llaves: claridad
──────────────────────                 ──────────────────────
nombre,    nota                        id_alumno, nombre,    nota
María,     7.0                         A001,      María G.,  7.0
María,     5.5      ← ¿Cuál María?    A002,      María P.,  5.5
Pedro,     6.0                         A003,      Pedro R.,  6.0
```

### Ejemplo práctico: Datos de economía experimental

Supongamos que realizas un experimento de economía con varios participantes en varias sesiones. Necesitas vincular las decisiones del experimento con las respuestas de una encuesta posterior.

**Tabla de decisiones del experimento:**

| id_participante | id_sesion | ronda | decision | pago |
|-----------------|-----------|-------|----------|------|
| P001 | S01 | 1 | cooperar | 100 |
| P001 | S01 | 2 | no cooperar | 150 |
| P002 | S01 | 1 | cooperar | 100 |
| P003 | S02 | 1 | no cooperar | 50 |

**Tabla de encuesta post-experimento:**

| id_participante | edad | genero | carrera |
|-----------------|------|--------|---------|
| P001 | 22 | F | Economía |
| P002 | 25 | M | Sociología |
| P003 | 21 | F | Ciencia Política |

Gracias a la llave `id_participante`, puedes **vincular** ambas tablas de manera confiable:

```python
# Vincular datos del experimento con la encuesta
datos = decisiones.merge(encuesta, on="id_participante")
```

### Buenas prácticas para llaves

| Práctica | Ejemplo bueno | Ejemplo malo |
|----------|---------------|--------------|
| Usa identificadores estables | `id_participante: P001` | Usar el nombre de la persona |
| Combina llaves cuando sea necesario | `id_participante + id_sesion + ronda` | Asumir que una sola llave basta |
| Documenta el significado de cada llave | "P = participante, 001 = consecutivo" | Usar códigos sin explicación |
| Verifica unicidad | Confirma que no hay duplicados | Asumir que los datos son correctos |

```python
# Verificar que las llaves son únicas
duplicados = datos.duplicated(subset=["id_participante", "id_sesion", "ronda"])
if duplicados.any():
    raise ValueError(f"¡Hay {duplicados.sum()} llaves duplicadas en los datos!")
```

---

## 6.5 Abstracción: "No te repitas" (DRY)

### El principio

> *"Abstract to eliminate redundancy."*  
> — Gentzkow & Shapiro (2014)

El principio **DRY** (Don't Repeat Yourself — No te repitas) dice:

> Si escribes lo mismo dos veces, conviértelo en algo reutilizable.

¿Por qué? Porque si un valor o bloque de código aparece en 10 lugares y necesitas cambiarlo, tendrás que encontrar y actualizar los 10. Si olvidas uno, tienes un error silencioso. Si lo defines **una sola vez**, solo cambias un lugar.

### Ejemplo en LaTeX

**❌ Sin abstracción (valores repetidos en el texto):**

```latex
Los resultados muestran que el efecto promedio fue de 0.45 desviaciones
estándar (Tabla~\ref{tab:resultados}). Este efecto de 0.45 desviaciones
estándar es significativo al 1\%. Nuestros 1,247 participantes...

% ... 20 páginas después ...

Como mencionamos, el efecto de 0.45 desviaciones estándar sobre
una muestra de 1,247 participantes sugiere que...
```

¿Qué pasa si al revisar descubres que el efecto real era 0.43 y no 0.45? Tienes que buscarlo en todo el documento y rezar para no olvidar ninguno.

**✅ Con abstracción (valores definidos una vez):**

```latex
% ── Definir valores en el preámbulo ──────────────────────────
\newcommand{\effectSize}{0.45}
\newcommand{\sampleSize}{1{,}247}
\newcommand{\sigLevel}{1\%}

% ── Usar en el texto ─────────────────────────────────────────
Los resultados muestran que el efecto promedio fue de \effectSize{}
desviaciones estándar (Tabla~\ref{tab:resultados}). Este efecto de
\effectSize{} desviaciones estándar es significativo al \sigLevel{}.
Nuestros \sampleSize{} participantes...
```

Ahora, si el efecto cambia a 0.43, solo modificas **una línea** y todo el documento se actualiza.

### Ejemplo en código de análisis

**❌ Sin abstracción (código repetido):**

```python
# Análisis para hombres
datos_hombres = datos[datos["genero"] == "M"]
media_h = datos_hombres["ingreso"].mean()
mediana_h = datos_hombres["ingreso"].median()
de_h = datos_hombres["ingreso"].std()

# Análisis para mujeres (¡mismo código copiado!)
datos_mujeres = datos[datos["genero"] == "F"]
media_m = datos_mujeres["ingreso"].mean()
mediana_m = datos_mujeres["ingreso"].median()
de_m = datos_mujeres["ingreso"].std()
```

**✅ Con abstracción (función reutilizable):**

```python
def estadisticas_grupo(datos, variable_grupo, valor, variable_analisis):
    """Calcula estadísticas descriptivas para un subgrupo."""
    subgrupo = datos[datos[variable_grupo] == valor]
    return {
        "media": subgrupo[variable_analisis].mean(),
        "mediana": subgrupo[variable_analisis].median(),
        "de": subgrupo[variable_analisis].std(),
        "n": len(subgrupo)
    }

stats_hombres = estadisticas_grupo(datos, "genero", "M", "ingreso")
stats_mujeres = estadisticas_grupo(datos, "genero", "F", "ingreso")
```

Si luego quieres agregar el cálculo del percentil 25 y 75, solo modificas la función una vez.

### Tutorial: Aplicar abstracción en el artículo LaTeX

**Ejercicio práctico**: Vamos a definir comandos reutilizables en nuestro artículo.

**Paso 1**: En el preámbulo de `main.tex` (antes de `\begin{document}`), agrega:

```latex
% ══════════════════════════════════════════════════════════════
% Valores del artículo (modificar aquí para actualizar todo)
% ══════════════════════════════════════════════════════════════
\newcommand{\numParticipantes}{1{,}247}
\newcommand{\numSesiones}{12}
\newcommand{\efectoPrincipal}{0.45}
\newcommand{\pValor}{$p < 0.01$}
\newcommand{\periodoEstudio}{enero--junio 2024}
```

**Paso 2**: Usa estos comandos en el texto en lugar de valores escritos directamente:

```latex
\section{Metodología}
Reclutamos \numParticipantes{} participantes durante \periodoEstudio{},
distribuidos en \numSesiones{} sesiones experimentales.

\section{Resultados}
El efecto principal fue de \efectoPrincipal{} desviaciones estándar
(\pValor{}), medido sobre una muestra de \numParticipantes{} participantes.
```

**Paso 3**: Para secciones compartidas, usa `\input`:

```latex
% En main.tex, en lugar de copiar el mismo texto:
\input{sections/introduction}
\input{sections/methods}
\input{sections/results}
\input{sections/conclusion}
```

> ✅ **Verificación**: Compila el PDF con `make` (o `pdflatex main.tex`). Cambia un valor en el preámbulo (por ejemplo, `\numParticipantes{1{,}500}`), recompila, y verifica que se actualizó **en todas partes** del documento.

---

## 6.6 Documentación: "Explica todo como si fueras a olvidarlo"

### El principio

> *"Document everything."*  
> — Gentzkow & Shapiro (2014)

La regla es simple: **tú vas a olvidar qué hace tu código en 6 meses**. Y si alguien más necesita usar tu proyecto, lo va a entender aún menos. La documentación no es opcional: es tan importante como el código mismo.

### Los tres niveles de documentación

```
 Nivel 1: README.md del proyecto (vista general)
 ┌─────────────────────────────────────────────────┐
 │ • ¿Qué es este proyecto?                        │
 │ • ¿Cómo ejecuto todo?                           │
 │ • ¿Qué necesito instalar?                       │
 │ • ¿Quiénes son los autores?                     │
 └──────────────────────┬──────────────────────────┘
                        │
 Nivel 2: README.md por carpeta (qué hay adentro)
 ┌──────────────────────▼──────────────────────────┐
 │ datos/crudos/README.md:                         │
 │   • ¿De dónde vienen estos datos?               │
 │   • ¿Cuándo se descargaron?                     │
 │   • ¿Qué variables contienen?                   │
 └──────────────────────┬──────────────────────────┘
                        │
 Nivel 3: Comentarios en el código (por qué, no qué)
 ┌──────────────────────▼──────────────────────────┐
 │ # Eliminamos observaciones con ingreso < 0      │
 │ # porque son errores de codificación confirmados│
 │ # por el equipo de campo (email del 15/03/2024) │
 │ df = df[df["ingreso"] >= 0]                     │
 └─────────────────────────────────────────────────┘
```

> 💡 **Regla para comentarios en código**: Comenta el **por qué**, no el **qué**. El código ya dice "qué" hace. El comentario debe explicar "por qué" lo hace así.

```python
# ❌ Comentario inútil (repite lo que ya dice el código):
# Filtrar datos donde edad es mayor a 18
df = df[df["edad"] > 18]

# ✅ Comentario útil (explica el por qué):
# Excluimos menores de 18 por requisito del comité de ética (protocolo #2024-15)
df = df[df["edad"] > 18]
```

### Tutorial: Crear un README de proyecto profesional

Crea un archivo `README.md` en la raíz de tu proyecto con esta plantilla:

```markdown
# [Título del Proyecto]

> Breve descripción en 1-2 oraciones.

## Autores

- [Nombre 1] — [Institución] — [email]
- [Nombre 2] — [Institución] — [email]

## Estructura del proyecto

| Carpeta | Contenido |
|---------|-----------|
| `codigo/` | Scripts de limpieza y análisis |
| `datos/crudos/` | Datos originales (no modificar) |
| `datos/limpios/` | Datos procesados (generados por scripts) |
| `resultados/` | Figuras y tablas generadas |
| `documentos/` | Artículo en LaTeX |

## Requisitos

- Python 3.9+ con pandas (`pip install pandas`)
- TeX Live 2023+ (o MiKTeX en Windows)
- GNU Make

## Cómo ejecutar

```bash
# Instalar dependencias de Python
pip install -r requirements.txt

# Ejecutar todo el pipeline (limpieza → análisis → figuras → PDF)
make

# Solo compilar el artículo LaTeX
make pdf

# Limpiar archivos generados
make clean
```

## Datos

Los datos provienen de [fuente]. Fueron descargados el [fecha].
Ver `datos/crudos/README.md` para más detalles.

## Licencia

[Tipo de licencia]
```

### Tutorial: Crear un diccionario de datos

Un **diccionario de datos** describe cada variable en tu conjunto de datos. Créalo como `datos/crudos/README.md`:

```markdown
# Datos: Encuesta de Participantes 2024

## Fuente
- **Origen**: Encuesta realizada por [equipo/institución]
- **Fecha de recolección**: Enero-Marzo 2024
- **Fecha de descarga**: 15 de abril de 2024
- **Contacto**: [email del responsable de los datos]

## Archivo: encuesta_raw.csv

| Variable | Tipo | Descripción | Valores posibles |
|----------|------|-------------|------------------|
| `id_participante` | texto | Identificador único del participante | P001, P002, ... |
| `edad` | entero | Edad en años al momento de la encuesta | 18-99 |
| `genero` | texto | Género reportado | M, F, Otro |
| `educacion` | entero | Años de educación formal | 0-25 |
| `ingreso` | decimal | Ingreso mensual en pesos (auto-reportado) | 0-999999 |
| `tratamiento` | entero | Grupo de tratamiento asignado | 0=control, 1=tratamiento |

## Notas

- 3 observaciones tienen `ingreso` negativo (errores de codificación)
- El campo `genero` tiene 5 valores faltantes
- Los identificadores siguen el formato P + número consecutivo de 3 dígitos
```

> ✅ **Verificación**: Abre tu README.md y pregúntate: "Si alguien que no conoce el proyecto lee esto, ¿podría entender qué hay aquí y cómo usarlo?" Si la respuesta es no, agrega más detalle.

---

## 6.7 Gestión de Tareas: "Divide y vencerás"

### El principio

> *"Manage tasks with a task management system."*  
> — Gentzkow & Shapiro (2014)

Un proyecto de investigación tiene decenas de tareas: limpiar datos, correr modelos, escribir secciones, revisar bibliografía, hacer figuras... Sin un sistema para organizarlas, es fácil perder el hilo, olvidar pendientes o duplicar trabajo.

### Integración con GitHub Issues

La buena noticia es que **ya tenemos la herramienta**: GitHub Issues, que vimos brevemente en las partes anteriores. El artículo de Gentzkow y Shapiro recomienda usar un sistema de gestión de tareas, y GitHub Issues es perfecto para esto.

Cada tarea del proyecto se convierte en un **Issue**:

```
┌──────────────────────────────────────────┐
│ Issue #1: Limpiar datos de encuesta      │
│ Estado: ✅ Cerrado                        │
│ Asignado a: José Miguel                  │
├──────────────────────────────────────────┤
│ Issue #2: Correr regresión principal     │
│ Estado: 🔄 En progreso                   │
│ Asignado a: Rodrigo                      │
├──────────────────────────────────────────┤
│ Issue #3: Escribir sección de resultados │
│ Estado: ⬚ Pendiente                      │
│ Asignado a: Mauricio                     │
├──────────────────────────────────────────┤
│ Issue #4: Generar figuras para el paper  │
│ Estado: ⬚ Pendiente                      │
│ Asignado a: (sin asignar)               │
└──────────────────────────────────────────┘
```

### Tutorial: Flujo completo de una tarea con Issues

Vamos a recorrer el ciclo de vida completo de una tarea, desde que se crea hasta que se cierra automáticamente.

**Paso 1: Crear un Issue en GitHub**

1. Ve a tu repositorio en GitHub
2. Click en la pestaña **Issues**
3. Click en **New issue**
4. Llena los campos:
   - **Título**: `Limpiar datos de encuesta`
   - **Descripción**:
     ```
     ## Tarea
     Crear script de limpieza para los datos crudos de la encuesta.

     ## Criterios de aceptación
     - [ ] Eliminar observaciones con ingreso negativo
     - [ ] Filtrar edad entre 18-65
     - [ ] Renombrar columnas al español
     - [ ] Guardar resultado en datos/limpios/
     ```
   - **Asignado a**: tu nombre
5. Click en **Submit new issue**
6. **Anota el número del Issue** (por ejemplo, `#7`)

**Paso 2: Crear una rama para la tarea**

```bash
# Actualizar main
git checkout main
git pull origin main

# Crear rama con referencia al Issue
git checkout -b issue-7-limpiar-datos
```

> 💡 **Convención**: Nombra la rama con el número del Issue para que sea fácil encontrarla: `issue-7-limpiar-datos`, `issue-12-seccion-resultados`, etc.

**Paso 3: Trabajar en la tarea**

Escribe tu código, haz commits frecuentes con mensajes que referencien el Issue:

```bash
# Después de escribir el script de limpieza
git add codigo/01_limpiar_datos.py
git commit -m "Agrego script de limpieza de datos (#7)"

# Después de agregar el diccionario de datos
git add datos/crudos/README.md
git commit -m "Documento variables del dataset crudo (#7)"
```

> 💡 El `#7` en el mensaje crea automáticamente un enlace al Issue en GitHub.

**Paso 4: Subir la rama y crear un Pull Request**

```bash
git push -u origin issue-7-limpiar-datos
```

Luego en GitHub:
1. Click en **Compare & pull request**
2. En la descripción del PR, escribe: `Closes #7` (o `Resuelve #7`)
3. Asigna a un compañero como revisor
4. Click en **Create pull request**

**Paso 5: Revisión y merge**

1. Tu compañero revisa el código en GitHub
2. Si hay comentarios, haz los cambios y sube nuevos commits
3. Cuando el PR sea aprobado, click en **Merge pull request**
4. GitHub **cierra automáticamente el Issue #7** porque escribiste `Closes #7` en el PR

```
┌─────────┐    ┌─────────┐    ┌──────────┐    ┌─────────┐    ┌──────────┐
│ Crear   │───▶│ Crear   │───▶│ Trabajar │───▶│ Pull    │───▶│ Merge    │
│ Issue   │    │ rama    │    │ + commit │    │ Request │    │ + cierre │
│         │    │         │    │ (#7)     │    │ Close#7 │    │ auto     │
└─────────┘    └─────────┘    └──────────┘    └─────────┘    └──────────┘
```

> ✅ **Verificación**: Ve a la pestaña Issues de tu repositorio. El Issue #7 debería aparecer en la sección "Closed" con un enlace al PR que lo cerró.

---

## Resumen: Los 7 Principios en una tabla

| # | Principio | Acción concreta | Herramienta |
|---|-----------|-----------------|-------------|
| 6.1 | **Automatización** | Crear un Makefile que ejecute todo el pipeline | `make`, Makefile |
| 6.2 | **Control de versiones** | Versionar solo código y texto; ignorar archivos generados | Git, `.gitignore` |
| 6.3 | **Estructura de directorios** | Separar código, datos crudos, datos limpios, resultados y documentos | Carpetas con nombres claros |
| 6.4 | **Llaves** | Usar identificadores únicos para vincular datos | Convención de IDs |
| 6.5 | **Abstracción (DRY)** | No repetir valores ni código; usar funciones y `\newcommand` | Python/R, LaTeX |
| 6.6 | **Documentación** | README en cada carpeta, diccionario de datos, comentarios con "por qué" | Markdown, comentarios |
| 6.7 | **Gestión de tareas** | Crear Issues para cada tarea, vincularlos a commits y PRs | GitHub Issues |

---

## Checkpoint ✅

Antes de dar por terminada esta parte, verifica que entiendes:

- [ ] Puedo explicar por qué la automatización reduce errores
- [ ] Sé qué archivos deben ir en `.gitignore` y por qué
- [ ] Entiendo la estructura de directorios recomendada (código, datos crudos, datos limpios, resultados, documentos)
- [ ] Sé por qué los datos crudos **nunca se modifican directamente**
- [ ] Puedo crear un Makefile básico para compilar LaTeX
- [ ] Entiendo qué son las llaves y por qué son importantes para vincular datos
- [ ] Sé cómo usar `\newcommand` en LaTeX para no repetir valores
- [ ] Puedo crear un README de proyecto profesional y un diccionario de datos
- [ ] Sé cómo usar GitHub Issues para gestionar tareas y vincularlas a commits

---

## Recursos adicionales

| Recurso | Enlace | Descripción |
|---------|--------|-------------|
| **El artículo original** | [web.stanford.edu/~gentzkow/research/CodeAndData.pdf](https://web.stanford.edu/~gentzkow/research/CodeAndData.pdf) | El paper completo de Gentzkow & Shapiro |
| **GNU Make Manual** | [gnu.org/software/make/manual](https://www.gnu.org/software/make/manual/) | Documentación oficial de Make |
| **The Turing Way** | [the-turing-way.netlify.app](https://the-turing-way.netlify.app/) | Guía de ciencia reproducible |
| **Project TIER** | [projecttier.org](https://www.projecttier.org/) | Protocolo de transparencia para investigación empírica |

---

**Anterior**: [← Parte 5 - Práctica Libre](../05-practica-libre/README.md)

**Volver al inicio**: [README principal](../README.md)
