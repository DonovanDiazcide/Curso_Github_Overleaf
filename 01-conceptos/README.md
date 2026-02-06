# Parte 1: Conceptos Fundamentales

> **Duración**: 15 minutos  
> **Objetivo**: Entender qué hace cada herramienta y por qué las usamos juntas

---

## La Analogía del Documento Compartido

Imagina que estás escribiendo un artículo académico con dos colegas. Sin herramientas de colaboración, el proceso típico es:

```
📧 Email 1: "Aquí está el borrador" → articulo_v1.docx
📧 Email 2: "Mis cambios" → articulo_v2_jose.docx
📧 Email 3: "También edité" → articulo_v2_rodrigo.docx
📧 Email 4: "¿Cuál es la versión actual?" → articulo_v3_final.docx
📧 Email 5: "Cambios de último minuto" → articulo_v3_final_FINAL.docx
📧 Email 6: "..." → articulo_v3_final_FINAL_v2.docx
```

**Problemas:**
- ❌ Nadie sabe cuál es la versión actual
- ❌ Se pierden cambios al combinar archivos
- ❌ No hay registro de quién cambió qué
- ❌ Imposible volver a una versión anterior específica

**Solución**: Un sistema que maneje versiones automáticamente. Eso es **Git**. Pero Git es solo una de las herramientas que usaremos — a lo largo del taller construiremos un flujo completo combinando varias piezas.

---

## Lo que Haremos en Este Taller

Antes de entrar en detalles técnicos, aquí tienes el mapa del camino completo. Así sabrás en todo momento hacia dónde vamos:

| Parte | Qué haremos | Resultado |
|-------|-------------|----------|
| **Parte 1** (ahora) | Entender los conceptos y el flujo | Un modelo mental claro de cómo trabajaremos |
| **Parte 2** | Configurar Git, GitHub y VS Code | Tu computadora lista para colaborar |
| **Parte 3** | Practicar el flujo: editar → commit → push | Tu primer cambio integrado al artículo |
| **Parte 4** | Ramas, Pull Requests y resolver conflictos | Saber manejar cambios simultáneos |
| **Parte 5** | Práctica libre en el artículo | Experiencia real de escritura colaborativa |

> **En resumen**: al final del taller, todos habrán contribuido a un mismo artículo académico en LaTeX, usando un flujo profesional de colaboración.

---

## Un Día Típico de Trabajo (vista previa)

Antes de explicar cada herramienta por separado, veamos cómo se ve **un ciclo real de trabajo** de principio a fin. No te preocupes si no entiendes cada paso todavía — eso es exactamente lo que vamos a desglosar después:

```
 TU COMPUTADORA (local)                    EN LA NUBE
 ──────────────────────                    ──────────

 1. git pull                          ←── GitHub: traer cambios de otros

 2. Editar en VS Code
    Compilar PDF en tu máquina
    (vista previa instantánea)

 3. git add archivo.tex
    git commit -m "avance intro"      ──→ Guardar "foto" del avance

 4. git push                          ──→ GitHub: subir tu trabajo

 5. Sync en Overleaf (ocasional)      ──→ Verificación final en la nube
```

> **¿Algunos pasos te suenan desconocidos?** Es normal. Vamos a explicar cada pieza a continuación.

---

Ahora que ya tienes la imagen completa, vamos a entender cada pieza del rompecabezas. Empecemos por la más fundamental: el sistema que guarda el historial de tus archivos.

## ¿Qué es Git?

**Git es un sistema de control de versiones.** Piensa en él como una máquina del tiempo para tus archivos.

### Analogía: El Álbum de Fotos

Imagina que Git es como tomar **fotos instantáneas** de tu proyecto:

```
📸 Foto 1: "Estructura inicial del artículo"
    └── main.tex, introduction.tex (vacíos)

📸 Foto 2: "Agregué la introducción"
    └── introduction.tex (con contenido)

📸 Foto 3: "Corregí errores de la introducción"
    └── introduction.tex (corregido)

📸 Foto 4: "Agregué metodología"
    └── methods.tex (nuevo archivo)
```

Cada "foto" se llama **commit**. Git guarda:
- **Qué** cambió (archivos nuevos, modificados, eliminados)
- **Quién** hizo el cambio
- **Cuándo** se hizo
- **Por qué** (el mensaje que tú escribes)

### Comandos básicos (preview)

