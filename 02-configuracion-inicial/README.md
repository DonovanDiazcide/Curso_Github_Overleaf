# Parte 2: Configuración Inicial

> **Duración**: 20 minutos  
> **Objetivo**: Tener el proyecto listo para colaborar

> 💡 **Nota**: El orden de configuración inicial (Overleaf → GitHub → Local) es diferente al flujo diario de trabajo. Aquí partimos desde Overleaf porque ahí se crea la plantilla del proyecto. Una vez configurado todo, el flujo diario será : **Local → GitHub → Overleaf** (como vimos en la Parte 1).

---

## Resumen de esta parte

| Paso | Quién lo hace | Tiempo |
|------|---------------|--------|
| 2.1 Crear proyecto en Overleaf | Mauricio (Owner) | 3 min |
| 2.2 Conectar Overleaf a GitHub | Mauricio (Owner) | 3 min |
| 2.3 Compartir acceso en Overleaf | Mauricio (Owner) | 2 min |
| 2.4 Clonar repositorio localmente | Todos | 5 min |
| 2.5 Abrir proyecto en VS Code | Todos | 2 min |
| 2.6 Verificar compilación local | Todos | 5 min |

---

## 2.1 Crear proyecto en Overleaf (Mauricio)

> **Solo Mauricio** realiza este paso. Los demás observan.

### Opción A: Crear proyecto nuevo desde plantilla

