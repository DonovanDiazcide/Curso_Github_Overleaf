# Parte 4: Pull Requests, Revisión y Resolución de Conflictos

> **Duración**: 15 minutos  
> **Objetivo**: Aprender a revisar, aprobar y resolver conflictos — todo en el navegador

---

## Resumen de esta parte

| Paso | Descripción | Tiempo |
|------|-------------|--------|
| 4.1 | Revisar un Pull Request en GitHub | 4 min |
| 4.2 | Hacer merge de los PRs aprobados | 3 min |
| 4.3 | Entender y resolver conflictos | 5 min |
| 4.4 | Sincronizar después del merge | 3 min |

---

## 4.1 Revisar un Pull Request en GitHub

En la Parte 3, José Miguel y Rodrigo crearon Pull Requests. Ahora toca **revisarlos** antes de integrarlos.

### Asignación de revisiones

| Revisor | Revisa el PR de |
|---------|-----------------|
| José Miguel | Rodrigo |
| Rodrigo | Mauricio (o José Miguel) |
| Mauricio | José Miguel |

### Cómo revisar un PR

1. Ir al repositorio principal en GitHub: `mauricio/articulo-taller-colaboracion`
2. Click en la pestaña **"Pull requests"**
3. Seleccionar el PR a revisar

### Pestaña "Files changed"

Aquí pueden ver exactamente qué se cambió:

```diff
- [Pendiente: explicar por qué es importante tener un flujo de trabajo colaborativo]
+ El flujo de trabajo tradicional basado en enviar archivos por correo electrónico 
+ presenta numerosos problemas: versiones duplicadas, pérdida de cambios, y 
+ dificultad para rastrear quién modificó qué.
```

- Las líneas en **rojo** (con `-`) fueron eliminadas
- Las líneas en **verde** (con `+`) fueron agregadas

### Agregar comentarios

1. Pasar el cursor sobre una línea que quieran comentar
2. Click en el ícono **"+"** que aparece
3. Escribir su comentario (ej: "¿Podrías agregar una cita aquí?")
4. Click en **"Start a review"** o **"Add single comment"**

### Enviar la revisión

1. Click en **"Review changes"** (botón verde arriba a la derecha)
2. Escribir un resumen general
3. Seleccionar una opción:
   | Opción | Cuándo usarla |
   |--------|---------------|
   | ✅ **Approve** | Los cambios están bien, listos para integrar |
   | 💬 **Comment** | Tengo sugerencias pero no bloqueo la integración |
   | 🔄 **Request changes** | Necesita correcciones antes de integrar |
4. Click en **"Submit review"**

---

## 4.2 Hacer merge de los PRs aprobados

> **Responsable de merge: Mauricio como owner del proyecto**
>
> Mauricio tiene la responsabilidad final de supervisar la integración de cambios al repositorio principal.

### Tipo de merge correcto

> ⚠️ **Importante**: Asegúrense de usar **"Create a merge commit"** para preservar el historial completo.

| Opción | ¿Preserva historial? | Descripción |
|--------|---------------------|-------------|
| **Create a merge commit** ✅ | Sí | Todos los cambios quedan accesibles en el historial |
| Squash and merge ❌ | No | Comprime todos los cambios en uno solo |
| Rebase and merge ⚠️ | Parcial | Re-escribe el historial |

### Pasos para hacer merge

Para cada PR aprobado:

1. Ir al PR en GitHub
2. Verificar que tiene al menos una aprobación
3. Click en **"Merge pull request"** (botón verde)
4. **Verificar el menú desplegable**: debe decir "Create a merge commit"
5. Click en **"Confirm merge"**
6. (Opcional) Click en **"Delete branch"** — en nuestro caso esto limpia ramas automáticas, no afecta los forks

### Orden sugerido de merge

Para minimizar conflictos:

1. **Primero**: PRs que modifican archivos diferentes entre sí
2. **Si dos PRs tocan el mismo archivo**: Merge uno, resolver conflictos del otro si aparecen
3. En nuestro caso: cada persona editó un archivo diferente, así que el orden no importa

---

## 4.3 Resolver conflictos

### ¿Cuándo ocurren conflictos?

