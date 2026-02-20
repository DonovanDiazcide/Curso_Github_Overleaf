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

📝 Mauricio (jueves): "Alguien rompió la compilación, ¿quién fue?"
⚠️ El documento no compila y no es claro qué cambio específico causó el problema
```

**Problemas comunes cuando todos editan el mismo proyecto Overleaf:**
- ❌ Conflictos cuando dos personas editan el mismo archivo simultáneamente
- ❌ Compilación compartida: el servidor se satura cuando varios compilan simultáneamente
- ❌ Historial limitado: difícil saber el "por qué" de cada cambio
- ❌ No hay revisión formal antes de integrar cambios importantes
- ❌ No hay separación clara entre "trabajo en progreso" y "versión aprobada"

**Solución**: Un sistema de **control de versiones intencional** donde cada persona tiene **su propio espacio de trabajo** en Overleaf, y los cambios se revisan antes de llegar a la versión principal. Esto es exactamente lo que recomienda la literatura sobre buenas prácticas de investigación reproducible (Gentzkow & Shapiro, "Code and Data for the Social Sciences").

**¿Qué significa "intencional"?**
- Cada versión que comparten la suben conscientemente a GitHub, con un mensaje que explica el *por qué*
- El historial completo se preserva: pueden ver quién cambió qué, cuándo y por qué
- Nadie puede alterar la versión principal (`main`) sin aprobación

Eso es **Overleaf + GitHub con forks**. A lo largo del taller construiremos este flujo completo.

---

## Lo que Haremos en Este Taller

| Parte | Qué haremos | Resultado |
|-------|-------------|----------|
| **Parte 1** (ahora) | Entender los conceptos y el flujo | Un modelo mental claro de cómo trabajaremos |
| **Parte 2** | Configurar Overleaf, GitHub y los forks | Los 3 proyectos listos para colaborar |
| **Parte 3** | Practicar el flujo: editar → push → pull request | Su primer cambio integrado al artículo |
| **Parte 4** | Pull Requests, revisión y resolver conflictos | Saber manejar cambios simultáneos |
| **Parte 5** | Práctica libre en el artículo | Experiencia real simulada de escritura colaborativa |

> **En resumen**: al final del taller, todos habrán contribuido a un mismo artículo académico en LaTeX, usando un flujo profesional de colaboración — todo desde el navegador.

---

## Un Día Típico de Trabajo (vista previa)

Antes de explicar cada pieza por separado, veamos cómo se ve **un ciclo real de trabajo** de principio a fin. No se preocupen si no entienden cada paso todavía — eso es exactamente lo que vamos a desglosar después:

```
 EN SU NAVEGADOR                        EN GITHUB
 ──────────────                         ─────────

 1. GitHub: "Sync fork"              ←── Traer cambios que otros
                                          ya integraron en main

 2. Overleaf: Pull from GitHub       ←── Actualizar su proyecto
                                          con esos cambios

 3. Editar en Overleaf
    Compilar PDF en la nube
    (vista previa instantánea)

 4. Overleaf: Push to GitHub         ──→ Subir su trabajo a su fork
    (con mensaje descriptivo)

 5. GitHub: Create Pull Request      ──→ Solicitar revisión de cambios

 6. GitHub: Revisión y merge         ──→ Integrar cambios aprobados
                                          en la versión principal

 7. Overleaf "Main": Pull            ──→ Verificar versión final
    from GitHub                           compilada
