# Guía Paso a Paso para Principiantes: Primera Contribución

> **Para:** Académicos sin experiencia previa en Git
> **Tiempo:** 30-45 minutos
> **Resultado:** Tu primera contribución a un artículo colaborativo

---

## 🎯 Lo que Lograrás

Al final de esta guía, habrás:
1. ✅ Editado un archivo LaTeX
2. ✅ Guardado tu cambio en Git (commit)
3. ✅ Compartido tu cambio en GitHub (push)
4. ✅ Visto tu contribución en el proyecto

---

## 📋 Prerrequisitos

Antes de empezar, asegúrate de haber completado:
- [ ] Instalación de Git
- [ ] Instalación de VS Code
- [ ] Instalación de MiKTeX (Windows) o MacTeX (Mac)
- [ ] Configuración de Git con tu nombre y email
- [ ] Clonación del repositorio en tu computadora

> 💡 Si no has hecho esto, ve primero a las guías de instalación en `00-instalacion/`

---

## 🚀 Parte 1: Abrir el Proyecto

### Paso 1.1: Abrir VS Code

**Windows:**
1. Presiona la tecla de Windows
2. Escribe "Visual Studio Code"
3. Presiona Enter

**macOS:**
1. Presiona Cmd + Espacio (Spotlight)
2. Escribe "Visual Studio Code"
3. Presiona Enter

### Paso 1.2: Abrir la carpeta del proyecto

En VS Code:

1. Click en **File** (Archivo) → **Open Folder** (Abrir carpeta)
2. Navega a donde clonaste el repositorio
3. Selecciona la carpeta `Curso_Github_Overleaf`
4. Click en **Select Folder** (Seleccionar carpeta)

**Deberías ver:**
- En el panel izquierdo: lista de carpetas y archivos del proyecto
- En la parte inferior: una barra azul (es la barra de estado)

### Paso 1.3: Abrir la terminal integrada

La terminal es donde escribirás los comandos de Git.

**Windows:** Presiona `` Ctrl + ` `` (Ctrl + acento grave)  
**macOS:** Presiona `` Cmd + ` ``

**O con el menú:**
1. Click en **Terminal** en la barra superior
2. Click en **New Terminal**

**Deberías ver:**
- Un panel en la parte inferior de VS Code
- Un prompt que muestra tu ubicación (algo como `C:\Users\tu-nombre\...` en Windows o `/Users/tu-nombre/...` en Mac)

---

## 📝 Parte 2: Hacer tu Primera Edición

### Paso 2.1: Encontrar el archivo a editar

En el panel izquierdo de VS Code (Explorer):

1. Click en la carpeta `articulo-prueba`
2. Click en la carpeta `sections`
3. Click en el archivo `introduction.tex`

El archivo se abrirá en el editor central.

**Verás código LaTeX como:**
```latex
\section{Introducción}

Este es el texto inicial de la introducción.
...
```

### Paso 2.2: Hacer un cambio simple

Vamos a agregar un párrafo nuevo. 

**Encuentra esta línea:**
```latex
\section{Introducción}
```

**Justo después de esa línea, agrega este texto:**
```latex

% Mi primera contribución
Este es un nuevo párrafo que estoy agregando como prueba de mi primera contribución al proyecto.
```

**Debe verse así:**
```latex
\section{Introducción}

% Mi primera contribución
Este es un nuevo párrafo que estoy agregando como prueba de mi primera contribución al proyecto.

[El resto del contenido existente...]
```

### Paso 2.3: Guardar el archivo

**Windows:** Presiona `Ctrl + S`  
**macOS:** Presiona `Cmd + S`

**Verás:**
- El punto blanco al lado del nombre del archivo (en la pestaña) desaparece
- Esto significa que el archivo está guardado

---

## 📸 Parte 3: Tu Primer Commit (Guardar una "Foto")

### Paso 3.1: Ver qué cambió

En la terminal integrada, escribe:

```bash
git status
```

Presiona Enter.

**Verás algo como:**
```
On branch main
Changes not staged for commit:
  modified:   articulo-prueba/sections/introduction.tex
```

