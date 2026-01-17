# Guía de Instalación - José Miguel
## Windows (Español)

> **Tiempo estimado**: 45-60 minutos  
> **Tu rol**: Colaborador

---

## Resumen de Verificación

| Herramienta | Requerida | Verificación |
|-------------|-----------|--------------|
| Cuenta de GitHub | ✅ | Iniciar sesión en github.com |
| Git | ✅ | `git --version` |
| Visual Studio Code | ✅ | Se abre desde el Menú Inicio |
| MiKTeX | ✅ | `pdflatex --version` |
| Strawberry Perl | ✅ | `perl --version` |
| Extensión LaTeX Workshop | ✅ | Aparece ícono en VS Code |

---

## Paso 1: Cuenta de GitHub (2 min)

1. Ir a [github.com](https://github.com)
2. Clic en **"Sign up"** (esquina superior derecha)
3. Seguir el proceso de registro
4. **Importante**: Recuerda tu correo — lo necesitarás para configurar Git

> 📖 Fuente oficial: [GitHub Docs - Creating an account](https://docs.github.com/en/get-started/signing-up-for-github/signing-up-for-a-new-github-account)

---

## Paso 2: Git (10 min)

### Descargar e Instalar

1. Ir a [git-scm.com/download/win](https://git-scm.com/download/win)
2. La descarga comenzará automáticamente
3. Ejecutar el instalador (`Git-2.x.x-64-bit.exe`)

### Opciones de Instalación (¡Importante!)

Durante la instalación verás varias pantallas. Aquí están las opciones clave:

| Pantalla | Opción a Seleccionar |
|----------|---------------------|
| **Select Components** | Dejar valores por defecto |
| **Choosing the default editor** | Seleccionar "Use Visual Studio Code as Git's default editor" |
| **Adjusting your PATH** | ⚠️ Seleccionar **"Git from the command line and also from 3rd-party software"** |
| **Choosing SSH executable** | "Use bundled OpenSSH" |
| **Choosing HTTPS transport backend** | "Use the OpenSSL library" |
| **Configuring line ending conversions** | "Checkout Windows-style, commit Unix-style line endings" |
| **Configuring terminal emulator** | "Use MinTTY" |
| **Default behavior of git pull** | "Default (fast-forward or merge)" |
| **Choose a credential helper** | "Git Credential Manager" |
| **Extra options** | Dejar valores por defecto |

4. Clic en **Install** y esperar a que termine

### Verificar Instalación

Abrir **Windows PowerShell** (buscar "PowerShell" en el Menú Inicio):

```
git --version
```

Resultado esperado: `git version 2.43.0.windows.1` (o similar)

### Configurar Git (¡Esencial!)

Ejecutar estos comandos en PowerShell (reemplaza con tu información):

```bash
git config --global user.name "José Miguel"
git config --global user.email "tu.correo@ejemplo.com"
```

⚠️ **¡Usa el mismo correo que tu cuenta de GitHub!**

Verificar la configuración:
```bash
git config --list
```

> 📖 Fuente oficial: [Git Book - Installing Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)

---

## Paso 3: Visual Studio Code (5 min)

### Descargar e Instalar

1. Ir a [code.visualstudio.com](https://code.visualstudio.com/)
2. Clic en **"Descargar para Windows"** (o "Download for Windows")
3. Ejecutar el instalador (`VSCodeUserSetup-x64-1.x.x.exe`)

### Opciones de Instalación

| Pantalla | Opción a Seleccionar |
|----------|---------------------|
| **Acuerdo de Licencia** | Aceptar |
| **Seleccionar carpeta de destino** | Dejar por defecto |
| **Seleccionar carpeta del Menú Inicio** | Dejar por defecto |
| **Seleccionar tareas adicionales** | ✅ Marcar **"Agregar a PATH"** (Add to PATH) |
| | ✅ Marcar "Agregar acción 'Abrir con Code' al menú contextual de archivo" |
| | ✅ Marcar "Agregar acción 'Abrir con Code' al menú contextual de directorio" |

4. Clic en **Instalar**

### Verificar Instalación

**Opción A - Desde el Menú Inicio (gráfico):**
- Clic en Menú Inicio → Escribir "Visual Studio Code" → Clic en el ícono

**Opción B - Desde la terminal:**
- Abrir PowerShell y escribir:
```
code --version
```

> 📖 Fuente oficial: [VS Code Docs - Setup](https://code.visualstudio.com/docs/setup/setup-overview)

---

## Paso 4: MiKTeX (15-20 min)

### Descargar e Instalar

1. Ir a [miktex.org/download](https://miktex.org/download)
2. Clic en el botón **"Download"** para Windows
3. Ejecutar el instalador (`basic-miktex-x.x.x-x64.exe`)

### Opciones de Instalación

| Pantalla | Opción a Seleccionar |
|----------|---------------------|
| **Condiciones de copia** (Copying conditions) | Aceptar |
| **Ámbito de instalación** (Installation scope) | ⚠️ Seleccionar **"Install MiKTeX only for me"** (Instalar solo para mí) |
| **Carpeta de instalación** | Dejar por defecto |
| **Configuración** (Settings) | ⚠️ Seleccionar **"Yes"** para "Install missing packages on-the-fly" |

4. Clic en **Start** y esperar la instalación

### Actualización Post-Instalación (¡Importante!)

1. Abrir **Menú Inicio** → Buscar **"MiKTeX Console"** → Abrirlo
2. Si aparece un mensaje sobre actualizaciones, clic en **"Check for updates"**
3. Clic en **"Update now"** para instalar todas las actualizaciones

### Verificar Instalación

Abrir PowerShell:
```
pdflatex --version
```

Resultado esperado: `MiKTeX-pdfTeX 4.x (MiKTeX 23.x)` (o similar)

> 📖 Fuente oficial: [MiKTeX Manual - Installation](https://miktex.org/howto/install-miktex)

---

## Paso 5: Strawberry Perl (5 min)

### ¿Por qué se necesita?

MiKTeX no incluye Perl, pero `latexmk` (usado por LaTeX Workshop en VS Code) lo requiere.

> 📖 De LaTeX Workshop Wiki: *"MiKTeX is another lightweight distribution with a convenient automatic on-demand package install. Note, however, that for MiKTeX to work correctly with LaTeX Workshop, you need to install Perl."*

### Descargar e Instalar

1. Ir a [strawberryperl.com](https://strawberryperl.com/)
2. Clic en el enlace de descarga de la **"recommended version"** (64-bit)
3. Ejecutar el instalador (`strawberry-perl-5.x.x.x-64bit.msi`)
4. Seguir las opciones por defecto → Clic en **Install**

### Verificar Instalación

**⚠️ Cerrar y volver a abrir PowerShell**, luego ejecutar:
```
perl --version
```

Resultado esperado: `This is perl 5, version 38...` (o similar)

> 📖 Fuente oficial: [Strawberry Perl - About](https://strawberryperl.com/)

---

## Paso 6: Extensión LaTeX Workshop (2 min)

1. Abrir **Visual Studio Code**
2. Clic en el **ícono de Extensiones** en la barra lateral izquierda (o presionar `Ctrl+Shift+X`)
3. En la caja de búsqueda, escribir: **"LaTeX Workshop"**
4. Buscar la extensión de **James Yu** (debería ser el primer resultado)
5. Clic en **Install** (Instalar)

### Verificar Instalación

- Un **ícono de TeX** (se ve como "TEX") debería aparecer en la barra lateral izquierda
- Cuando abras un archivo `.tex`, verás opciones específicas de LaTeX

> 📖 Fuente oficial: [LaTeX Workshop - Marketplace](https://marketplace.visualstudio.com/items?itemName=James-Yu.latex-workshop)

---

## Prueba Final de Verificación (5 min)

### Crear un archivo de prueba

1. Abrir **Visual Studio Code**
2. Presionar `Ctrl+N` para crear un nuevo archivo
3. Presionar `Ctrl+S` para guardar, nombrarlo `test.tex`
4. Pegar este contenido:

```latex
\documentclass{article}
\begin{document}
Hola, \LaTeX!

Este es un documento de prueba para el taller.
\end{document}
```

5. Presionar `Ctrl+S` para guardar

### Compilar y Ver

- El documento debería compilarse **automáticamente** al guardar
- Para ver el PDF: Presionar `Ctrl+Alt+V` o clic en el **ícono de lupa** en la esquina superior derecha

### Resultado Esperado

Debería aparecer un PDF con:
```
Hola, LATEX!
Este es un documento de prueba para el taller.
```

Si ves esto, **¡todo está listo!** 🎉

---

## Solución de Problemas

| Problema | Solución |
|----------|----------|
| Comando `git` no encontrado | Reiniciar PowerShell, o reinstalar Git con la opción "Add to PATH" |
| `pdflatex` no encontrado | Reiniciar la computadora, o agregar MiKTeX al PATH manualmente |
| `perl` no encontrado | Reiniciar PowerShell después de instalar Strawberry Perl |
| LaTeX no compila en VS Code | Revisar MiKTeX Console por actualizaciones, reiniciar VS Code |
| El PDF no aparece | Esperar unos segundos, o presionar `Ctrl+Alt+V` |

---

## Rutas Importantes en Windows (Español)

Si necesitas encontrar archivos o carpetas, aquí están las rutas típicas:

| Elemento | Ruta en Windows |
|----------|-----------------|
| Carpeta de usuario | `C:\Users\TuNombre\` |
| Documentos | `C:\Users\TuNombre\Documentos\` o `C:\Users\TuNombre\Documents\` |
| Descargas | `C:\Users\TuNombre\Descargas\` o `C:\Users\TuNombre\Downloads\` |
| MiKTeX | `C:\Users\TuNombre\AppData\Local\Programs\MiKTeX\` |
| Git | `C:\Program Files\Git\` |

> **Nota**: En Windows en español, algunas carpetas como "Documentos" y "Descargas" pueden aparecer traducidas en el Explorador de archivos, pero la ruta real puede seguir siendo en inglés (Documents, Downloads).

---

## ¿Qué Sigue?

Como **colaborador**, en el taller:
1. Clonarás el repositorio desde GitHub
2. Editarás archivos localmente en VS Code
3. Harás commits y push de tus cambios
4. Crearás Pull Requests para revisión

¡Nos vemos en el taller! 🚀