```

> **¿Algunos pasos les suenan desconocidos?** Es normal. Vamos a explicar cada pieza a continuación.

---

Ahora que ya tienen la imagen completa, vamos a entender cada pieza del rompecabezas.

## ¿Qué es Overleaf?

**Overleaf es un editor de LaTeX en línea con compilador en la nube.**

<!-- 📸 CAPTURA: Editor de Overleaf mostrando código LaTeX a la izquierda y vista previa del PDF a la derecha -->
![Editor de Overleaf con código LaTeX y vista previa del PDF](img/04-overleaf-editor.png)

Ya lo conocen y probablemente es donde escriben sus artículos. En nuestro flujo, Overleaf es la **herramienta principal de edición** — donde pasan la mayor parte del tiempo:

| Característica | Beneficio |
|----------------|-----------|
| **Compilación en la nube** | No necesitan instalar LaTeX localmente |
| **Mismo PDF para todos** | Evita el "en mi computadora sí compila" |
| **Edición en navegador** | Acceso desde cualquier dispositivo |
| **Track Changes** | Ver qué cambió cada persona (con cuenta Premium) |
| **Sincronización con GitHub** | Conectar su trabajo a un repositorio compartido |

### ¿Por qué NO usar solo Overleaf (un solo proyecto compartido)?

Si solo usan un proyecto Overleaf compartido entre todos, siguen teniendo estos problemas:

| Limitación | Problema |
|------------|----------|
| **Todo el mundo edita "main"** | No hay separación entre trabajo en progreso y versión aprobada |
| **Sin revisión formal** | No hay Pull Requests para revisar cambios antes de integrarlos |
| **Historial menos detallado** | El historial de Overleaf no captura el "por qué" tan bien como GitHub |
| **Compilación compartida** | Recursos del servidor se comparten — con varios editores puede ser lenta |

> 💡 **La buena noticia**: en este taller vamos a resolver exactamente estas limitaciones. Cada persona tendrá **su propio proyecto de Overleaf** conectado a su propio fork en GitHub. Así conservan todas las ventajas de Overleaf, pero agregan revisión formal, historial detallado y separación de espacios de trabajo.

---

## 🧠 Trivia 1: Comprensión de Overleaf y sus Limitaciones

**Pregunta 1:** José Miguel y Rodrigo están editando la introducción al mismo tiempo en un proyecto Overleaf compartido. José Miguel modifica un párrafo de la introducción, y Rodrigo modifica el mismo párrafo sin saber que José Miguel ya lo editó. ¿Qué sucede?
- A) Overleaf fusiona automáticamente ambos cambios sin problemas
- B) Puede haber un conflicto donde se pierdan los cambios de uno de los dos
- C) Overleaf bloquea el archivo para que solo uno pueda editarlo
- D) Los cambios de ambos se guardan en versiones separadas automáticamente

**Pregunta 2:** Mauricio quiere saber por qué se cambió la metodología del artículo. En el historial de Overleaf ve que hubo cambios, pero no hay explicación del motivo. ¿Qué limitación ilustra esto?
- A) Overleaf no guarda historial de cambios
- B) El historial de Overleaf muestra qué cambió pero no el "por qué" — falta contexto intencional
- C) Solo el owner puede ver el historial
- D) El historial solo guarda los últimos 5 cambios

**Pregunta 3:** ¿Cuál es el beneficio principal de que cada persona tenga su propio proyecto de Overleaf en lugar de compartir uno solo?
- A) Es más rápido de compilar
- B) Cada quien puede trabajar sin afectar la versión principal, y los cambios se revisan antes de integrarse
- C) Overleaf da más almacenamiento con proyectos separados
- D) Los proyectos separados se sincronizan automáticamente

---

### ✅ Respuestas:

**Pregunta 1: B) Puede haber un conflicto donde se pierdan los cambios de uno de los dos**  
*Explicación:* Cuando dos personas editan las mismas líneas simultáneamente en Overleaf, el sistema intenta reconciliar los cambios, pero puede fallar. Overleaf no tiene un mecanismo formal de "merge" — simplemente aplica los cambios en orden temporal, lo cual puede sobrescribir el trabajo de una persona.

**Pregunta 2: B) El historial de Overleaf muestra qué cambió pero no el "por qué"**  
*Explicación:* En Overleaf, el historial registra automáticamente cada cambio con marca de tiempo. Pero a diferencia de un sistema de control de versiones como Git/GitHub, no hay un "mensaje de commit" intencional. No saben si el cambio fue intencional, un error, o parte de una revisión específica. Con GitHub, cada Push incluye un mensaje descriptivo que explica la razón del cambio.

**Pregunta 3: B) Cada quien puede trabajar sin afectar la versión principal, y los cambios se revisan antes de integrarse**  
*Explicación:* Esta es la ventaja clave del modelo de forks. Cada persona trabaja en su propio espacio (su proyecto Overleaf + su fork en GitHub). Cuando tienen algo listo, crean un Pull Request. Los compañeros revisan los cambios, y solo después de la aprobación se integran en la versión principal. Nadie puede "romper" la versión principal por accidente.

---

Con Overleaf tenemos un excelente editor de LaTeX. Pero necesitamos una plataforma que nos permita **compartir, revisar y aprobar** cambios de forma estructurada. Ahí entra GitHub.

## ¿Qué es GitHub?

**GitHub es una plataforma en la nube para almacenar y compartir repositorios con control de versiones.**

<!-- 📸 CAPTURA: Vista de un repositorio en GitHub mostrando lista de archivos, commits recientes y barra de navegación -->
![Vista de un repositorio en GitHub](img/01-github-repo-ejemplo.png)

### ¿Por qué GitHub además de Overleaf?

Overleaf por sí solo no tiene un sistema de revisión formal. GitHub agrega exactamente eso:

| Solo Overleaf (un proyecto compartido) | Overleaf + GitHub (con forks) |
|----------------------------------------|-------------------------------|
| Todos editan directamente la misma versión | Cada quien tiene su espacio; la versión principal está protegida |
| Sin revisión antes de integrar | **Pull Requests**: alguien propone cambios y los demás los revisan |
| Historial automático sin contexto | **Commits con mensaje**: cada versión tiene una explicación del "por qué" |
| Si alguien rompe la compilación, todos lo sufren | Los errores se contienen en el fork de cada persona |
| No hay lista de tareas compartida | **Issues**: lista de pendientes visible para todos |

<!-- 📸 CAPTURA: Vista de un Pull Request en GitHub mostrando conversación, revisión y comentarios -->
![Ejemplo de un Pull Request en GitHub](img/03-github-pr-ejemplo.png)

> 💡 **Nota sobre Issues y Pull Requests:** Un Pull Request puede resolver múltiples Issues a la vez. En el mensaje del PR pueden escribir: `fix #1, fix #2, fix #3` (o `closes #1, resolves #2`) y GitHub automáticamente cerrará esos Issues cuando el PR sea fusionado.

