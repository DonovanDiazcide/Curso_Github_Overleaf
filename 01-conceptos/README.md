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

**Solución**: Un sistema que maneje versiones automáticamente. Eso es **Git**.

---

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

---

## ¿Qué es GitHub?

**GitHub es una plataforma en la nube para almacenar y compartir repositorios Git.**

### Analogía: Git vs GitHub

| Git | GitHub |
|-----|--------|
| El álbum de fotos en tu computadora | El álbum de fotos en la nube |
| Solo tú tienes acceso | Todos los colaboradores pueden ver y contribuir |
| Si se daña tu disco, pierdes todo | Backup automático en servidores de GitHub |

### ¿Por qué GitHub además de Git?

```
┌─────────────────────────────────────────────────────────────┐
│                     GitHub (en la nube)                      │
│                                                              │
│  Tu repositorio compartido:                                  │
│  • Todos pueden acceder desde cualquier lugar                │
│  • Historial completo de cambios                             │
│  • Pull Requests: proponer cambios para revisión             │
│  • Issues: lista de tareas pendientes                        │
│  • Backup automático                                         │
└─────────────────────────────────────────────────────────────┘
              ↑               ↑               ↑
           push            push            push
          (subir)         (subir)         (subir)
              │               │               │
              ↓               ↓               ↓
    ┌─────────────┐   ┌─────────────┐   ┌─────────────┐
    │  Mauricio   │   │ José Miguel │   │   Rodrigo   │
    │  (Windows)  │   │  (Windows)  │   │    (Mac)    │
    │             │   │             │   │             │
    │ Copia local │   │ Copia local │   │ Copia local │
    │ del repo    │   │ del repo    │   │ del repo    │
    └─────────────┘   └─────────────┘   └─────────────┘
```

**Evidencia de uso académico:**
> Paper arXiv:2408.09344 (2024): *"GitHub is an effective platform for collaborative and reproducible laboratory research"*

---

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

---

## El Flujo de Trabajo Combinado

Usamos **las tres herramientas juntas** para obtener lo mejor de cada una:

```
┌─────────────────────────────────────────────────────────────┐
│                    GitHub (Repositorio)                      │
│                                                              │
│  • Backup automático en la nube                              │
│  • Pull Requests para revisión de cambios                    │
│  • Issues para tareas pendientes                             │
│  • Historial completo de quién cambió qué                    │
└─────────────────────────────────────────────────────────────┘
                              ↑↓ 
                    sync (botón en Overleaf)
                              ↑↓
┌─────────────────────────────────────────────────────────────┐
│              Overleaf (Owner: Mauricio Premium)              │
│                                                              │
│  • Compilación en la nube (verificación final)               │
│  • Vista del PDF siempre actualizada                         │
│  • Edición rápida en navegador (opcional)                    │
│  • Track Changes integrado                                   │
└─────────────────────────────────────────────────────────────┘
                              ↑↓ 
                    git clone / push / pull
                              ↑↓
         ┌────────────────────┼────────────────────┐
         ↓                    ↓                    ↓
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
   └───────────┘        └───────────┘        └───────────┘
```

### La Ventaja Clave: Compilación Local

Cuando **todos usan solo Overleaf**:
- 🔴 Una persona compila → las demás esperan
- 🔴 Conexión lenta → compilación lenta
- 🔴 Sin internet → no puedes trabajar

Cuando **cada quien compila localmente**:
- 🟢 Todos compilan simultáneamente en su propia máquina
- 🟢 Preview instantáneo en VS Code (< 1 segundo)
- 🟢 Trabajas offline, sincronizas cuando tengas internet
- 🟢 Overleaf solo se usa para verificación final

---

## Resumen: ¿Quién hace qué?

| Herramienta | Función Principal | Cuándo la usamos |
|-------------|-------------------|------------------|
| **Git** | Control de versiones (local) | Cada vez que guardamos un avance (`commit`) |
| **GitHub** | Almacenamiento compartido | Cuando subimos cambios (`push`) o bajamos cambios de otros (`pull`) |
| **VS Code** | Editor de código | Todo el tiempo mientras escribimos |
| **MiKTeX/MacTeX** | Compilador de LaTeX | Automáticamente cada vez que guardamos en VS Code |
| **Overleaf** | Compilación final + sync | Para verificar que todo compile bien y sincronizar con GitHub |

---

## El Ciclo Diario de Trabajo

```
┌─────────────────────────────────────────────────────────────┐
│                    Tu día de trabajo                         │
└─────────────────────────────────────────────────────────────┘

1. INICIO DEL DÍA
   ┌─────────────────────────────────────┐
   │  git pull                           │  ← Obtener cambios que otros hicieron
   └─────────────────────────────────────┘
                    ↓
2. DURANTE EL DÍA
   ┌─────────────────────────────────────┐
   │  Editar en VS Code                  │  ← Escribir, compilar, ver PDF
   │  (guarda con Ctrl+S / Cmd+S)        │
   └─────────────────────────────────────┘
                    ↓
3. CUANDO TERMINAS UN AVANCE
   ┌─────────────────────────────────────┐
   │  git add archivo.tex                │  ← Preparar archivos
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
