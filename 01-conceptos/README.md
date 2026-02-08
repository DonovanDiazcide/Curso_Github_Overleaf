# Parte 1: Conceptos Fundamentales

> **Duración**: 15 minutos  
> **Objetivo**: Entender qué hace cada herramienta y por qué las usamos juntas

---

## La Analogía del Documento Compartido

Imaginen que están escribiendo un artículo académico con dos colegas. Sin herramientas de colaboración, el proceso típico es:

```
📧 Email 1: "Aquí está el borrador" → articulo_v1.docx
📧 Email 2: "Mis cambios" → articulo_v2_jose.docx
📧 Email 3: "También edité" → articulo_v2_rodrigo.docx
📧 Email 4: "¿Cuál es la versión actual?" → articulo_v3_final.docx
📧 Email 5: "Cambios de último minuto" → articulo_v3_final_FINAL.docx
📧 Email 6: "..." → articulo_v3_final_FINAL_v2.docx
```

Ahora bien, muchos de ustedes ya usan **Overleaf** para colaborar. Parece mejor que los emails, ¿verdad? Veamos cómo se ve un flujo típico cuando tres personas (José Miguel, Rodrigo y Mauricio) trabajan en el mismo proyecto de Overleaf:

```
🌐 Overleaf - Proyecto compartido: "Artículo_Experimento_2024"

📝 José Miguel (lunes 9:00 AM): Edita la introducción
📝 Rodrigo (lunes 10:30 AM): Modifica la misma introducción sin saber que José Miguel ya la editó
⚠️ Conflicto: ¿Cuál versión mantener? Se pierden párrafos de José Miguel

📝 Mauricio (lunes 2:00 PM): Intenta compilar el documento... espera... espera...
⚠️ Alguien más está compilando. Tiene que esperar

📝 José Miguel (martes): "¿Quién cambió la metodología? No recuerdo que discutiéramos esto"
⚠️ El historial de Overleaf muestra cambios, pero no hay contexto del por qué

📝 Rodrigo (miércoles, sin internet): "Necesito seguir trabajando..."
⚠️ Sin conexión, no puede acceder al documento

📝 Mauricio (jueves): "Alguien rompió la compilación, ¿quién fue?"
⚠️ El documento no compila y no es claro qué cambio específico causó el problema
```

**Problemas comunes en Overleaf:**
- ❌ Conflictos cuando dos personas editan el mismo archivo simultáneamente
- ❌ Solo una persona puede compilar a la vez
- ❌ Sin internet, no pueden trabajar
- ❌ Historial limitado: difícil saber el "por qué" de cada cambio
- ❌ No hay revisión formal antes de integrar cambios importantes

**Solución**: Un sistema que gestione versiones **intencionalmente** (ustedes deciden cuándo guardar una "versión" significativa) y permita revisión colaborativa. Eso es **Git + GitHub + VS Code**, manteniendo Overleaf solo para verificación final. A lo largo del taller construiremos un flujo completo combinando varias piezas.

---

## Lo que Haremos en Este Taller

Antes de entrar en detalles técnicos, aquí tienen el mapa del camino completo. Así sabrán en todo momento hacia dónde vamos:

| Parte | Qué haremos | Resultado |
|-------|-------------|----------|
| **Parte 1** (ahora) | Entender los conceptos y el flujo | Un modelo mental claro de cómo trabajaremos |
| **Parte 2** | Configurar Git, GitHub y VS Code | Sus computadoras listas para colaborar |
| **Parte 3** | Practicar el flujo: editar → commit → push | Su primer cambio integrado al artículo |
| **Parte 4** | Ramas, Pull Requests y resolver conflictos | Saber manejar cambios simultáneos |
| **Parte 5** | Práctica libre en el artículo | Experiencia real simulada de escritura colaborativa |

> **En resumen**: al final del taller, todos habrán contribuido a un mismo artículo académico en LaTeX, usando un flujo profesional de colaboración.

---

## Un Día Típico de Trabajo (vista previa)

Antes de explicar cada herramienta por separado, veamos cómo se ve **un ciclo real de trabajo** de principio a fin. No se preocupen si no entienden cada paso todavía — eso es exactamente lo que vamos a desglosar después:

```
 SU COMPUTADORA (local)                    EN LA NUBE
 ──────────────────────                    ──────────

 1. git pull                          ←── GitHub: traer cambios de otros

 2. git checkout -b nueva-rama        ──→ Crear rama para su trabajo

 3. Editar en VS Code
    Compilar PDF en su máquina
    (vista previa instantánea)

 4. git add archivo.tex
    git commit -m "avance intro"      ──→ Guardar "foto" del avance

 5. git push                          ──→ GitHub: subir su trabajo

 6. Crear Pull Request                ──→ Solicitar revisión de cambios

 7. Revisión y merge                  ──→ Integrar cambios aprobados

 8. Resolver conflictos (si hay)      ──→ Fusionar cambios superpuestos

 9. Sync en Overleaf (ocasional)      ──→ Verificación final en la nube
```

> **¿Algunos pasos les suenan desconocidos?** Es normal. Vamos a explicar cada pieza a continuación.

---

Ahora que ya tienen la imagen completa, vamos a entender cada pieza del rompecabezas. Empecemos por la más fundamental: el sistema que guarda el historial de sus archivos.

## ¿Qué es Git?

**Git es un sistema de control de versiones.** Piensen en él como un álbum de fotos de su proyecto.

### Analogía: El Álbum de Fotos con Máquina del Tiempo

Imaginen que Git es como tomar **fotos instantáneas** de su proyecto. Cada foto captura un momento específico:

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
| Preparar archivos para la foto | `git add archivo.tex` | "Pongan este archivo frente a la cámara" |
| Tomar la foto | `git commit -m "mensaje"` | "¡Click! Foto guardada con etiqueta" |
| Ver el álbum | `git log` | "Mostrar todas las fotos anteriores" |
| Volver a una foto anterior | `git checkout abc123` | "Usar la máquina del tiempo para volver al momento de esa foto" |

> 🎬 **Aquí veremos un gif animado mostrando cómo se ve `git add` → `git commit` en la terminal.** (Lo practicaremos en vivo en la Parte 3.)

**La metáfora completa**: Git es como un **álbum de fotos** donde guardan momentos importantes de su proyecto. Cuando necesitan volver a una versión anterior, usan una **máquina del tiempo** para regresar al momento cuando se tomó esa foto específica.

---

Hasta aquí, Git guarda todo el historial en **su computadora local**. Eso es poderoso, pero surge una pregunta natural: si cada quien tiene su propia copia, ¿cómo compartimos los cambios entre coautores? Ahí entra la siguiente pieza.

---

## 🧠 Trivia 1: Comprensión de Git

Antes de continuar, pongamos a prueba lo que han aprendido hasta ahora:

**Pregunta 1:** ¿Qué es un "commit" en Git?
- A) Una carpeta donde guardas tus archivos
- B) Un comando para subir archivos a internet
- C) Una "foto" o snapshot de tu proyecto en un momento específico
- D) Un programa para editar código

**Pregunta 2:** Si quieres volver a una versión anterior de tu proyecto, ¿qué analogía describe mejor lo que hace Git?
- A) Una impresora que copia documentos
- B) Una máquina del tiempo que te lleva al momento de esa "foto"
- C) Un editor de texto
- D) Un servidor en la nube

**Pregunta 3:** ¿Dónde guarda Git el historial de cambios inicialmente?
- A) En la nube automáticamente
- B) En tu computadora local
- C) En Overleaf
- D) En Google Drive

---

### ✅ Respuestas:

**Pregunta 1: C) Una "foto" o snapshot de tu proyecto en un momento específico**  
*Explicación:* Un commit es como tomar una fotografía instantánea de tu proyecto. Captura el estado exacto de tus archivos en ese momento, junto con un mensaje describiendo qué cambios hiciste, quién los hizo y cuándo.

**Pregunta 2: B) Una máquina del tiempo que te lleva al momento de esa "foto"**  
*Explicación:* Git mantiene un álbum de fotos (commits) de tu proyecto. Cuando quieres volver a una versión anterior, es como usar una máquina del tiempo para regresar al momento exacto cuando se tomó esa foto. Todos tus archivos vuelven al estado que tenían en ese commit.