### Analogía: La Cocina del Restaurante

Piensen en el proyecto como un **restaurante**:

```
🍳 COCINA (GitHub "main")
   └── El plato oficial que se sirve al cliente
       Solo llegan ingredientes aprobados por el chef

👨‍🍳 ESTACIÓN DE JOSÉ MIGUEL (su fork + su proyecto Overleaf)
   └── Prepara su parte del plato
       Cuando está listo, pide al chef que lo pruebe (Pull Request)

👨‍🍳 ESTACIÓN DE RODRIGO (su fork + su proyecto Overleaf)
   └── Prepara otra parte del plato
       Cuando está listo, también pide aprobación

👨‍🍳 MAURICIO (chef / owner)
   └── Revisa lo que cada uno preparó
       Si está bien, lo integra al plato oficial
       Si necesita ajustes, pide cambios
```

### El Concepto de "Fork" (Bifurcación)

Un **fork** es una copia personal de un repositorio en GitHub. Es como tener tu propia versión del proyecto donde puedes experimentar libremente:

<!-- 📸 CAPTURA: Vista de un repositorio en GitHub con el botón "Fork" resaltado (arriba a la derecha, junto a Star y Watch) -->
![Botón Fork en un repositorio de GitHub](img/02-github-fork-button.png)

```
    ┌─────────────────────────────────────────────┐
    │  mauricio/articulo  (repositorio principal)  │
    │  ← Solo recibe cambios vía PR aprobados     │
    └──────────────┬─────────────┬────────────────┘
                   │             │
              fork │             │ fork
                   │             │
    ┌──────────────┴──┐   ┌─────┴──────────────┐
    │ josemiguel/     │   │ rodrigo/           │
    │ articulo        │   │ articulo           │
    │ (fork de JM)    │   │ (fork de Rodrigo)  │
    │                 │   │                    │
    │ Conectado a su  │   │ Conectado a su     │
    │ Overleaf        │   │ Overleaf           │
    └─────────────────┘   └────────────────────┘
```

**Características del fork:**
- Es una **copia completa** del repositorio principal en tu cuenta de GitHub
- Puedes modificarlo libremente sin afectar el original
- Puedes **sincronizarlo** con el original para obtener los últimos cambios (con un click en GitHub)
- Puedes **proponer cambios** al original mediante Pull Requests

---

## 🧠 Trivia 2: GitHub, Forks y Flujo de Trabajo

