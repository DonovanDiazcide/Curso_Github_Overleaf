# Guía de Resolución de Problemas (Troubleshooting)

> Soluciones a los problemas más comunes en el flujo de trabajo colaborativo

---

## 📋 Índice de Problemas

### Instalación
1. [Git no se encuentra después de instalarlo](#1-git-no-se-encuentra)
2. [LaTeX no compila en VS Code](#2-latex-no-compila)
3. [Perl no encontrado (Windows)](#3-perl-no-encontrado)
4. [MacTeX instalación parece congelada](#4-mactex-congelada)

### Git y GitHub
5. [Permission denied (publickey)](#5-permission-denied)
6. [Push rechazado (rejected)](#6-push-rechazado)
7. [Merge conflict](#7-merge-conflict)
8. [Detached HEAD state](#8-detached-head)
9. [Archivo grande no sube](#9-archivo-grande)

### VS Code
10. [PDF no se muestra](#10-pdf-no-se-muestra)
11. [Sintaxis LaTeX no resaltada](#11-sintaxis-no-resaltada)
12. [Terminal no abre](#12-terminal-no-abre)

### Compilación LaTeX
13. [Paquete LaTeX no encontrado](#13-paquete-no-encontrado)
14. [Error de referencias](#14-error-referencias)
15. [Caracteres especiales](#15-caracteres-especiales)

### GitHub Actions
16. [Workflow no se ejecuta](#16-workflow-no-ejecuta)
17. [Compilación falla en Actions pero funciona local](#17-compilacion-falla-actions)

---

## 🔧 Soluciones Detalladas

### 1. Git no se encuentra después de instalarlo {#1-git-no-se-encuentra}

**Síntoma:**
```bash
git --version
# bash: git: command not found
```

**Causas posibles:**
1. Git no está en el PATH
2. La terminal no se ha reiniciado
3. Git no se instaló correctamente

**Soluciones:**

#### Windows

**Opción 1: Reiniciar la terminal**
1. Cierra VS Code completamente
2. Abre VS Code de nuevo
3. Abre una terminal nueva
4. Prueba `git --version`

**Opción 2: Verificar instalación**
1. Abre el menú de Windows
2. Busca "Git Bash"
3. Si no aparece, Git no está instalado
4. Descarga e instala desde https://git-scm.com/downloads

**Opción 3: Agregar a PATH manualmente**
1. Abre "Variables de Entorno del Sistema"
2. Click en "Variables de entorno"
3. En "Variables del sistema", busca "Path"
4. Click en "Editar"
5. Click en "Nuevo"
6. Agrega: `C:\Program Files\Git\bin`
7. Click en "Aceptar" en todas las ventanas
8. Reinicia VS Code

#### macOS

**Opción 1: Instalar Command Line Tools**
```bash
# En Terminal:
xcode-select --install
```

Aparecerá un diálogo para instalar las herramientas.

**Opción 2: Instalar via Homebrew**
```bash
# Si tienes Homebrew:
brew install git
```

---

### 2. LaTeX no compila en VS Code {#2-latex-no-compila}

**Síntoma:**
- Guardas el archivo .tex pero no se genera el PDF
- Output muestra errores

**Diagnóstico:**

Abre Output en VS Code:
1. View → Output
2. En el dropdown, selecciona "LaTeX Workshop"
3. Lee los mensajes de error

**Soluciones comunes:**

#### Problema: MiKTeX/MacTeX no encontrado

**Verificar instalación:**
```bash
pdflatex --version
```

Si dice "command not found":
- **Windows:** Reinstala MiKTeX y reinicia VS Code
- **macOS:** Verifica que MacTeX esté en `/usr/local/texlive/`

#### Problema: Error de sintaxis en LaTeX

Busca en el Output mensajes como:
```
! LaTeX Error: \begin{document} ended by \end{itemize}.
```

**Solución:**
1. Lee el mensaje de error cuidadosamente
2. Te dice la línea del error
3. Verifica que todos los `\begin{...}` tengan su `\end{...}`

#### Problema: Archivo auxiliar corrupto

```bash
# Eliminar archivos auxiliares y recompilar
rm *.aux *.log *.out *.fls *.fdb_latexmk
```

Luego guarda el .tex de nuevo para recompilar.

---

### 3. Perl no encontrado (Windows) {#3-perl-no-encontrado}

**Síntoma:**
LaTeX compila pero con warnings sobre Perl.

**Por qué es necesario:**
MiKTeX necesita Perl para instalar paquetes automáticamente.

**Solución:**

1. Descarga Strawberry Perl: https://strawberryperl.com/
2. Instala con opciones por defecto
3. Reinicia VS Code
4. Verifica:
```bash
perl --version
```

---

### 4. MacTeX instalación parece congelada {#4-mactex-congelada}

**Síntoma:**
La barra de progreso llega al 90-95% y se detiene por varios minutos.

**Esto es NORMAL:**
MacTeX está creando "format files". Puede tardar 2-5 minutos sin mostrar progreso.

**Qué hacer:**
- **Espera pacientemente**
- NO canceles la instalación
- NO apagues la computadora
- La instalación continuará automáticamente

---

### 5. Permission denied (publickey) {#5-permission-denied}

**Síntoma:**
```bash
git push origin main
# Permission denied (publickey).
# fatal: Could not read from remote repository.
```

**Causa:**
GitHub no puede autenticarte.

**Soluciones:**

#### Opción 1: Usar HTTPS en lugar de SSH

```bash
# Ver la URL actual
git remote -v

# Si dice git@github.com, cambiar a HTTPS:
git remote set-url origin https://github.com/DonovanDiazcide/Curso_Github_Overleaf.git

# Intentar push de nuevo
git push origin main
```

Se abrirá el navegador para autenticarte.

#### Opción 2: Configurar SSH key

```bash
# Generar una nueva SSH key
ssh-keygen -t ed25519 -C "tu-email@ejemplo.com"

# Copiar la clave pública
cat ~/.ssh/id_ed25519.pub
```

Luego en GitHub:
1. Settings → SSH and GPG keys
2. New SSH key
3. Pega la clave pública
4. Save

---

### 6. Push rechazado (rejected) {#6-push-rechazado}

**Síntoma:**
```bash
git push origin main
# ! [rejected]        main -> main (non-fast-forward)
# error: failed to push some refs
```

**Causa:**
Alguien más subió cambios antes que tú.

**Solución:**

```bash
# 1. Obtener los cambios de otros
git pull origin main

# 2. Si no hay conflictos:
git push origin main

# 3. Si hay conflictos, ver la sección de conflictos
```

---

### 7. Merge conflict {#7-merge-conflict}

**Síntoma:**
```bash
git pull origin main
# Auto-merging sections/introduction.tex
# CONFLICT (content): Merge conflict in sections/introduction.tex
# Automatic merge failed; fix conflicts and then commit the result.
```

**Qué hacer:**

#### Paso 1: Identificar archivos con conflicto

```bash
git status
# You have unmerged paths.
#   (fix conflicts and run "git commit")
# 
# Unmerged paths:
#   both modified:   sections/introduction.tex
```

#### Paso 2: Abrir archivo en VS Code

Busca los marcadores de conflicto:
```latex
<<<<<<< HEAD
Tu versión del texto
=======
La versión de la otra persona
>>>>>>> abc123def456...
```

#### Paso 3: Decidir qué mantener

VS Code te muestra botones:
- **Accept Current Change**: Mantener tu versión
- **Accept Incoming Change**: Usar la otra versión
- **Accept Both Changes**: Mantener ambas
- **Manual**: Editar manualmente combinando como quieras

#### Paso 4: Eliminar los marcadores

Asegúrate de eliminar las líneas:
- `<<<<<<< HEAD`
- `=======`
- `>>>>>>> abc123...`

#### Paso 5: Guardar y completar el merge

```bash
# Agregar el archivo resuelto
git add sections/introduction.tex

# Completar el merge
git commit -m "Resuelto conflicto en introducción"

# Subir
git push origin main
```

---

### 8. Detached HEAD state {#8-detached-head}

**Síntoma:**
```bash
git status
# HEAD detached at abc1234
```

**Qué significa:**
No estás en ninguna rama, estás mirando un commit antiguo.

**Solución:**

```bash
# Volver a la rama main
git checkout main

# Si hiciste cambios que quieres mantener:
git checkout -b mi-nueva-rama
git checkout main
git merge mi-nueva-rama
```

---

### 9. Archivo grande no sube {#9-archivo-grande}

**Síntoma:**
```bash
git push origin main
# remote: error: File images/foto.jpg is 120 MB; this exceeds GitHub's file size limit of 100 MB
```

**Causa:**
GitHub no permite archivos mayores a 100 MB.

**Soluciones:**

#### Opción 1: No subir el archivo

```bash
# Agregar al .gitignore
echo "images/foto.jpg" >> .gitignore

# Quitar del staging
git rm --cached images/foto.jpg

# Commit
git commit -m "Removido archivo grande"
```

#### Opción 2: Comprimir el archivo

- Reduce la resolución de imágenes
- Usa formatos más eficientes (WebP en lugar de PNG)

#### Opción 3: Usar Git LFS

```bash
# Instalar Git LFS
git lfs install

# Trackear archivos grandes
git lfs track "*.jpg"
git lfs track "*.pdf"

# Agregar .gitattributes
git add .gitattributes

# Commit y push
git commit -m "Configurado Git LFS"
git push origin main
```

---

### 10. PDF no se muestra en VS Code {#10-pdf-no-se-muestra}

**Síntoma:**
Compilas el .tex pero el PDF no aparece.

**Soluciones:**

#### Opción 1: Configurar el visor

1. Abre Command Palette (Ctrl+Shift+P / Cmd+Shift+P)
2. Escribe "Preferences: Open Settings (JSON)"
3. Agrega:
```json
{
    "latex-workshop.view.pdf.viewer": "tab"
}
```
4. Guarda y recompila

#### Opción 2: Abrir manualmente

```bash
# Ver el PDF en el visor externo:
# Windows: Click derecho en el PDF → "Reveal in File Explorer"
# Mac: Click derecho en el PDF → "Reveal in Finder"
```

#### Opción 3: Reinstalar LaTeX Workshop

1. En VS Code: Extensions (Ctrl+Shift+X)
2. Busca "LaTeX Workshop"
3. Click en "Uninstall"
4. Reinicia VS Code
5. Reinstala la extensión

---

### 11. Sintaxis LaTeX no resaltada {#11-sintaxis-no-resaltada}

**Síntoma:**
El archivo .tex se ve todo del mismo color.

**Solución:**

1. Verifica que el archivo tenga extensión `.tex`
2. En la esquina inferior derecha de VS Code, click en el tipo de archivo
3. Selecciona "LaTeX" de la lista

---

### 12. Terminal no abre {#12-terminal-no-abre}

**Síntoma:**
Presionas `` Ctrl+` `` pero no pasa nada.

**Soluciones:**

#### Opción 1: Usar el menú

1. Terminal → New Terminal

#### Opción 2: Verificar shortcuts

1. File → Preferences → Keyboard Shortcuts
2. Busca "Toggle Terminal"
3. Verifica el atajo asignado

#### Opción 3: Cambiar shell predeterminado

**Windows:**
1. Command Palette (Ctrl+Shift+P)
2. "Terminal: Select Default Profile"
3. Selecciona "Git Bash" o "PowerShell"

**macOS:**
1. Preferences → Settings
2. Busca "terminal.integrated.shell"
3. Configura "/bin/zsh" o "/bin/bash"

---

### 13. Paquete LaTeX no encontrado {#13-paquete-no-encontrado}

**Síntoma:**
```
! LaTeX Error: File `hyperref.sty' not found.
```

**Soluciones:**

#### Windows (MiKTeX)

MiKTeX debería instalar paquetes automáticamente. Si no:

1. Abre MiKTeX Console
2. Click en "Updates"
3. Click en "Check for updates"
4. Click en "Update now"

#### macOS (MacTeX)

```bash
# Instalar paquete específico
sudo tlmgr install hyperref

# Actualizar todos los paquetes
sudo tlmgr update --all
```

---

### 14. Error de referencias {#14-error-referencias}

**Síntoma:**
```
LaTeX Warning: Citation 'smith2023' on page 1 undefined
```

**Causa:**
La referencia no está en el archivo .bib o necesitas compilar varias veces.

**Solución:**

1. Verifica que `smith2023` existe en `references.bib`
2. Compila en este orden:
   - pdflatex
   - bibtex
   - pdflatex
   - pdflatex

En VS Code, esto es automático si guardas varias veces.

---

### 15. Caracteres especiales {#15-caracteres-especiales}

**Síntoma:**
```
! Package inputenc Error: Unicode char ó (U+00F3)
```

**Solución:**

Asegúrate de tener en el preámbulo:
```latex
\usepackage[utf8]{inputenc}
\usepackage[spanish]{babel}  % Si escribes en español
```

---

### 16. Workflow no se ejecuta {#16-workflow-no-ejecuta}

**Síntoma:**
Haces push pero GitHub Actions no se activa.

**Causas y soluciones:**

#### Causa 1: Archivo workflow mal ubicado

Debe estar en `.github/workflows/compile-latex.yml`

#### Causa 2: Sintaxis YAML incorrecta

Valida el YAML en: https://www.yamllint.com/

#### Causa 3: Branch no configurado

En `compile-latex.yml`, verifica:
```yaml
on:
  push:
    branches: [ main ]  # ← Tu rama debe estar aquí
```

---

### 17. Compilación falla en Actions pero funciona local {#17-compilacion-falla-actions}

**Síntoma:**
En tu máquina compila bien, pero GitHub Actions marca error.

**Causas comunes:**

#### Causa 1: Diferencias en paquetes

GitHub Actions usa TeX Live, puede tener versiones diferentes.

**Solución:** Especifica versiones en tus comandos.

#### Causa 2: Archivos faltantes

**Solución:**
```bash
# Verifica que todos los archivos estén en Git
git status

# Agrega archivos que falten
git add archivo-faltante.tex
git commit -m "Agregado archivo faltante"
git push
```

#### Causa 3: Rutas con espacios o caracteres especiales

**Solución:** Usa rutas sin espacios ni acentos.

---

## 🆘 Obtener Ayuda

Si ninguna de estas soluciones funciona:

1. **Busca en GitHub Issues:**
   - Puede que alguien ya reportó el problema
   - https://github.com/DonovanDiazcide/Curso_Github_Overleaf/issues

2. **Crea un Issue:**
   - Usa el template "Reporte de Error"
   - Incluye:
     - Sistema operativo
     - Comando exacto que ejecutaste
     - Mensaje de error completo
     - Logs relevantes

3. **Pregunta al equipo:**
   - En el canal de comunicación del proyecto
   - Durante las sesiones del taller

---

## 📚 Recursos Adicionales

- **Git Official Docs:** https://git-scm.com/doc
- **LaTeX Workshop Wiki:** https://github.com/James-Yu/LaTeX-Workshop/wiki
- **Stack Overflow:** https://stackoverflow.com/questions/tagged/git
- **TeX StackExchange:** https://tex.stackexchange.com/

---

## 💡 Consejos de Prevención

1. **Haz commit frecuentemente** - Más fácil revertir cambios pequeños
2. **Usa mensajes descriptivos** - Te ayudará a encontrar cambios después
3. **Haz pull antes de empezar a trabajar** - Evita conflictos
4. **No edites directamente en GitHub** - Usa el flujo local → GitHub
5. **Mantén backups** - Tu repositorio en GitHub ES tu backup

---

**Actualizado:** Febrero 2026  
**Mantenido por:** Equipo del Taller Git+GitHub+Overleaf