**Pregunta 3: B) En tu computadora local**  
*Explicación:* Git es un sistema de control de versiones *local*. Todo el historial se guarda en tu propia computadora dentro de una carpeta oculta llamada `.git`. Para compartir estos cambios con otros o hacer backup en la nube, necesitas usar GitHub (lo veremos a continuación).

---

## ¿Qué es GitHub?

**GitHub es una plataforma en la nube para almacenar y compartir repositorios Git.**

### Analogía: Git vs GitHub

| Git | GitHub |
|-----|--------|
| El álbum de fotos en su computadora | El álbum de fotos en la nube |
| Solo ustedes tienen acceso | Todos los colaboradores pueden ver y contribuir |
| Si se daña su disco, pierden todo | Backup intencional en servidores de GitHub (ustedes deciden cuándo subir las fotos) |

### ¿Por qué GitHub además de Git?

Git solo vive en su computadora. Eso significa que:
- Si su disco duro falla, **pierden todo el historial**.
- Si quieren que un coautor vea sus cambios, tendrían que enviarle archivos manualmente (¿les suena al problema de los emails?).
- Sin una plataforma centralizada como GitHub, **revisar** los cambios de alguien antes de integrarlos requeriría procesos complicados y manuales (compartir archivos .patch, comparaciones manuales, etc.). Técnicamente es posible, pero muy poco práctico.

GitHub resuelve estos tres problemas al ser un **punto central en la nube** donde vive una copia compartida del repositorio:

| Sin GitHub (solo Git local) | Con GitHub |
|----------------------------|------------|
| Cada quien tiene su copia aislada | Todos acceden al mismo repositorio central |
| Para compartir cambios: emails, USB, etc. | Un comando (`git push`) sube sus cambios |
| Revisión complicada y manual de cambios | **Pull Requests**: alguien propone cambios y los demás los revisan antes de aceptarlos |
| Si se daña su disco, pierden todo | **Backup intencional** en servidores de GitHub (ustedes hacen `push` cuando quieren) |
| No hay lista de tareas compartida | **Issues**: lista de pendientes visible para todos |

> 💡 **Nota sobre Issues y Pull Requests:** Un Pull Request puede resolver múltiples Issues a la vez. En el mensaje del PR pueden escribir: `fix #1, fix #2, fix #3` (o `closes #1, resolves #2`) y GitHub automáticamente cerrará esos Issues cuando el PR sea fusionado. Esto es útil cuando un conjunto de cambios resuelve varios problemas relacionados.

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

## 🧠 Trivia 2: Git vs GitHub

**Pregunta 1:** ¿Cuál es la diferencia principal entre Git y GitHub?
- A) Son lo mismo, solo nombres diferentes
- B) Git es local en tu computadora, GitHub es una plataforma en la nube
- C) Git es para Python, GitHub es para LaTeX
- D) GitHub es más viejo que Git

**Pregunta 2:** Cuando haces `git push`, ¿qué estás haciendo?
- A) Eliminando archivos de tu computadora
- B) Descargando cambios de otros
- C) Subiendo intencionalmente tus commits locales a GitHub
- D) Compilando tu código

**Pregunta 3:** Si quieres resolver 3 issues con un solo Pull Request, ¿qué debes escribir en la descripción del PR?
- A) No es posible, cada PR solo puede resolver un issue
- B) `fix #1, fix #2, fix #3`
- C) Tienes que cerrar los issues manualmente
- D) `delete #1, delete #2, delete #3`

---

### ✅ Respuestas:

**Pregunta 1: B) Git es local en tu computadora, GitHub es una plataforma en la nube**  
*Explicación:* Git es el sistema de control de versiones que funciona en tu computadora local. GitHub es un servicio en la nube que hospeda repositorios Git y añade características de colaboración como Pull Requests, Issues, y revisión de código. Es como la diferencia entre tu álbum de fotos personal (Git) y compartirlo en una plataforma en línea (GitHub).