**Pregunta 1:** José Miguel hace cambios en su proyecto Overleaf y los sube a su fork en GitHub con "Push to GitHub". ¿Qué sucede con el repositorio principal (`mauricio/articulo`)?
- A) Los cambios aparecen automáticamente en el repositorio principal
- B) Los cambios NO aparecen en el repositorio principal; José Miguel necesita crear un Pull Request para proponerlos
- C) GitHub sincroniza automáticamente todos los forks
- D) Los cambios se pierden porque no fueron hechos en el repositorio principal

**Pregunta 2:** Rodrigo quiere empezar a trabajar y necesita obtener los últimos cambios que ya fueron integrados en el repositorio principal. ¿Cuál es la secuencia correcta?
- A) Editar directamente en Overleaf; los cambios llegan automáticamente
- B) Ir a GitHub → su fork → "Sync fork" → luego en Overleaf → "Pull from GitHub"
- C) Pedirle a Mauricio que le envíe los archivos actualizados
- D) Crear un nuevo fork cada vez que necesite actualizarse

**Pregunta 3:** Mauricio recibe un Pull Request de José Miguel con cambios en la introducción. Después de revisarlo con Rodrigo, deciden que está bien. ¿Cuál es la forma correcta de integrarlo?
- A) Copiar manualmente los cambios al proyecto principal de Overleaf
- B) En GitHub, aprobar el PR y hacer "Merge pull request" con "Create a merge commit", preservando el historial completo
- C) Hacer push de los cambios directamente desde el fork de José Miguel
- D) Cerrar el PR y hacer los cambios ellos mismos

---

### ✅ Respuestas:

**Pregunta 1: B) Los cambios NO aparecen en el repositorio principal**  
*Explicación:* Cuando José Miguel hace "Push to GitHub" desde Overleaf, los cambios se suben a **su fork** (`josemiguel/articulo`), no al repositorio principal (`mauricio/articulo`). Los forks son copias independientes. Para que los cambios lleguen al principal, José Miguel debe crear un Pull Request — una solicitud formal para que los demás revisen e integren sus cambios. Esto es lo que garantiza que la versión principal siempre esté revisada y aprobada.

**Pregunta 2: B) Ir a GitHub → su fork → "Sync fork" → luego en Overleaf → "Pull from GitHub"**  
*Explicación:* El flujo es de dos pasos: primero, en GitHub, Rodrigo actualiza su fork con los últimos cambios del repositorio principal (click en "Sync fork" → "Update branch"). Luego, en su proyecto de Overleaf, hace "Pull from GitHub" para traer esos cambios a su editor. Este proceso asegura que Rodrigo siempre trabaje sobre la versión más reciente. No hay sincronización automática — todo es intencional.

**Pregunta 3: B) En GitHub, aprobar el PR y hacer "Merge pull request" con "Create a merge commit"**  
*Explicación:* El merge se hace directamente en GitHub. "Create a merge commit" (en vez de "Squash" o "Rebase") preserva el historial completo de todos los cambios que hizo José Miguel. Así, si algún día necesitan ver exactamente qué se cambió y por qué, toda la historia está ahí. Después del merge, Mauricio puede ir al proyecto "Main" en Overleaf y hacer "Pull from GitHub" para actualizar el documento oficial.

---

Ya conocemos cada herramienta por separado. Ahora veamos cómo encajan las piezas cuando trabajan juntas.

## El Flujo de Trabajo Combinado

Usamos **Overleaf y GitHub juntos** con un modelo de forks para obtener lo mejor de cada herramienta. Toda la operación se realiza **desde el navegador**:

