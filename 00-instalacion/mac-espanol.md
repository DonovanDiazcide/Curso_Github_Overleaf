# Guía de Instalación
## macOS (Español)

> **Para**: Rodrigo (y cualquier persona con macOS)

> **Tiempo estimado**: 45-60 minutos (la descarga de MacTeX toma ~20-30 min)  
> **Tu rol**: Colaborador

---

## Resumen de Verificación

| Herramienta | Requerida | Verificación |
|-------------|-----------|--------------|
| Cuenta de GitHub | ✅ | Iniciar sesión en github.com |
| Git | ✅ | `git --version` |
| Visual Studio Code | ✅ | Se abre desde Launchpad o Aplicaciones |
| MacTeX | ✅ | `pdflatex --version` |
| Extensión LaTeX Workshop | ✅ | Aparece ícono en VS Code (aunque no necesariamente) |

> **Nota sobre Perl**: MacTeX **ya incluye Perl**, no necesitas instalarlo por separado (a diferencia de Windows).

> **💡 ¿Ya tienes GitHub, Git y VS Code?** Verifica rápidamente abriendo **Terminal** y ejecutando:
> ```bash
> git --version
> code --version
> ```
> Si ambos comandos muestran una versión y puedes iniciar sesión en [github.com](https://github.com), ¡continúa directamente con el **[Paso 4: MacTeX](#paso-4-mactex-20-30-min)**!
> 
> *Nota: Si `code --version` no funciona, abre VS Code manualmente desde Aplicaciones — el comando en terminal es opcional.*

---

## Paso 1: Cuenta de GitHub (2 min)

1. Ir a [github.com](https://github.com)
2. Clic en **"Sign up"** (esquina superior derecha)
3. Seguir el proceso de registro
4. **Importante**: Recuerda tu correo — lo necesitarás para configurar Git

> 📖 Fuente oficial: [GitHub Docs - Creating an account](https://docs.github.com/en/get-started/signing-up-for-github/signing-up-for-a-new-github-account)

---

## Paso 2: Git (5 min)

### Verificar si ya está instalado

Git viene **preinstalado** en la mayoría de las Mac. Abre **Terminal**:

**Cómo abrir Terminal:**
1. Presiona `Cmd + Espacio` para abrir Spotlight
2. Escribe "Terminal" y presiona Enter
3. O ve a **Finder** → **Aplicaciones** → **Utilidades** → **Terminal**

En Terminal, escribe:
```bash
git --version
```

### Si Git está instalado:
Verás algo como: `git version 2.39.0` — ¡pasa al siguiente paso!

### Si Git NO está instalado:
Aparecerá un diálogo que dice: **"The 'git' command requires the command line developer tools. Would you like to install the tools now?"**

1. Clic en **"Instalar"** (Install)
2. Espera a que se descarguen e instalen las herramientas (~5-10 min)
3. Cuando termine, verifica de nuevo con `git --version`

> 📖 Fuente oficial: [Git Book - Installing on macOS](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)

### Configurar Git (¡Esencial!)

En Terminal, ejecuta estos comandos (reemplaza con tu información):

```bash
git config --global user.name "Rodrigo"
git config --global user.email "tu.correo@ejemplo.com"
```

⚠️ **¡Usa el mismo correo que tu cuenta de GitHub!**

Verificar la configuración:
```bash
git config --list
```

---

## Paso 3: Visual Studio Code (5 min)

### Descargar e Instalar

1. Ir a [code.visualstudio.com](https://code.visualstudio.com/)
2. Clic en **"Download for macOS"** (el sitio detecta tu sistema automáticamente)
3. Se descargará un archivo `.zip`

### Instalación

1. **Busca el archivo descargado**: 
   - Abre **Finder** → **Descargas**
   - Busca `VSCode-darwin-universal.zip` (o similar)

2. **Descomprime el archivo**:
   - Doble clic en el archivo `.zip`
   - Aparecerá la aplicación **"Visual Studio Code"**

3. **Mueve a Aplicaciones**:
   - Arrastra el ícono de **Visual Studio Code** a la carpeta **Aplicaciones**
   - Esto es importante para que la app funcione correctamente

4. **Abre VS Code**:
   - Ve a **Finder** → **Aplicaciones** → doble clic en **Visual Studio Code**
   - O usa **Launchpad** y busca "Visual Studio Code"

### Primera vez que abres VS Code

macOS puede mostrar un diálogo: **"Visual Studio Code" es una app descargada de Internet. ¿Seguro que deseas abrirla?**
- Clic en **"Abrir"**

### Agregar VS Code al Dock (Recomendado)

1. Con VS Code abierto, haz clic derecho en su ícono en el Dock
2. Selecciona **Opciones** → **Mantener en el Dock**

### Habilitar comando `code` en Terminal (Opcional pero útil)

1. En VS Code, presiona `Cmd + Shift + P` para abrir la Paleta de Comandos
2. Escribe: `shell command`
3. Selecciona: **"Shell Command: Install 'code' command in PATH"**
4. Reinicia Terminal

Ahora puedes abrir carpetas desde Terminal con:
```bash
code .
```

> 📖 Fuente oficial: [VS Code Docs - macOS Setup](https://code.visualstudio.com/docs/setup/mac)

---

## Paso 4: MacTeX (20-30 min)

### ¿Por qué MacTeX?

MacTeX es la distribución de LaTeX recomendada para Mac. Incluye:
- TeX Live completo (todos los paquetes de LaTeX)
- Ghostscript
- Perl (necesario para `latexmk`)
- Aplicaciones GUI como TeXShop

> 📖 De la página oficial de MacTeX: *"MacTeX is a free TeX distribution for macOS... It includes the full TeX Live distribution."*

### Requisitos

- **macOS 10.14 (Mojave)** o superior
- ~6 GB de espacio en disco
- Conexión a internet estable (la descarga es grande)

### Descargar MacTeX

1. Ir a [tug.org/mactex](https://tug.org/mactex/)
2. Clic en el enlace **"MacTeX.pkg"** para descargar
   - Tamaño: aproximadamente **6 GB**
   - Tiempo de descarga: depende de tu conexión (10-30 min)

> 📖 Fuente oficial: [TUG - MacTeX Download](https://www.tug.org/mactex/mactex-download.html)

### Verificar la descarga (Opcional pero recomendado)

Para asegurarte de que el archivo se descargó correctamente:

1. Abre **Terminal**
2. Escribe `openssl md5 ` (con un espacio al final)
3. Arrastra el archivo `MacTeX.pkg` desde Finder a la ventana de Terminal
4. Presiona Enter
5. Compara el resultado con el checksum en la página de descarga

### Instalar MacTeX

1. **Abre el instalador**:
   - Ve a **Finder** → **Descargas**
   - Doble clic en **MacTeX.pkg**

2. **Pantallas del instalador**:

| Pantalla | Acción |
|----------|--------|
| **Bienvenido** (Welcome) | Clic en **Continuar** |
| **Léame** (Read Me) | Clic en **Continuar** |
| **Licencia** (License) | Clic en **Continuar** → **Aceptar** |
| **Tipo de instalación** | Clic en **Instalar** (puedes usar "Personalizar" si quieres, pero no es necesario) |
| **Autenticación** | Ingresa tu contraseña de administrador |

3. **Espera la instalación**:
   - La instalación toma aproximadamente **10-15 minutos**
   - **Nota importante**: Cerca del final, parecerá que no pasa nada. Esto es normal — el instalador está creando archivos de formato. ¡No lo cierres!

4. **Finalización**:
   - Verás el mensaje **"La instalación se realizó correctamente"** (Installation was successful)
   - Clic en **Cerrar**

> 📖 Fuente oficial: *"Installation on a recent Macintosh takes about ten minutes. Near the end of installation, there will be a pause when nothing seems to happen. During this pause, TeX Live creates format files."* — [TUG MacTeX](https://www.tug.org/mactex/mactex-download.html)

### Verificar Instalación

**⚠️ Cierra Terminal y ábrela de nuevo**, luego ejecuta:

```bash
pdflatex --version
```

Resultado esperado:
```
pdfTeX 3.141592653-2.6-1.40.26 (TeX Live 2024)
...
```

También verifica que Perl está disponible:
```bash
perl --version
```

### Ubicación de MacTeX

MacTeX se instala en:
- `/usr/local/texlive/` — Los binarios de TeX Live (la subcarpeta será del año de tu versión, ej: `2024`, `2025`)
- `/Applications/TeX/` — Aplicaciones GUI (TeXShop, BibDesk, etc.)

> 📖 Fuente: *"MacTeX installs TeX Live in /usr/local/texlive/. MacTeX completely configures TeX, so after installation it is ready to use."* — [TUG MacTeX](https://www.tug.org/mactex/mactex-download.html)

---

## Paso 5: Extensión LaTeX Workshop (2 min)

1. Abrir **Visual Studio Code**
2. Clic en el **ícono de Extensiones** en la barra lateral izquierda (el ícono de 3 cuadrados, o presiona `Cmd + Shift + X`)
3. En la caja de búsqueda, escribir: **"LaTeX Workshop"**
4. Buscar la extensión de **James Yu** (debería ser el primer resultado)
5. Clic en **Install** (Instalar)

### Verificar Instalación

Vamos a crear un archivo LaTeX sencillo para comprobar que todo funciona.

#### 1. Crear la carpeta del taller

1. Abre **Finder**
2. Navega a tu carpeta de **Documentos** (en la barra lateral de Finder, o ve a **Ir** → **Documentos**), o a la ubicación donde quieras guardar este curso
3. Haz clic derecho (o `Control + clic`) en un espacio vacío → **Nueva carpeta**
4. Nombra la carpeta **`curso_latex_github`**

> 💡 Esta carpeta será tu espacio de trabajo durante todo el taller.

#### 2. Abrir la carpeta en VS Code

1. Abre **Visual Studio Code**
2. Ve al menú **File** (Archivo) → **Open Folder...** (Abrir carpeta...)
3. Busca y selecciona la carpeta **`curso_latex_github`** que acabas de crear
4. Clic en **Open** (Abrir)
   - Si VS Code pregunta si confías en los autores de la carpeta, haz clic en **"Yes, I trust the authors"**

#### 3. Crear un archivo de prueba

1. En la **barra lateral izquierda** de VS Code verás el nombre de tu carpeta (`CURSO_LATEX_GITHUB`)
2. Pasa el mouse sobre el nombre de la carpeta — aparecerán unos íconos pequeños
3. Haz clic en el **ícono de archivo con un "+"** (Nuevo archivo / New File)
4. Escribe el nombre **`test.tex`** y presiona Enter
   - ⚠️ Asegúrate de que el nombre termine en `.tex`

#### 4. Escribir y compilar

1. Se abrirá el archivo `test.tex` en el editor. Copia y pega el siguiente contenido:

```latex
\documentclass{article}
\begin{document}
Hola, \LaTeX!

Este es un documento de prueba para el taller.
\end{document}
```

2. Presiona `Cmd + S` para guardar
3. **Compilar**: Presiona `Cmd + Option + B` (o también se compila **automáticamente** al guardar)
4. **Ver el PDF**: Presiona `Cmd + Option + V` o clic en el **ícono de lupa** en la esquina superior derecha

### Resultado Esperado

Debería aparecer un PDF con:
```
Hola, LATEX!
Este es un documento de prueba para el taller.
```

Si ves esto, **¡todo está listo!** 🎉

> **Si el documento no compila** después de 1-3 minutos:
> 1. Verifica que la extensión **LaTeX Workshop** de James Yu esté instalada en VS Code
> 2. Reinicia VS Code y vuelve a intentar
> 3. Instala las extensiones adicionales que aparecen en la siguiente captura desde el panel de Extensiones (el ícono de 3 cuadrados en la barra lateral izquierda, o `Cmd + Shift + X`). Luego intenta compilar de nuevo con `Cmd + Option + B` y ver el PDF con `Cmd + Option + V`:
>
> ![Extensiones recomendadas para LaTeX en VS Code](image.png)
>
> Después de seguir estos pasos, **¡todo está listo!** 🎉

> 📖 Fuente oficial: [LaTeX Workshop - Marketplace](https://marketplace.visualstudio.com/items?itemName=James-Yu.latex-workshop)

---

## Referencias Oficiales Consultadas

| Recurso | URL |
|---------|-----|
| MacTeX Download | [tug.org/mactex](https://tug.org/mactex/) |
| MacTeX Installation Guide | [tug.org/mactex/mactex-download.html](https://www.tug.org/mactex/mactex-download.html) |
| Git for Mac | [git-scm.com/book/en/v2/Getting-Started-Installing-Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git) |
| VS Code for macOS | [code.visualstudio.com/docs/setup/mac](https://code.visualstudio.com/docs/setup/mac) |
| LaTeX Workshop | [marketplace.visualstudio.com/items?itemName=James-Yu.latex-workshop](https://marketplace.visualstudio.com/items?itemName=James-Yu.latex-workshop) |