**¿Qué significa esto?**
- "On branch main" = Estás en la rama principal
- "modified: articulo-prueba/sections/introduction.tex" = Ese archivo cambió

### Paso 3.2: Preparar el archivo (git add)

Ahora le diremos a Git: "Incluye este archivo en la próxima foto".

En la terminal, escribe:

```bash
git add articulo-prueba/sections/introduction.tex
```

Presiona Enter.

**No verás ningún mensaje**. Eso es normal y significa que funcionó.

### Paso 3.3: Verificar que esté preparado

Escribe de nuevo:

```bash
git status
```

Ahora verás:
```
On branch main
Changes to be committed:
  modified:   articulo-prueba/sections/introduction.tex
```

**"Changes to be committed"** significa: "Este archivo está listo para la foto".

### Paso 3.4: Tomar la foto (git commit)

Ahora guardamos la "foto" con una descripción de qué hicimos.

Escribe:

```bash
git commit -m "Agregué mi primer párrafo en la introducción"
```

**Importante:**
- Las comillas `" "` son necesarias
- El mensaje dentro de las comillas debe describir tu cambio
- Usa un mensaje claro, no solo "cambios" o "prueba"

Presiona Enter.

**Verás:**
```
[main abc1234] Agregué mi primer párrafo en la introducción
 1 file changed, 2 insertions(+)
```

**¡Felicidades! 🎉** Acabas de hacer tu primer commit.

---

## 🌐 Parte 4: Compartir tu Cambio en GitHub (Push)

### Paso 4.1: Subir tu commit

Ahora vamos a compartir tu cambio con el resto del equipo.

En la terminal, escribe:

```bash
git push origin main
```

Presiona Enter.

**La primera vez:**
- Se abrirá tu navegador pidiendo que autorices a Git
- Click en "Authorize" o "Permitir"
- Puede pedirte tu contraseña de GitHub

**Después de autenticarte, verás:**
```
Enumerating objects: 7, done.
Counting objects: 100% (7/7), done.
...
To https://github.com/DonovanDiazcide/Curso_Github_Overleaf.git
   abc1234..def5678  main -> main
```

**¡Éxito! 🚀** Tu cambio ahora está en GitHub.

---

## ✅ Parte 5: Verificar en GitHub

### Paso 5.1: Abrir el repositorio en el navegador

1. Abre tu navegador
2. Ve a: `https://github.com/DonovanDiazcide/Curso_Github_Overleaf`
3. Deberías ver tu commit en la lista de commits recientes

### Paso 5.2: Ver tu commit

1. Click en el mensaje de tu commit en la página principal
2. Verás exactamente qué líneas agregaste (en verde)
3. Verás tu nombre y la hora del commit

**Esto es histórico:** Quedó registrado que TÚ hiciste este cambio en este momento.

---

## 🎓 Lo que Aprendiste

| Concepto | Lo que Hace | Comando |
|----------|-------------|---------|
| **git status** | Te dice qué archivos cambiaron | `git status` |
| **git add** | Prepara archivos para el commit | `git add archivo.tex` |
| **git commit** | Guarda una "foto" de tu trabajo | `git commit -m "mensaje"` |
| **git push** | Sube tus commits a GitHub | `git push origin main` |

---

## 🔄 El Flujo Completo (Resumen)

```
┌─────────────────────────────────────────────────────────┐
│  1. Abrir VS Code y el proyecto                          │
│     → File > Open Folder                                 │
└─────────────────────────────────────────────────────────┘
                        ↓
┌─────────────────────────────────────────────────────────┐
│  2. Editar el archivo                                    │
│     → Encontrar archivo en Explorer                      │
│     → Hacer cambios                                      │
│     → Guardar (Ctrl+S / Cmd+S)                          │
└─────────────────────────────────────────────────────────┘
                        ↓
┌─────────────────────────────────────────────────────────┐
│  3. Ver cambios en terminal                              │
│     → git status                                         │
└─────────────────────────────────────────────────────────┘
                        ↓
┌─────────────────────────────────────────────────────────┐
│  4. Preparar archivo                                     │
│     → git add archivo.tex                                │
└─────────────────────────────────────────────────────────┘
                        ↓
┌─────────────────────────────────────────────────────────┐
│  5. Hacer commit                                         │
│     → git commit -m "mensaje descriptivo"                │
└─────────────────────────────────────────────────────────┘
                        ↓
┌─────────────────────────────────────────────────────────┐
│  6. Subir a GitHub                                       │
│     → git push origin main                               │
└─────────────────────────────────────────────────────────┘
                        ↓
┌─────────────────────────────────────────────────────────┐
│  7. Verificar en el navegador                            │
│     → github.com/DonovanDiazcide/Curso_Github_Overleaf  │
└─────────────────────────────────────────────────────────┘
```