```
───────────────────────────────────────────────────────────────
 NIVEL 1: ESPACIOS DE TRABAJO (Overleaf — donde escriben)
───────────────────────────────────────────────────────────────

   ┌───────────────┐    ┌───────────────┐    ┌───────────────┐
   │ Proyecto OL    │    │ Proyecto OL    │    │ Proyecto OL    │
   │ "JM Workspace" │    │ "Main"         │    │ "R Workspace"  │
   │                │    │                │    │                │
   │ José Miguel    │    │ Mauricio       │    │ Rodrigo        │
   │ edita aquí     │    │ (ver. oficial) │    │ edita aquí     │
   └───────┬───────┘    └───────┬───────┘    └───────┬───────┘
           │                    │                    │
      push/pull            push/pull            push/pull
      GitHub sync          GitHub sync          GitHub sync
           │                    │                    │
───────────────────────────────────────────────────────────────
 NIVEL 2: GITHUB (donde se revisa y aprueba)
───────────────────────────────────────────────────────────────
           │                    │                    │
   ┌───────┴───────┐    ┌──────┴────────┐    ┌──────┴────────┐
   │ josemiguel/   │    │ mauricio/     │    │ rodrigo/      │
   │ articulo      │    │ articulo      │    │ articulo      │
   │ (fork)        │    │ (principal)   │    │ (fork)        │
   └───────┬───────┘    └──────┬────────┘    └──────┬────────┘
           │                   ↑                    │
           │    Pull Request   │   Pull Request     │
           └───────────────────┴────────────────────┘

───────────────────────────────────────────────────────────────
 FLUJO DE SINCRONIZACIÓN
───────────────────────────────────────────────────────────────

 Para RECIBIR cambios de main:
   GitHub fork → "Sync fork" → Overleaf → "Pull from GitHub"

 Para ENVIAR cambios a main:
   Overleaf → "Push to GitHub" → GitHub → "Create Pull Request"
```

### La Ventaja Clave: Cada Quien en Su Espacio

Cuando **todos comparten un solo proyecto Overleaf**:
- 🔴 Un cambio malo afecta a todos inmediatamente
- 🔴 No hay revisión antes de que los cambios sean "oficiales"
- 🔴 Compilación limitada a una persona a la vez
- 🔴 Historial sin contexto

Cuando **cada quien tiene su propio proyecto Overleaf + fork**:
- 🟢 Cada persona trabaja libremente en su espacio sin afectar a otros
- 🟢 Los cambios se revisan formalmente antes de llegar a main (Pull Requests)
- 🟢 Cada persona puede compilar en su propio proyecto sin interferir
- 🟢 Historial detallado con mensajes descriptivos en cada Push
- 🟢 **Todo en el navegador** — sin instalar nada en su computadora

---

## Resumen: ¿Quién hace qué?

| Herramienta | Función Principal | Cuándo la usamos |
|-------------|-------------------|------------------|
| **Overleaf** | Editor de LaTeX + compilación en la nube | Todo el tiempo mientras escriben (en su proyecto personal) |
| **GitHub** | Repositorio compartido + revisión | Para subir cambios (Push), sincronizar (Sync fork), revisar (Pull Requests), y organizar tareas (Issues) |
| **Overleaf "Main"** | Versión oficial del artículo | Para verificar que la versión integrada compila correctamente |

---

## El Ciclo Diario de Trabajo (paso a paso)

```
┌─────────────────────────────────────────────────────────────┐
│                    Su día de trabajo                         │
└─────────────────────────────────────────────────────────────┘

1. INICIO DEL DÍA
   ┌─────────────────────────────────────┐
   │  GitHub: ir a su fork               │  ← Ir a github.com/su-usuario/
   │  Click "Sync fork" → "Update branch"│     articulo
   └─────────────────────────────────────┘
                    ↓
2. ACTUALIZAR SU OVERLEAF
   ┌─────────────────────────────────────┐
   │  Overleaf: Menu → GitHub →          │  ← Traer los cambios de main
   │  "Pull GitHub changes into Overleaf"│     a su proyecto
   └─────────────────────────────────────┘
                    ↓
3. DURANTE EL DÍA
   ┌─────────────────────────────────────┐
   │  Editar en Overleaf                 │  ← Escribir, compilar,
   │  (compilar, ver PDF,                │     ver PDF
   │   iterar sobre su sección)          │
   └─────────────────────────────────────┘
                    ↓
4. CUANDO TERMINAN UN AVANCE
   ┌─────────────────────────────────────┐
   │  Overleaf: Menu → GitHub →          │  ← Subir su trabajo a su fork
   │  "Push Overleaf changes to GitHub"  │     con un mensaje descriptivo
   │  Mensaje: "Completé la introducción"│
   └─────────────────────────────────────┘
                    ↓
5. SOLICITAR REVISIÓN
   ┌─────────────────────────────────────┐
   │  GitHub: ir a su fork               │  ← Proponer cambios al
   │  Click "Contribute" →               │     repositorio principal
   │  "Open pull request"                │
   └─────────────────────────────────────┘
                    ↓
6. REVISIÓN Y MERGE
   ┌─────────────────────────────────────┐
   │  Compañeros revisan en GitHub       │  ← Comentar, aprobar,
   │  Mauricio hace merge si aprobado    │     pedir cambios
   └─────────────────────────────────────┘
                    ↓
7. VERIFICACIÓN FINAL
   ┌─────────────────────────────────────┐
   │  Overleaf "Main": Pull from GitHub  │  ← Confirmar que la versión
   │  Compilar y verificar               │     oficial compila bien
   └─────────────────────────────────────┘
```