1. Ir a [overleaf.com](https://www.overleaf.com) e iniciar sesión
2. Click en **"New Project"** (botón verde)
3. Seleccionar **"Blank Project"** o una plantilla de journal
4. Nombrar el proyecto: `articulo-taller-colaboracion`

### Opción B: Usar proyecto existente

Si Mauricio ya tiene un proyecto en Overleaf que quiere usar:
1. Abrir el proyecto existente
2. Continuar con el paso 2.2

---

## 2.2 Conectar Overleaf a GitHub (Mauricio)

> **Requisito**: Cuenta Overleaf Premium o institucional

### Pasos:

1. Dentro del proyecto en Overleaf, click en **"Menu"** (esquina superior izquierda)

2. En la sección "Sync", buscar **"GitHub"**

3. Click en **"Create a GitHub Repository"**
   - Si es la primera vez, Overleaf pedirá autorización para conectar con GitHub
   - Autorizar la conexión

4. Configurar el repositorio:
   | Campo | Valor sugerido |
   |-------|----------------|
   | **Repository name** | `articulo-taller-colaboracion` |
   | **Visibility** | Private (o Public si prefieren) |

5. Click en **"Create"**

6. **¡Listo!** El proyecto ahora está sincronizado con GitHub

### Verificar la conexión

- En el menú de Overleaf, ahora verán opciones:
  - **"Push Overleaf changes to GitHub"** — Subir cambios de Overleaf a GitHub
  - **"Pull GitHub changes into Overleaf"** — Traer cambios de GitHub a Overleaf

> 📖 Fuente oficial: [Overleaf GitHub Synchronization](https://www.overleaf.com/learn/how-to/GitHub_Synchronization)

---

## 2.3 Compartir acceso (Mauricio)

Mauricio debe compartir acceso de dos formas:

### A. Compartir en Overleaf (opcional, para edición en navegador)

1. En el proyecto, click en **"Share"** (botón arriba a la derecha)
2. Ingresar los correos de José Miguel y Rodrigo
3. Seleccionar permisos: **"Can Edit"**
4. Click en **"Share"**

> **Nota**: Con Overleaf Premium, pueden invitar colaboradores ilimitados.

### B. Compartir en GitHub (necesario para el flujo Git)

1. Ir al repositorio en GitHub: `github.com/mauricio/articulo-taller-colaboracion`
2. Click en **"Settings"** → **"Collaborators"**
3. Click en **"Add people"**
4. Buscar por username o correo de GitHub de José Miguel y Rodrigo
5. Enviar invitación

José Miguel y Rodrigo deben:
1. Revisar su correo o notificaciones de GitHub
2. Aceptar la invitación

---

## 2.4 Clonar el repositorio (Todos)

> **Todos** realizan este paso en su computadora.

### Obtener la URL del repositorio

1. Ir al repositorio en GitHub
2. Click en el botón verde **"Code"**
3. Copiar la URL HTTPS (se ve así: `https://github.com/mauricio/articulo-taller-colaboracion.git`)

### Elegir dónde guardar el proyecto

Decidan en qué carpeta quieren tener el proyecto. Recomendaciones:

| Sistema | Carpeta sugerida |
|---------|------------------|
| Windows | `C:\Users\TuNombre\Documents\proyectos\` |
| macOS | `~/Documents/proyectos/` |

### Clonar desde terminal

<details>
<summary><strong>🪟 Windows (PowerShell)</strong></summary>

```powershell
# Navegar a la carpeta donde quieres el proyecto
cd C:\Users\TuNombre\Documents\proyectos

# Clonar el repositorio
git clone https://github.com/mauricio/articulo-taller-colaboracion.git

# Entrar a la carpeta del proyecto
cd articulo-taller-colaboracion
```

**¿Cómo abrir PowerShell?**
- Presiona `Win + X` → Selecciona "Windows PowerShell"
- O busca "PowerShell" en el menú Inicio

</details>

<details>
<summary><strong>🍎 macOS (Terminal)</strong></summary>

```bash
# Navegar a la carpeta donde quieres el proyecto
cd ~/Documents/proyectos

# Clonar el repositorio
git clone https://github.com/mauricio/articulo-taller-colaboracion.git

# Entrar a la carpeta del proyecto
cd articulo-taller-colaboracion
```

**¿Cómo abrir Terminal?**
- Presiona `Cmd + Espacio`, escribe "Terminal", presiona Enter
- O vayan a Finder → Aplicaciones → Utilidades → Terminal

</details>

### Verificar que se clonó correctamente

```bash
# Ver los archivos
ls

# Ver el estado de Git
git status
```

Deberían ver los archivos `.tex` del proyecto y un mensaje como:
```
On branch main
Your branch is up to date with 'origin/main'.
nothing to commit, working tree clean
```

---

## 2.5 Abrir el proyecto en VS Code (Todos)

Hay **dos formas** de abrir el proyecto en VS Code:

### Opción A: Desde la interfaz gráfica (recomendada para principiantes)

<details>
<summary><strong>🪟 Windows</strong></summary>

1. Abrir **Visual Studio Code** desde el menú Inicio
2. Click en **"File"** → **"Open Folder..."** (o en español: **"Archivo"** → **"Abrir carpeta..."**)
3. Navegar a `C:\Users\TuNombre\Documents\proyectos\articulo-taller-colaboracion`
4. Click en **"Seleccionar carpeta"** (o "Select Folder")

</details>

<details>
<summary><strong>🍎 macOS</strong></summary>

1. Abrir **Visual Studio Code** desde el Launchpad o Finder → Aplicaciones
2. Click en **"File"** → **"Open Folder..."** (o **"Archivo"** → **"Abrir carpeta..."**)
3. Navegar a `Documents/proyectos/articulo-taller-colaboracion`
4. Click en **"Open"** (Abrir)

</details>

### Opción B: Desde la terminal (más rápido una vez que te acostumbras)

```bash
# Asegúrate de estar en la carpeta del proyecto
cd articulo-taller-colaboracion

# Abrir VS Code en esta carpeta
code .
```

> **Nota**: El punto (`.`) significa "la carpeta actual".

### Verificar que VS Code reconoce el proyecto

Una vez abierto, deberían ver:
- 📁 La estructura de archivos en el panel izquierdo (Explorer)
- 📝 Pueden hacer click en cualquier archivo `.tex` para editarlo
- 🔀 El ícono de Git en la barra lateral (Source Control) - indica que VS Code detectó el repositorio

---

## 2.6 Verificar compilación local (Todos)

### Abrir el archivo principal

1. En VS Code, click en `main.tex` (o el archivo principal del proyecto)
2. El archivo se abrirá en el editor

### Compilar el documento

**Opción A: Automático al guardar**
- Simplemente guarda el archivo: `Ctrl+S` (Windows) o `Cmd+S` (Mac)
- LaTeX Workshop compilará automáticamente

**Opción B: Manual**
- Presiona `Ctrl+Alt+B` (Windows) o `Cmd+Option+B` (Mac)
- O click en el ícono ▶️ de LaTeX en la barra lateral izquierda → "Build LaTeX project"

### Ver el PDF

- Presiona `Ctrl+Alt+V` (Windows) o `Cmd+Option+V` (Mac)
- O click en el ícono de lupa 🔍 en la esquina superior derecha del editor

### ¿Qué hacer si no compila?

| Problema | Solución |
|----------|----------|
| "Recipe terminated with error" | Revisar el panel "Output" → "LaTeX Workshop" para ver el error específico |
| "pdflatex not found" | MiKTeX/MacTeX no está en PATH. Reiniciar VS Code o la computadora |
| Falta un paquete | MiKTeX debería instalarlo automáticamente. Si no, abrir MiKTeX Console y buscar el paquete |
| El PDF no aparece | Esperar unos segundos. Si no aparece, presionar `Ctrl+Alt+V` / `Cmd+Option+V` |

---

## Caso especial: Conectar un proyecto LOCAL existente a GitHub

> **Escenario**: Mauricio tiene archivos LaTeX en su computadora (no en Overleaf) y quiere subirlos a GitHub para colaborar.

### Paso 1: Crear repositorio vacío en GitHub

1. Ir a [github.com](https://github.com) → Click en **"+"** → **"New repository"**
2. Configurar:
   - **Repository name**: `mi-articulo`
   - **Description**: (opcional)
   - **Visibility**: Private o Public
   - ⚠️ **NO marcar** "Add a README file"
   - ⚠️ **NO seleccionar** .gitignore ni license
3. Click en **"Create repository"**

GitHub mostrará instrucciones. Usaremos las de "…or push an existing repository from the command line".

### Paso 2: Inicializar Git en la carpeta local

<details>
<summary><strong>🪟 Windows (PowerShell)</strong></summary>

```powershell
# Navegar a la carpeta de su proyecto
cd C:\Users\TuNombre\Documents\mi-articulo

# Inicializar Git
git init

# Agregar todos los archivos
git add .

# Crear el primer commit
git commit -m "Versión inicial del artículo"
```

</details>

<details>
<summary><strong>🍎 macOS (Terminal)</strong></summary>

```bash
# Navegar a la carpeta de su proyecto
cd ~/Documents/mi-articulo

# Inicializar Git
git init

# Agregar todos los archivos
git add .

# Crear el primer commit
git commit -m "Versión inicial del artículo"
```

</details>

### Paso 3: Conectar con GitHub y subir

```bash
# Conectar con el repositorio remoto (reemplacen con su URL)
git remote add origin https://github.com/TU_USUARIO/mi-articulo.git

# Renombrar la rama a 'main' (por convención moderna)
git branch -M main

# Subir el proyecto a GitHub
git push -u origin main
```

### Paso 4: Verificar en GitHub

1. Ir a `github.com/TU_USUARIO/mi-articulo`
2. Deberían ver todos sus archivos `.tex`

### Paso 5: Conectar con Overleaf (opcional)

Si quieren que el proyecto también esté en Overleaf:

1. En Overleaf, click en **"New Project"** → **"Import from GitHub"**
2. Seleccionar el repositorio que acabaron de crear
3. ¡Listo! Ahora tienen el proyecto en ambos lugares

---

## Resumen de comandos

| Acción | Comando |
|--------|---------|
| Clonar repositorio | `git clone URL` |
| Ver estado | `git status` |
| Ver archivos | `ls` (Mac/Linux) o `dir` (Windows) |
| Abrir VS Code | `code .` |
| Inicializar repo nuevo | `git init` |
| Conectar a GitHub | `git remote add origin URL` |
| Subir por primera vez | `git push -u origin main` |

---

## Checkpoint ✅

Antes de continuar a la Parte 3, verifica que:

- [ ] El proyecto está clonado en su computadora
- [ ] Pueden abrir el proyecto en VS Code
- [ ] El documento compila localmente (ven el PDF)
- [ ] Git reconoce el repositorio (`git status` funciona)

Si algo falla, pide ayuda antes de continuar.

---

**Anterior**: [← Parte 1 - Conceptos](../01-conceptos/README.md)

**Siguiente**: [Parte 3 - Flujo Básico →](../03-flujo-basico/README.md)