Un conflicto ocurre cuando **dos personas modifican la misma línea** del mismo archivo, y GitHub no puede decidir automáticamente cuál versión mantener.

```
    José Miguel (en su fork)           Rodrigo (en su fork)
            │                             │
            ▼                             ▼
   Cambió título de               Cambió título de
   introduction.tex                introduction.tex
   (línea 1: \section{...})       (línea 1: \section{...})
            │                             │
            └──────────┬──────────────────┘
                       │
                       ▼
                  CONFLICTO
            GitHub no sabe cuál versión elegir
```

### Resolver conflictos en GitHub (en el navegador)

Cuando un PR tiene conflictos, GitHub mostrará: **"This branch has conflicts that must be resolved"**

#### Paso 1: Click en "Resolve conflicts"

GitHub abrirá un editor web mostrando los marcadores de conflicto:

```latex
<<<<<<< josemiguel/articulo:main
\section{Introducción y Motivación}
=======
\section{Introducción al Trabajo Colaborativo}
>>>>>>> mauricio/articulo:main
```

**¿Qué significa esto?**

| Sección | Significado |
|---------|-------------|
| `<<<<<<< josemiguel/...` | Inicio de los cambios del PR (los de JM) |
| `=======` | Separador entre las dos versiones |
| `>>>>>>> mauricio/...` | Fin de la versión actual de main |

#### Paso 2: Decidir cómo resolver

Tienen tres opciones:

**Opción A: Mantener la versión del PR**
```latex
\section{Introducción y Motivación}
```

**Opción B: Mantener la versión de main**
```latex
\section{Introducción al Trabajo Colaborativo}
```

**Opción C: Combinar ambas (lo más común)**
```latex
\section{Introducción y Motivación del Trabajo Colaborativo}
```

#### Paso 3: Editar en el editor web

1. **Eliminar** los marcadores de conflicto (`<<<<<<<`, `=======`, `>>>>>>>`)
2. **Dejar** el contenido que quieren mantener
3. Click en **"Mark as resolved"**
4. Repetir para todos los archivos con conflicto
5. Click en **"Commit merge"**

#### Paso 4: El PR ya puede ser merged

Después de resolver los conflictos, el PR mostrará que no hay conflictos pendientes y puede ser fusionado normalmente.

### Conflictos dentro de Overleaf ↔ GitHub

Si tanto Overleaf como GitHub tienen cambios diferentes (por ejemplo, alguien editó directamente en el fork en GitHub mientras otro editaba en Overleaf), al hacer "Push to GitHub" puede haber un conflicto.

Cuando esto sucede, Overleaf:
1. **Crea una rama temporal** en el repositorio de GitHub con los cambios de Overleaf
2. **Muestra un mensaje** indicando que hay conflictos que resolver
3. En GitHub, pueden crear un **PR desde esa rama temporal** y resolver conflictos ahí
4. Después de resolver, hacer **"Pull from GitHub"** en Overleaf para sincronizar

> 📖 Fuente oficial: [Overleaf - Resolving merge conflicts](https://docs.overleaf.com/integrations-and-add-ons/git-integration-and-github-synchronization/github#resolving-merge-conflicts)

---

## 🧠 Trivia 3: Pull Requests y Conflictos

**Pregunta 1:** José Miguel y Rodrigo ambos crearon PRs que modifican archivos diferentes (`introduction.tex` y `methods.tex` respectivamente). Mauricio merge primero el PR de José Miguel. ¿Qué sucede cuando intenta hacer merge del PR de Rodrigo?
- A) El PR de Rodrigo se rechaza automáticamente porque ya hubo un merge
- B) El PR de Rodrigo se puede fusionar sin problemas porque modificaron archivos diferentes
- C) Rodrigo necesita crear un nuevo PR
- D) Ambos PRs se fusionan automáticamente al mismo tiempo

**Pregunta 2:** Después de que Mauricio hace merge de ambos PRs en el repositorio principal, ¿qué deben hacer José Miguel y Rodrigo para tener la versión más reciente en sus proyectos Overleaf?
- A) No necesitan hacer nada, se sincroniza automáticamente
- B) En GitHub: "Sync fork" → En Overleaf: "Pull from GitHub"
- C) Crear nuevos forks desde cero
- D) Pedirle a Mauricio que les envíe los archivos