**Pregunta 2: C) Subiendo intencionalmente tus commits locales a GitHub**  
*Explicación:* `git push` envía tus commits desde tu repositorio local a GitHub. Es un proceso intencional que ustedes controlan — deciden cuándo están listos para compartir su trabajo. No es automático; tienen que ejecutar el comando explícitamente.

**Pregunta 3: B) `fix #1, fix #2, fix #3`**  
*Explicación:* GitHub reconoce palabras clave como `fix`, `fixes`, `close`, `closes`, `resolve`, `resolves` seguidas de `#número_de_issue`. Cuando el PR se fusiona, GitHub automáticamente cierra esos issues y crea enlaces entre el PR y los issues resueltos. Esto ayuda a mantener un historial claro de qué cambios resolvieron qué problemas.

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
| **Historial menos detallado** | El historial de Overleaf no captura el "por qué" tan bien como Git |
| **Dependencia de internet** | Sin conexión, no pueden trabajar (a menos que tengan cuenta Premium) |

> 💡 **La buena noticia**: en este taller vamos a resolver exactamente estas limitaciones. Al trabajar **offline con VS Code + Git** y usar Overleaf solo como capa de verificación final, nos quedamos con las ventajas de Overleaf (compilación en la nube, mismo PDF para todos) sin sufrir sus limitaciones.

---

## 🧠 Trivia 3: Overleaf y Flujo de Trabajo

**Pregunta 1:** ¿Cuál es la principal limitación de trabajar solo en Overleaf?
- A) No se puede usar LaTeX
- B) No hay historial de cambios
- C) Sin internet no puedes trabajar (a menos que tengas Premium)
- D) Solo funciona en Windows

**Pregunta 2:** En el flujo de trabajo que aprenderemos, ¿cuál es el rol principal de Overleaf?
- A) Editor principal donde escribimos todo el tiempo
- B) Verificación final en la nube después de trabajar localmente
- C) Reemplazo de GitHub
- D) Almacenar imágenes del proyecto

**Pregunta 3:** Si dos personas editan simultáneamente la misma línea en Overleaf, ¿qué puede pasar?
- A) Overleaf fusiona los cambios automáticamente sin problemas
- B) Se pueden perder cambios o generar conflictos
- C) El documento se borra automáticamente
- D) Solo la primera persona puede editar

---

### ✅ Respuestas:

**Pregunta 1: C) Sin internet no puedes trabajar (a menos que tengas Premium)**  
*Explicación:* Overleaf es una plataforma basada completamente en la nube. Sin conexión a internet, no pueden acceder a sus documentos (a menos que tengan una cuenta Premium que ofrece algunas capacidades offline limitadas). Esto contrasta con nuestro flujo propuesto donde trabajan localmente en VS Code y solo sincronizan cuando tienen internet.

**Pregunta 2: B) Verificación final en la nube después de trabajar localmente**  
*Explicación:* En el flujo que aprenderemos, Overleaf NO es su editor principal. Ustedes editan localmente en VS Code (rápido, offline, con control de versiones Git), y usan Overleaf ocasionalmente para verificar que el documento compila correctamente en la nube y que todos ven el mismo PDF final. Es una capa de verificación, no su entorno principal de trabajo.

**Pregunta 3: B) Se pueden perder cambios o generar conflictos**  
*Explicación:* Cuando dos personas editan simultáneamente la misma sección en Overleaf, pueden surgir conflictos. Overleaf intenta sincronizar cambios, pero no siempre es perfecto. Pueden perderse párrafos o quedar en estados inconsistentes. Con nuestro flujo (Git + Pull Requests), estos conflictos se detectan y resuelven de manera controlada antes de integrar cambios.

---

Ya conocemos cada herramienta por separado. Ahora veamos cómo encajan las piezas cuando trabajan juntas.

## El Flujo de Trabajo Combinado

Usamos **las tres herramientas juntas** para obtener lo mejor de cada una. El flujo empieza en **su computadora** (trabajo local), sube a **GitHub** (repositorio compartido) y termina en **Overleaf** (verificación final):

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
              │  • Se fusionan las contribuciones de  │
              │    todos (como vimos en el curso      │
              │    pasado, fusionamos nuestras        │
              │    contribuciones en main)            │
              │  • Pull Requests para revisión        │
              │  • Backup intencional en la nube      │
              │    (ustedes hacen push cuando quieren)│
              │  • Historial de quién cambió qué      │
              └───────────────┬────────────────────────┘
                              │
                     sync (cualquier invitado)
                              │