---

## ❓ Preguntas Frecuentes

### ¿Qué pasa si me equivoco en el commit?

No te preocupes, puedes hacer otro commit corrigiendo el error. Todos los commits quedan guardados.

### ¿Puedo deshacer un commit?

Sí, pero por ahora es mejor hacer un nuevo commit con la corrección. En el workshop avanzado aprenderás cómo deshacer cambios.

### ¿Qué pasa si otro compañero cambió el mismo archivo?

Cuando hagas `git push`, Git te dirá que primero debes hacer `git pull` para obtener los cambios de los demás. Luego podrás subir los tuyos.

### ¿Cuándo debo hacer commit?

Haz commit cada vez que completes una unidad lógica de trabajo. Ejemplos:
- ✅ Agregaste un párrafo completo
- ✅ Corregiste todos los errores de una sección
- ✅ Agregaste una tabla o figura
- ❌ No: después de cada letra que escribes

### ¿Puedo hacer commit sin hacer push?

Sí. Puedes hacer varios commits locales y luego hacer un solo push con todos ellos. Pero es buena práctica hacer push al menos una vez al día.

---

## 🆘 Problemas Comunes

### "git: command not found"

**Causa:** Git no está instalado o no está en el PATH.

**Solución:**
1. Verifica que instalaste Git
2. Reinicia VS Code
3. En Windows: verifica que Git esté en las Variables de Entorno

### "fatal: not a git repository"

**Causa:** No estás en la carpeta correcta del proyecto.

**Solución:**
1. En la terminal, escribe `pwd` (Mac) o `cd` (Windows) para ver dónde estás
2. Asegúrate de haber abierto la carpeta correcta en VS Code

### "Permission denied (publickey)"

**Causa:** GitHub no reconoce tu autenticación.

**Solución:**
1. La primera vez, se abrirá el navegador para autorizar
2. Sigue las instrucciones en pantalla
3. Si el problema persiste, consulta la guía de configuración inicial

### El push fue rechazado

**Causa:** Alguien más subió cambios antes que tú.

**Solución:**
```bash
# Primero, obtén los cambios de otros
git pull origin main

# Luego, sube los tuyos
git push origin main
```

---

## 🎯 Próximos Pasos

Ahora que dominas el flujo básico, estás listo para:

1. **Aprender sobre ramas** (branches)
   - Trabaja en tu propia copia sin afectar a otros
   - Ver: `WORKFLOW-COLABORATIVO.md` sección "Trabajo con Ramas"

2. **Hacer un Pull Request**
   - Propón cambios para que otros los revisen
   - Ver: `WORKFLOW-COLABORATIVO.md` sección "Pull Requests"

3. **Resolver conflictos**
   - Qué hacer cuando dos personas editan lo mismo
   - Ver: `PRUEBAS-VALIDACION.md` sección "Tests de Conflictos"

---

## 📚 Recursos Adicionales

- **Guía Rápida:** `guia-rapida.md` (una página con todos los comandos)
- **Workflow Completo:** `WORKFLOW-COLABORATIVO.md` (documentación avanzada)
- **Pro Git Book:** https://git-scm.com/book/es/v2 (libro oficial, gratis)
- **GitHub Skills:** https://skills.github.com/ (tutoriales interactivos)

---

**¡Felicidades por completar tu primera contribución! 🎉**

Ahora eres oficialmente parte de la colaboración académica moderna.