---

## Conceptos Clave para el Taller

| Término | Significado | En nuestro flujo |
|---------|-------------|------------------|
| **Repositorio (repo)** | Carpeta de proyecto con historial | El repositorio `mauricio/articulo` en GitHub |
| **Fork** | Copia personal de un repo en tu cuenta | `josemiguel/articulo` es el fork de José Miguel |
| **Push (Overleaf→GitHub)** | Subir cambios de Overleaf a GitHub | "Push Overleaf changes to GitHub" en el menú |
| **Pull (GitHub→Overleaf)** | Traer cambios de GitHub a Overleaf | "Pull GitHub changes into Overleaf" en el menú |
| **Sync fork** | Actualizar tu fork con los cambios de main | Botón en GitHub: "Sync fork" → "Update branch" |
| **Pull Request (PR)** | Solicitud para integrar cambios al proyecto principal | "Revisemos mis cambios antes de agregarlos a la versión oficial" |
| **Merge** | Integrar cambios aprobados en main | Después de que el PR es aprobado y fusionado |
| **Issue** | Tarea o pendiente del proyecto | "Falta completar la sección de resultados" |

---

## Preguntas Frecuentes

### ¿Por qué no usar Google Docs?
Google Docs no soporta LaTeX. Para documentos académicos con ecuaciones, tablas complejas, y bibliografías automáticas, LaTeX es el estándar.

### ¿Necesito Overleaf Premium?
Solo el **owner del proyecto** (Mauricio) necesita Premium para la sincronización con GitHub. Los colaboradores no necesitan cuenta Premium — al ser invitados a un proyecto creado por un usuario Premium, pueden usar la función de sincronización.

### ¿Puedo trabajar offline?
No directamente — Overleaf requiere internet. Si necesitan capacidad offline, existe una versión alternativa de este taller que usa un editor local con Git en la terminal. Consulten con el instructor.

### ¿Qué pasa si quiero editar directamente en el proyecto "Main" de Overleaf?
No es recomendable. El proyecto "Main" debe recibir cambios solo a través de Pull Requests aprobados. Editar directamente ahí saltaría el proceso de revisión.

### ¿Puedo tener múltiples Pull Requests abiertos al mismo tiempo?
En este flujo, cada fork tiene una sola "rama" (main). Todos los cambios que hagas Push desde Overleaf se acumulan en tu fork. Si ya tienes un PR abierto, los nuevos Push se agregan automáticamente a ese PR. Por esto, es mejor terminar un ciclo de trabajo (PR → revisión → merge) antes de comenzar uno nuevo.

### ¿Qué pasa si la cuenta Premium de Mauricio expira?
La sincronización con GitHub dejará de funcionar en todos los proyectos vinculados. Los archivos en Overleaf seguirán ahí, pero no podrán hacer Push ni Pull. Asegúrense de que Mauricio haga Push de todos los cambios pendientes antes de que expire, así todo queda respaldado en GitHub.

---

## Referencias

- [GitHub Flow](https://docs.github.com/en/get-started/using-github/github-flow): Flujo oficial de GitHub
- [Overleaf GitHub Synchronization](https://docs.overleaf.com/integrations-and-add-ons/git-integration-and-github-synchronization/github): Documentación oficial
- [Pro Git Book](https://git-scm.com/book/en/v2): Libro gratuito y oficial de Git (para quienes quieran profundizar en Git de línea de comandos más adelante)
- [Fondrie, W. (2024): "10 Tips for Collaborative Writing with LaTeX and GitHub"](https://willfondrie.com/2024/02/10-tips-for-collaborative-writing-with-latex-and-github/): Universidad de Washington

---

**Anterior**: [← Configuración Previa](../00-instalacion/README.md)

**Siguiente**: [Parte 2 - Configuración Inicial →](../02-configuracion-inicial/README.md)