───────────────────────────────────────────────────────────────
 PASO 3: OVERLEAF (verificación final)
───────────────────────────────────────────────────────────────
                              │
              ┌───────────────┴────────────────────────┐
              │  Overleaf (Owner: Mauricio Premium)    │
              │                                        │
              │  • Compilación en la nube              │
              │    (confirma que todo funciona)        │
              │  • Vista del PDF final                 │
              │  • Track Changes (Premium)             │
              │                                        │
              │  Nota: El sync desde GitHub puede      │
              │  hacerlo cualquier persona invitada    │
              │  al proyecto, no solo quien tenga      │
              │  cuenta Premium. La cuenta Premium     │
              │  del owner permite la sincronización   │
              │  bidireccional.                        │
              └────────────────────────────────────────┘
```

### La Ventaja Clave: Trabajo Local

El corazón de este flujo es el **trabajo local**. Cada quien edita, compila y verifica en su propia máquina antes de compartir:

Cuando **todos usan solo Overleaf**:
- 🔴 Una persona compila → las demás esperan
- 🔴 Conexión lenta → compilación lenta
- 🔴 Sin internet → no pueden trabajar (a menos que tengan cuenta Premium)

Cuando **cada quien compila localmente**:
- 🟢 Todos compilan simultáneamente en su propia máquina
- 🟢 Preview instantáneo en VS Code para proyectos pequeños (<1 segundo); para proyectos más grandes, la primera compilación (Build) tarda, pero después guardar y auto-compilar es casi tan rápido como Overleaf Premium
- 🟢 Trabajan offline, sincronizan cuando tengan internet
- 🟢 Overleaf solo se usa como verificación final, después de que todo ya funciona localmente

> 💡 **Nota sobre velocidad de compilación**: LaTeX Workshop en VS Code compila muy rápido para cambios incrementales una vez que el proyecto está "construido" (primer Build con Ctrl+Alt+B). El primer build puede tardar en proyectos grandes, pero las compilaciones automáticas posteriores al guardar (Ctrl+S) son prácticamente instantáneas, comparables con Overleaf Premium. Además, el PDF compilado persiste localmente — no desaparece entre sesiones.

> 🔍 **Funcionalidad SyncTeX en VS Code**: Al igual que en Overleaf, pueden navegar entre el código y el PDF:
> - **Del código al PDF**: `Ctrl+Alt+J` (salta a la posición del PDF donde está su cursor en el código)
> - **Del PDF al código**: Click izquierdo en el PDF (salta al código fuente de esa sección)
> 
> Si encuentran alguna función de LaTeX que usaban en Overleaf y no está disponible en VS Code, prueben esto: vayan a su LLM de preferencia y pregunten:
> 
> *"[su duda], estoy trabajando en VS Code, LaTeX Workshop, Strawberry Perl y MiKTeX"* (pueden adjuntar una captura de pantalla de su configuración)
> 
> La mayoría de funciones tienen equivalentes o atajos en VS Code.

---

## Resumen: ¿Quién hace qué?

| Herramienta | Función Principal | Cuándo la usamos |
|-------------|-------------------|------------------|
| **VS Code** | Editor de código + preview PDF | Todo el tiempo mientras escriben |
| **MiKTeX/MacTeX** | Compilador de LaTeX | Automáticamente cada vez que guardan en VS Code |
| **Git** | Control de versiones (local) | Cada vez que guardan un avance intencional (`commit`) |
| **GitHub** | Repositorio compartido | Para subir cambios (`push`), bajarlos (`pull`), trabajar en ramas, y fusionar contribuciones en `main` |
| **Overleaf** | Verificación final en la nube | Después de fusionar cambios en `main` y confirmar que compila localmente, cualquier invitado puede sincronizar con Overleaf |

---

## El Ciclo Diario de Trabajo (paso a paso)

¿Recuerdan el flujo que vimos al inicio? Aquí lo detallamos con cada comando específico:

```
┌─────────────────────────────────────────────────────────────┐
│                    Su día de trabajo                         │
└─────────────────────────────────────────────────────────────┘