| Acción | Comando | Analogía |
|--------|---------|----------|
| Preparar archivos para la foto | `git add archivo.tex` | "Pon este archivo frente a la cámara" |
| Tomar la foto | `git commit -m "mensaje"` | "¡Click! Foto guardada con etiqueta" |
| Ver el álbum | `git log` | "Mostrar todas las fotos anteriores" |
| Volver a una foto anterior | `git checkout abc123` | "Volver al momento de esa foto" |

> 🎬 **Aquí veremos un gif animado mostrando cómo se ve `git add` → `git commit` en la terminal.** (Lo practicaremos en vivo en la Parte 3.)

---

Hasta aquí, Git guarda todo el historial en **tu computadora local**. Eso es poderoso, pero surge una pregunta natural: si cada quien tiene su propia copia, ¿cómo compartimos los cambios entre coautores? Ahí entra la siguiente pieza.

## ¿Qué es GitHub?

**GitHub es una plataforma en la nube para almacenar y compartir repositorios Git.**

### Analogía: Git vs GitHub

| Git | GitHub |
|-----|--------|
| El álbum de fotos en tu computadora | El álbum de fotos en la nube |
| Solo tú tienes acceso | Todos los colaboradores pueden ver y contribuir |
| Si se daña tu disco, pierdes todo | Backup automático en servidores de GitHub |

### ¿Por qué GitHub además de Git?

Git solo vive en tu computadora. Eso significa que:
- Si tu disco duro falla, **pierdes todo el historial**.
- Si quieres que un coautor vea tus cambios, tendrías que enviarle archivos manualmente (¿te suena al problema de los emails?).
- No hay forma de **revisar** los cambios de alguien antes de integrarlos a la versión oficial.

GitHub resuelve estos tres problemas al ser un **punto central en la nube** donde vive una copia compartida del repositorio:

| Sin GitHub (solo Git local) | Con GitHub |
|----------------------------|------------|
| Cada quien tiene su copia aislada | Todos acceden al mismo repositorio central |
| Para compartir cambios: emails, USB, etc. | Un comando (`git push`) sube tus cambios |
| No hay revisión de cambios ajenos | **Pull Requests**: alguien propone cambios y los demás los revisan antes de aceptarlos |
| Si se daña tu disco, pierdes todo | **Backup automático** en servidores de GitHub |
| No hay lista de tareas compartida | **Issues**: lista de pendientes visible para todos |

```
    ┌─────────────┐   ┌─────────────┐   ┌─────────────┐
    │  Mauricio   │   │ José Miguel │   │   Rodrigo   │
    │  (Windows)  │   │  (Windows)  │   │    (Mac)    │
    │ Copia local │   │ Copia local │   │ Copia local │
    └──────┬──────┘   └──────┬──────┘   └──────┬──────┘
              │               │               │
           push/pull       push/pull       push/pull
              │               │               │
              └───────────────┬───────────────┘
                              │
              ┌───────────────┴───────────────┐
              │    GitHub (en la nube)      │
              │                              │
              │  Repositorio compartido      │
              │  + Pull Requests             │
              │  + Issues                    │
              │  + Backup automático         │
              └───────────────────────────────┘
```

**Evidencia de uso académico:**
> Paper arXiv:2408.09344 (2024): *"GitHub is an effective platform for collaborative and reproducible laboratory research"*

---

Con Git guardamos el historial y con GitHub lo compartimos. Pero nuestro artículo está escrito en LaTeX, y necesitamos una manera de verificar que el documento **compila correctamente** para todos. Además, si solo trabajamos con Git y GitHub, dependemos de que cada quien tenga LaTeX bien instalado. Overleaf completa el flujo añadiendo una capa de verificación en la nube.

## ¿Qué es Overleaf?

**Overleaf es un editor de LaTeX en línea con compilador en la nube.**

### Ventajas de Overleaf

| Característica | Beneficio |
|----------------|-----------|
| **Compilación en la nube** | No necesitas instalar LaTeX (pero nosotros sí lo instalaremos para trabajar offline) |
| **Mismo PDF para todos** | Evita el "en mi computadora sí compila" |
| **Edición en navegador** | Acceso desde cualquier dispositivo |
| **Track Changes** | Ver qué cambió cada persona (con cuenta Premium) |

### ¿Por qué NO usar solo Overleaf?

Overleaf es excelente, pero tiene limitaciones para colaboración seria:

| Limitación | Problema |
|------------|----------|
| **Edición simultánea** | Pueden ocurrir conflictos si dos personas editan la misma línea |
| **Compilación simultánea** | Solo una persona puede compilar a la vez |
| **Sin revisión formal** | No hay Pull Requests para revisar cambios antes de integrarlos |
| **Historial limitado** | El historial de Overleaf es menos detallado que Git |
| **Dependencia de internet** | Sin conexión, no puedes trabajar |

> 💡 **La buena noticia**: en este taller vamos a resolver exactamente estas limitaciones. Al trabajar **offline con VS Code + Git** y usar Overleaf solo como capa de verificación final, nos quedamos con las ventajas de Overleaf (compilación en la nube, mismo PDF para todos) sin sufrir sus restricciones.

---

Ya conocemos cada herramienta por separado. Ahora veamos cómo encajan las piezas cuando trabajan juntas.

## El Flujo de Trabajo Combinado

Usamos **las tres herramientas juntas** para obtener lo mejor de cada una. El flujo empieza en **tu computadora** (trabajo local), sube a **GitHub** (repositorio compartido) y termina en **Overleaf** (verificación final):

```
───────────────────────────────────────────────────────────────
 PASO 1: TRABAJO LOCAL (donde todo empieza)
───────────────────────────────────────────────────────────────

   ┌───────────┐        ┌───────────┐        ┌───────────┐
   │ José M.   │        │ Mauricio  │        │ Rodrigo   │
   │ Windows   │        │ Windows   │        │ Mac       │
   │           │        │           │        │           │
   │ VS Code   │        │ VS Code   │        │ VS Code   │
   │ MiKTeX    │        │ MiKTeX    │        │ MacTeX    │
   │ Git       │        │ Git       │        │ Git       │
   │           │        │           │        │           │
   │ Compila   │        │ Compila   │        │ Compila   │
   │ LOCAL     │        │ LOCAL     │        │ LOCAL     │
   └─────┬─────┘        └─────┬─────┘        └─────┬─────┘
         │                    │                    │
         └──── push/pull ────┼──── push/pull ────┘
                              │
───────────────────────────────────────────────────────────────
 PASO 2: GITHUB (repositorio compartido)
───────────────────────────────────────────────────────────────
                              │
              ┌───────────────┴────────────────────────┐
              │    GitHub (Repositorio)                │
              │                                        │
              │  • Merge de cambios en main             │
              │  • Pull Requests para revisión          │
              │  • Backup automático en la nube         │
              │  • Historial de quién cambió qué       │
              └───────────────┬────────────────────────┘
                              │
                     sync (Mauricio)
                              │
───────────────────────────────────────────────────────────────
 PASO 3: OVERLEAF (verificación final)
───────────────────────────────────────────────────────────────
                              │
              ┌───────────────┴────────────────────────┐
              │  Overleaf (Owner: Mauricio Premium)    │
              │                                        │
              │  • Compilación en la nube              │
              │    (confirma que todo funciona)         │
              │  • Vista del PDF final                 │
              │  • Track Changes (Premium)              │
              └────────────────────────────────────────┘
```

### La Ventaja Clave: Trabajo Local

El corazón de este flujo es el **trabajo local**. Cada quien edita, compila y verifica en su propia máquina antes de compartir:

Cuando **todos usan solo Overleaf**:
- 🔴 Una persona compila → las demás esperan
- 🔴 Conexión lenta → compilación lenta
- 🔴 Sin internet → no puedes trabajar

Cuando **cada quien compila localmente**:
- 🟢 Todos compilan simultáneamente en su propia máquina
- 🟢 Preview instantáneo en VS Code (< 1 segundo)
- 🟢 Trabajas offline, sincronizas cuando tengas internet
- 🟢 Overleaf solo se usa como verificación final, después de que todo ya funciona localmente

---

## Resumen: ¿Quién hace qué?

| Herramienta | Función Principal | Cuándo la usamos |
|-------------|-------------------|------------------|
| **VS Code** | Editor de código + preview PDF | Todo el tiempo mientras escribimos |
| **MiKTeX/MacTeX** | Compilador de LaTeX | Automáticamente cada vez que guardamos en VS Code |
| **Git** | Control de versiones (local) | Cada vez que guardamos un avance (`commit`) |
| **GitHub** | Repositorio compartido | Para subir cambios (`push`), bajarlos (`pull`) y hacer merge en `main` |
| **Overleaf** | Verificación final en la nube | Después de fusionar cambios en `main` y confirmar que compila localmente, Mauricio sincroniza con Overleaf |