---

### ✅ Respuestas:

**Pregunta 1: B) El PR de Rodrigo se puede fusionar sin problemas**  
*Explicación:* Cuando dos PRs modifican archivos completamente diferentes, no hay conflicto. GitHub puede fusionar cada uno independientemente. Los conflictos solo ocurren cuando dos cambios tocan las mismas líneas del mismo archivo.

**Pregunta 2: B) En GitHub: "Sync fork" → En Overleaf: "Pull from GitHub"**  
*Explicación:* Después de que se fusionan PRs en el repositorio principal, los forks quedan "desactualizados" (behind). Cada persona debe: 1) Ir a su fork en GitHub y hacer "Sync fork" → "Update branch" para traer los últimos cambios del principal, y 2) En Overleaf, hacer "Pull from GitHub" para actualizar su proyecto. Recuerden: no hay sincronización automática — todo es intencional.

---

## 4.4 Sincronizar después del merge (Todos)

Una vez que los PRs fueron fusionados en main:

### Paso 1: Actualizar Overleaf "Main" (Mauricio)

1. Abrir el proyecto **"Articulo-Main"** en Overleaf
2. **Menu** → **GitHub** → **"Pull GitHub changes into Overleaf"**
3. Compilar y verificar que el documento completo funciona con las contribuciones de todos

### Paso 2: Actualizar los forks (José Miguel y Rodrigo)

**En GitHub:**
1. Ir a su fork: `github.com/josemiguel/articulo-taller-colaboracion`
2. Verán: **"This branch is X commits behind mauricio:main"**
3. Click **"Sync fork"** → **"Update branch"**

**En Overleaf:**
1. Abrir su proyecto workspace
2. **Menu** → **GitHub** → **"Pull GitHub changes into Overleaf"**
3. Ahora tienen la versión más reciente con los cambios de todos

### ¡Ciclo completado! 🎉

```
┌─────────────────────────────────────────────────────────────┐
│  ✅ Artículo actualizado con contribuciones de todos        │
│  ✅ Cada cambio fue revisado antes de integrarse            │
│  ✅ Historial completo en GitHub                            │
│  ✅ Todo hecho desde el navegador                           │
└─────────────────────────────────────────────────────────────┘
```

---

## Resumen de resolución de conflictos

```
┌─────────────────────────────────────────────────────────────┐
│          FLUJO DE RESOLUCIÓN DE CONFLICTOS EN GITHUB        │
└─────────────────────────────────────────────────────────────┘

    ┌──────────────────────────────────────┐
    │  1. GitHub detecta conflicto en PR   │
    │     "This branch has conflicts"      │
    └──────────────────────────────────────┘
                      │
                      ▼
    ┌──────────────────────────────────────┐
    │  2. Click "Resolve conflicts"        │
    │     Abre editor web de GitHub        │
    └──────────────────────────────────────┘
                      │
                      ▼
    ┌──────────────────────────────────────┐
    │  3. Editar: eliminar marcadores      │
    │     Quitar <<<<<<<, =======, >>>>>>> │
    │     Dejar el contenido deseado       │
    └──────────────────────────────────────┘
                      │
                      ▼
    ┌──────────────────────────────────────┐
    │  4. "Mark as resolved" + "Commit"    │
    └──────────────────────────────────────┘
                      │
                      ▼
    ┌──────────────────────────────────────┐
    │  5. Merge pull request normalmente   │
    └──────────────────────────────────────┘
```

---

## Checkpoint ✅

Antes de continuar a la Parte 5, verifiquen que:

- [ ] Revisaron al menos un PR de un compañero
- [ ] Entienden cómo leer los marcadores de conflicto (`<<<<<<<`, `=======`, `>>>>>>>`)
- [ ] Los PRs fueron fusionados en main
- [ ] Sincronizaron sus forks y proyectos Overleaf con la versión más reciente

---

**Anterior**: [← Parte 3 - Flujo Básico](../03-flujo-basico/README.md)

**Siguiente**: [Parte 5 - Práctica Libre →](../05-practica-libre/README.md)