1. INICIO DEL DÍA
   ┌─────────────────────────────────────┐
   │  git pull                           │  ← Obtener cambios que
   └─────────────────────────────────────┘    otros hicieron
                    ↓
2. CREAR RAMA PARA SU TRABAJO
   ┌─────────────────────────────────────┐
   │  git checkout -b nombre-rama        │  ← Crear rama para trabajar
   └─────────────────────────────────────┘    de forma aislada
                    ↓
3. DURANTE EL DÍA
   ┌─────────────────────────────────────┐
   │  Editar en VS Code                  │  ← Escribir, compilar, ver 
   │  (guardan cambios intermedios con   |    PDF
   |    Ctrl+S / Cmd+S)                  |    
   └─────────────────────────────────────┘
                    ↓
4. CUANDO TERMINAN UN AVANCE
   ┌─────────────────────────────────────┐
   │  git add archivo.tex                │  ← Preparar archivos para la foto
   │  git commit -m "descripción"        │  ← Tomar la "foto"
   └─────────────────────────────────────┘
                    ↓
5. COMPARTIR SU TRABAJO
   ┌─────────────────────────────────────┐
   │  git push                           │  ← Subir su rama a GitHub
   └─────────────────────────────────────┘
                    ↓
6. SOLICITAR REVISIÓN
   ┌─────────────────────────────────────┐
   │  Crear Pull Request en GitHub       │  ← Pedir que revisen sus
   │                                     │     cambios antes de integrar
   └─────────────────────────────────────┘
                    ↓
7. DESPUÉS DE APROBACIÓN Y MERGE
   ┌─────────────────────────────────────┐
   │  git checkout main                  │  ← Volver a la rama principal
   │  git pull                           │  ← Traer los cambios fusionados
   └─────────────────────────────────────┘
                    ↓
8. VERIFICACIÓN (ocasional)
   ┌─────────────────────────────────────┐
   │  Overleaf → Menu → GitHub →         │  ← Sincronizar y verificar
   │  "Pull GitHub changes into Overleaf"│     que compile en la nube
   └─────────────────────────────────────┘
```

---

## Conceptos Clave para el Taller

Antes de continuar, asegúrense de entender estos términos:

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
Solo el **owner del proyecto** (Mauricio) necesita Premium para la sincronización bidireccional con GitHub. Los colaboradores no necesitan cuenta Premium — cualquier persona invitada al proyecto puede hacer "Pull from GitHub" en Overleaf.

### ¿Puedo editar directamente en Overleaf?
Sí, pero recomendamos editar localmente en VS Code para:
- Compilación más rápida una vez que el proyecto está construido
- Trabajo offline
- Mejor integración con Git y control de versiones
- Uso de SyncTeX para navegar entre código y PDF

### ¿Qué pasa si no tengo internet?
Pueden seguir trabajando localmente. Git guarda todo en su computadora. Cuando tengan internet, hacen `push` para sincronizar. Noten que en Overleaf sin internet no podrían trabajar, a menos que tengan cuenta Premium (que ofrece capacidades offline limitadas).

---

## Referencias

- [GitHub Flow](https://docs.github.com/en/get-started/using-github/github-flow): Flujo oficial de GitHub
- [Overleaf Git Integration](https://www.overleaf.com/learn/how-to/Git_integration): Documentación oficial
- [Pro Git Book](https://git-scm.com/book/en/v2): Libro gratuito y oficial de Git
- [KRR Group LaTeX Collaboration Guide](https://github.com/krr-up/latex-collaboration-guide): Guía de la Universidad de Potsdam
- [Noble Lab: 10 Tips for Collaborative Writing](https://willfondrie.com/2024/02/10-tips-for-collaborative-writing-with-latex-and-github/): Universidad de Washington

---

**Siguiente**: [Parte 2 - Configuración Inicial →](../02-configuracion-inicial/README.md)