---

## El Ciclo Diario de Trabajo (paso a paso)

¿Recuerdas el flujo que vimos al inicio? Aquí lo detallamos con cada comando específico:

```
┌─────────────────────────────────────────────────────────────┐
│                    Tu día de trabajo                         │
└─────────────────────────────────────────────────────────────┘

1. INICIO DEL DÍA
   ┌─────────────────────────────────────┐
   │  git pull                           │  ← Obtener cambios que
   └─────────────────────────────────────┘    otros hicieron
                    ↓
2. DURANTE EL DÍA
   ┌─────────────────────────────────────┐
   │  Editar en VS Code                  │  ← Escribir, compilar, ver 
   │  (guarda cambios intermedios con    |    PDF
   |    Ctrl+S / Cmd+S)                  |    
   └─────────────────────────────────────┘
                    ↓
3. CUANDO TERMINAS UN AVANCE
   ┌─────────────────────────────────────┐
   │  git add archivo.tex                │  ← Preparar archivos para la foto
   │  git commit -m "descripción"        │  ← Tomar la "foto"
   └─────────────────────────────────────┘
                    ↓
4. FIN DEL DÍA (o cuando quieras compartir)
   ┌─────────────────────────────────────┐
   │  git push                           │  ← Subir a GitHub
   └─────────────────────────────────────┘
                    ↓
5. VERIFICACIÓN (ocasional)
   ┌─────────────────────────────────────┐
   │  Overleaf → Menu → GitHub →         │  ← Sincronizar y verificar
   │  "Pull GitHub changes into Overleaf"│     que compile en la nube
   └─────────────────────────────────────┘
```

---

## Conceptos Clave para el Taller

Antes de continuar, asegúrate de entender estos términos:

| Término | Significado | Analogía |
|---------|-------------|----------|
| **Repositorio (repo)** | Carpeta de proyecto con historial Git | Álbum de fotos completo |
| **Commit** | Snapshot guardado del proyecto | Una foto con fecha y descripción |
| **Push** | Subir commits a GitHub | Subir fotos a la nube |
| **Pull** | Bajar commits de GitHub | Descargar fotos que otros subieron |
| **Clone** | Copiar un repo de GitHub a tu computadora | Descargar el álbum completo por primera vez |
| **Branch (rama)** | Línea paralela de desarrollo | Copia del álbum para experimentar |
| **Merge** | Combinar cambios de una rama a otra | Integrar fotos de un álbum experimental al principal |
| **Pull Request (PR)** | Solicitud para integrar cambios | "Revisen mis fotos antes de agregarlas al álbum oficial" |

---

## Preguntas Frecuentes

### ¿Por qué no usar Google Docs?
Google Docs no soporta LaTeX. Para documentos académicos con ecuaciones, tablas complejas, y bibliografías automáticas, LaTeX es el estándar.

### ¿Necesito Overleaf Premium?
Solo el **owner del proyecto** (Mauricio) necesita Premium para la sincronización con GitHub. Los colaboradores no necesitan cuenta Premium.

### ¿Puedo editar directamente en Overleaf?
Sí, pero recomendamos editar localmente en VS Code para:
- Compilación más rápida
- Trabajo offline
- Mejor integración con Git

### ¿Qué pasa si no tengo internet?
Puedes seguir trabajando localmente. Git guarda todo en tu computadora. Cuando tengas internet, haces `push` para sincronizar.

---

## Referencias

- [GitHub Flow](https://docs.github.com/en/get-started/using-github/github-flow): Flujo oficial de GitHub
- [Overleaf Git Integration](https://www.overleaf.com/learn/how-to/Git_integration): Documentación oficial
- [Pro Git Book](https://git-scm.com/book/en/v2): Libro gratuito y oficial de Git
- [KRR Group LaTeX Collaboration Guide](https://github.com/krr-up/latex-collaboration-guide): Guía de la Universidad de Potsdam
- [Noble Lab: 10 Tips for Collaborative Writing](https://willfondrie.com/2024/02/10-tips-for-collaborative-writing-with-latex-and-github/): Universidad de Washington

---

**Siguiente**: [Parte 2 - Configuración Inicial →](../02-configuracion-inicial/README.md)
