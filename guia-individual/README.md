# Guía Individual: De Overleaf a VS Code — compila todo, gratis y rápido

> **Duración**: 10–15 minutos (si ya tienes todo instalado)  
> **Para quién**: Personas que trabajan en Overleaf y quieren una herramienta más confiable y potente.  
> **Idea central**: **Overleaf** funciona bien para empezar, pero tiene limitaciones reales: a veces no compila ciertos paquetes o citas que son perfectamente válidos, y la versión gratuita tiene tiempos de compilación lentos. **VS Code + LaTeX Workshop** en tu computadora es gratuito, compila prácticamente todo sin problemas, y tiene tiempos de compilación comparables a la versión de paga de Overleaf (~$100 USD/año). **Cuando Overleaf te falle, migra a VS Code y quédate ahí** — no hay razón para volver.

---

## 🚨 ¿Necesitas tu PDF URGENTE y no tienes nada instalado?

Si tienes una fecha de entrega encima y no puedes instalar nada ahorita, **no intentes seguir esta guía ahora**. En su lugar:

> **Mándanos tu proyecto inmediatamente** (tus archivos `.tex` y `.bib`) y nosotros lo compilamos por ti. Te regresamos el PDF.  
> Puedes compartirlo por Overleaf (comparte el proyecto con nosotros) o mandarlo como `.zip` por correo/WhatsApp.

**Mensaje que puedes copiar y pegar:**

> *Hola, tengo un problema con mi documento en Overleaf: [describe brevemente qué pasa, ej: "las citas salen como [?]" o "no compila y me da error"]. Les comparto mi proyecto para que me ayuden a compilarlo. ¡Gracias!*

Después, con calma, instala las herramientas siguiendo esta guía para que la próxima vez puedas resolverlo tú misma en 2 minutos.

---

## Antes de empezar: Esto NO es tu culpa

Si tu documento compilaba bien y de repente deja de funcionar en Overleaf, o si las citas se rompen aunque ya estaban bien, **no es algo que hayas hecho mal**. Overleaf a veces tiene limitaciones con ciertos paquetes o configuraciones que son completamente válidos en LaTeX.

La solución es sencilla: **descargar tu proyecto y compilarlo en VS Code**, que es más tolerante y procesa prácticamente todo sin problemas. Y una vez que funcione en VS Code, **quédate ahí** — es más rápido, más estable, y completamente gratis. No necesitas volver a Overleaf.

> **💰 Bonus**: VS Code + LaTeX Workshop te da tiempos de compilación similares a Overleaf Pro (~$100 USD/año) pero **sin pagar nada**. En Overleaf gratis, documentos grandes pueden tardar 30+ segundos. En VS Code, los mismos documentos compilan en 2–5 segundos.

**Y si ni en VS Code funciona**, no te preocupes: mándanos tu proyecto (los archivos `.tex` y `.bib`) y lo revisamos juntos. Eso es completamente normal y para eso estamos. No te quedes con la duda.

---

## Si ya tienes todo instalado — Ruta rápida (30 segundos)

Si ya completaste la instalación y solo quieres el recordatorio:

1. **Overleaf** → Menu → Download → **Source** (descarga .zip)
2. Descomprimir el .zip
3. **VS Code** → File → **Open Folder** → seleccionar la **carpeta** (NO el archivo)
4. Abrir `main.tex` → **Compilar**: `Ctrl+Alt+B` (Win) / `Cmd+Option+B` (Mac)
5. **Ver PDF**: `Ctrl+Alt+V` (Win) / `Cmd+Option+V` (Mac)
6. ¿Funciona? ¡Listo! Tu PDF está en la misma carpeta como `main.pdf`

> ¿El atajo no funciona? → `Ctrl+Shift+P` (Win) / `Cmd+Shift+P` (Mac) → escribe **"LaTeX Build"** → Enter

Si algo no funciona, sigue leyendo paso a paso abajo.

---

## ¿Qué vas a aprender?

1. Instalar las herramientas necesarias en tu computadora (una sola vez)
2. Descargar tu proyecto de Overleaf para abrirlo en VS Code
3. Compilar y ver el PDF en tu computadora (muchas veces eso es todo lo que se necesita)
4. Seguir trabajando en VS Code de aquí en adelante
5. Saber cuándo pedir ayuda (y sentirte cómoda haciéndolo)

> **No vamos a ver Git, GitHub, ni colaboración.** Solo: Overleaf → VS Code → compila → quédate en VS Code.

---

## Paso 0 — Instalación (una sola vez, ~45 min)

Antes de poder usar VS Code como respaldo, necesitas instalar unas herramientas en tu computadora. **Solo se hace una vez.**

### Identifica tu sistema

Primero, identifica qué computadora y en qué idioma la tienes, y sigue la guía correspondiente:

| Sistema | Idioma | Guía |
|---------|--------|------|
| **Windows** | Español | [Guía de instalación — Windows Español](../00-instalacion/windows-espanol.md) |
| **Windows** | Inglés | [Guía de instalación — Windows English](../00-instalacion/windows-ingles.md) |
| **Mac** | Español o Inglés | [Guía de instalación — Mac](../00-instalacion/mac-espanol.md) |

> **¿Cómo sé si tengo Windows o Mac?**  
> - Si tu computadora es Dell, HP, Lenovo, Asus, Acer, o Surface → **Windows**  
> - Si tu computadora es MacBook, iMac, o Mac mini → **Mac**
>
> **¿En qué idioma está mi sistema?**  
> - **Windows**: Configuración → Hora e idioma → Idioma. Si dice "Español" → Español, si dice "English" → Inglés  
> - **Mac**: Preferencias del Sistema → General → Idioma y región

### ¿Qué se instala?

| Herramienta | ¿Para qué? | Tiempo |
|-------------|------------|--------|
| **VS Code** | Editor de texto donde vas a abrir y editar tus archivos `.tex` | 5 min |
| **MiKTeX** (Windows) o **MacTeX** (Mac) | El motor que convierte tu código LaTeX en PDF | 15–30 min |
| **Strawberry Perl** (solo Windows) | Necesario para que LaTeX Workshop funcione | 5 min |
| **LaTeX Workshop** (extensión de VS Code) | La extensión que conecta VS Code con LaTeX | 2 min |

> **No necesitas instalar Git ni crear cuenta de GitHub.** De las guías de instalación, solo sigue los pasos para estos 4 programas:
>
> ✅ **Instala estos (y nada más):**
> 1. VS Code
> 2. MiKTeX (Windows) o MacTeX (Mac)
> 3. Strawberry Perl (solo Windows)
> 4. La extensión "LaTeX Workshop" dentro de VS Code
>
> ❌ **Salta todo lo que diga:** Git, GitHub, cuenta de GitHub, SSH, token, terminal de Git, "clonar repositorio"

### ✅ Verificación de la instalación

Cuando termines la instalación, abre VS Code y verifica:

1. En la barra lateral izquierda, haz clic en el ícono de **Extensiones** (cuadrito con pieza de puzzle)
2. Busca "LaTeX Workshop" — debe aparecer como **instalada**
3. Abre una terminal dentro de VS Code: **Terminal → New Terminal** (o **Ctrl + `**)
4. Escribe `pdflatex --version` y presiona Enter — debe mostrar un número de versión

Si ambas cosas funcionan, la instalación está completa. ¡Muy bien, ya hiciste lo más tardado!

> **¿Te trabaste en algún paso de la instalación?** No intentes forzar nada — mándanos un mensaje describiendo dónde te quedaste y te ayudamos. La instalación debería ser directa y si no lo está, probablemente hay algo específico de tu computadora que podemos resolver rápido.  
> 
> *Mensaje sugerido: "Hola, estoy siguiendo la guía de instalación y me trabé en [describe el paso]. Me aparece [describe qué ves]. ¿Me pueden ayudar?"*

---

## Paso 1 — Descargar tu proyecto de Overleaf (2 min)

**Propósito**: Traer una copia de tu proyecto a tu computadora para compilarlo en VS Code.

**¿Cuándo hacer esto?** Cuando Overleaf te marque errores que no puedes resolver, cuando las citas se rompan, o cuando simplemente no compile. No necesitas entender qué salió mal — solo descárgalo y VS Code se encarga.

### Qué hacer

1. Abre tu proyecto en **Overleaf**
2. Haz clic en **Menu** (esquina superior izquierda)
3. En la sección **Download**, haz clic en **Source** — esto descarga un archivo `.zip` con todo tu proyecto
4. Abre tu carpeta de **Descargas** y **descomprime** el `.zip`:
   - **Windows**: Clic derecho → **Extraer todo** → **Extraer**
   - **Mac**: Doble clic en el `.zip`
5. Mueve la carpeta descomprimida a un lugar donde la puedas encontrar (por ejemplo, `Documentos/mi-articulo/`)

> **Nota**: A veces al descomprimir se crea una carpeta dentro de otra carpeta (ej: `mi-articulo/mi-articulo/`). Si eso pasa, abre la carpeta de **adentro** — esa es la que tiene tus archivos.

### ✅ Verificación

Abre la carpeta descomprimida. Debes ver tus archivos: `main.tex`, tu archivo `.bib`, y cualquier otra cosa que tengas en Overleaf. Si los ves, vas perfecto.

---

## Paso 2 — Abrir el proyecto en VS Code (2 min)

**Propósito**: Que VS Code reconozca tu proyecto completo, no solo un archivo suelto.

### ⚠️ Importante (léelo antes de empezar)

**Siempre abre la carpeta, nunca el archivo suelto.** Si abres solo `main.tex` arrastrándolo a VS Code, el programa no va a encontrar los otros archivos de tu proyecto (como tu `.bib` o las carpetas de secciones) y la compilación va a fallar.

### Qué hacer

1. Abre **VS Code**
2. Ve a **File → Open Folder** (Archivo → Abrir Carpeta)
3. Navega hasta la **carpeta** que descomprimiste en el paso anterior
4. Selecciona la **carpeta** (no un archivo individual) y haz clic en **Seleccionar carpeta** / **Select Folder**
5. Si VS Code te pregunta **"Do you trust the authors of the files in this folder?"** — haz clic en **"Yes, I trust the authors"**. Esto es normal y solo aparece la primera vez que abres una carpeta nueva.

### ✅ Verificación

En la **barra lateral izquierda** (Explorer) debes ver todos tus archivos: `main.tex`, tu archivo `.bib`, y cualquier otra carpeta o archivo de tu proyecto. Si los ves, todo va bien.

---

## Paso 3 — Compilar y ver tu PDF (3 min)

**Propósito**: Generar el PDF a partir de tu código LaTeX y visualizarlo dentro de VS Code. En muchos casos, **esto es todo lo que necesitas** — el mismo documento que Overleaf no podía compilar, VS Code lo compila sin problemas.

### Los atajos dependen de tu sistema

| Acción | Windows | Mac |
|--------|---------|-----|
| **Compilar** (Build) | `Ctrl + Alt + B` | `Cmd + Option + B` |
| **Ver PDF** (View) | `Ctrl + Alt + V` | `Cmd + Option + V` |
| **Guardar + compilar auto** | `Ctrl + S` | `Cmd + S` |

> **¿El atajo de teclado no funciona?** Puedes compilar desde el menú de comandos: presiona `Ctrl+Shift+P` (Win) / `Cmd+Shift+P` (Mac), escribe **"LaTeX Build"** y selecciona **"LaTeX Workshop: Build LaTeX project"**. Para ver el PDF: escribe **"LaTeX PDF"** y selecciona **"LaTeX Workshop: View LaTeX PDF"**.

### Qué hacer

1. Haz clic en `main.tex` en el Explorer para abrirlo
2. Presiona el atajo de **Compilar** (ver tabla arriba)
3. Espera a que termine la compilación
4. Presiona el atajo de **Ver PDF**

El PDF se abre en un panel a la derecha del código.

### ⏳ La primera vez tarda — es normal

Cuando compilas por primera vez, **MiKTeX/MacTeX descarga automáticamente los paquetes que necesita** tu documento. Esto puede tardar entre **1 y 3 minutos** dependiendo de tu internet. Esto le pasa a todos la primera vez.

> **📦 Si aparece una ventana de MiKTeX pidiéndote permiso para instalar paquetes**, haz clic en **"Install"** o **"Yes"**. Esto es completamente normal — MiKTeX necesita descargar los componentes que tu documento usa. Si te pregunta varias veces, di que sí cada vez. Solo pasa la primera vez.

Mientras tanto:
- Verás un ícono girando en la barra inferior de VS Code
- **No cierres VS Code** ni hagas nada hasta que termine
- Las siguientes compilaciones serán mucho más rápidas (2–5 segundos)

### ✅ Verificación

Ves tu documento PDF dentro de VS Code, en un panel a la derecha del código fuente. **¡Felicidades! Ya lograste lo más importante.** De aquí en adelante es puro `Ctrl+S`.

---

## Paso 4 — Guardar = Compilar (2 min)

**Propósito**: Después del primer Build, el día a día es todavía más sencillo.

**Eso es todo lo que necesitas recordar:**

| Acción | Windows | Mac |
|--------|---------|-----|
| **Guardar y compilar** | `Ctrl + S` | `Cmd + S` |

Cuando guardas:

1. VS Code **guarda** tu archivo
2. LaTeX Workshop **compila** automáticamente el documento
3. El **PDF se actualiza** solo en el panel derecho

### Citas y bibliografía

Si tu documento tiene citas (`\cite{...}`) y un archivo `.bib`:

- **Guardar es suficiente** en la mayoría de los casos. LaTeX Workshop ejecuta automáticamente todas las pasadas necesarias (pdflatex + bibtex + pdflatex + pdflatex)
- Si las citas aparecen como **`[?]`** después de guardar, presiona el atajo de **Compilar** para forzar una recompilación completa
- Verifica que el nombre en `\bibliography{biblio}` coincida **exactamente** con el nombre de tu archivo (sin la extensión `.bib`). Si tu archivo se llama `biblio.bib`, debes escribir `\bibliography{biblio}`

### ✅ Verificación

Haces un cambio en tu `.tex`, guardas, y el PDF se actualiza solo.

---

## Paso 5 — Quédate en VS Code (¡ya no necesitas Overleaf!)

**Propósito**: Ahora que VS Code compila tu documento sin problemas, **no hay razón para volver a Overleaf**. Puedes seguir trabajando directamente en VS Code.

### ¿Por qué quedarte en VS Code?

| | Overleaf (gratis) | Overleaf Pro (~$100 USD/año) | VS Code + LaTeX Workshop |
|---|---|---|---|
| **Precio** | Gratis | ~$100 USD/año | **Gratis** |
| **Compilación** | Lenta (30+ seg en docs grandes) | Rápida (~5 seg) | **Rápida (2–5 seg)** |
| **Paquetes** | Limitados, a veces falla | Más estable | **Todo funciona** |
| **Funciona sin internet** | No | No | **Sí** |
| **Timeout de compilación** | 1 min (gratis) / 4 min (pro) | 4 min | **Sin límite** |

### Tu flujo de trabajo ahora

1. Edita tu `.tex` directamente en VS Code
2. Guarda (`Ctrl+S` / `Cmd+S`) — el PDF se actualiza automáticamente
3. Cuando termines, tu PDF está en la misma carpeta como `main.pdf`
4. Envía el PDF directamente (correo, plataforma, etc.) — no necesitas pasar por Overleaf

> **¿Y si necesito colaborar con alguien en Overleaf?** Si tu coautor o equipo usa Overleaf, puedes subir tus archivos actualizados: Upload → seleccionar archivos `.tex` y `.bib` → reemplazar. Pero para tu trabajo individual, VS Code es más rápido y confiable.

> **¿Puedo usar ambos?** Sí, pero no al mismo tiempo. Si decides editar en Overleaf otra vez, descarga Source antes de volver a VS Code para no perder cambios.

---

## Problemas comunes y cómo resolverlos

> **Recuerda**: La mayoría de estos problemas **no son errores tuyos**. Son limitaciones de las herramientas o cosas que pasan normalmente al trabajar con LaTeX. Todos los que usamos LaTeX hemos pasado por esto.

### 🔴 Regla de oro para VS Code

> **El PDF SOLO se debe ver dentro de VS Code.**  
> Nunca lo abras con WPS Office, Adobe Acrobat, ni ningún otro programa mientras estés trabajando.

**¿Por qué?** Cuando otro programa abre el PDF, lo **bloquea**. VS Code no puede actualizar un archivo bloqueado. Entonces aunque guardes y compiles, el PDF en VS Code se queda congelado en la versión anterior. Parece que "nada funciona", pero el problema es solo que otro programa tiene el archivo secuestrado.

**Solución**: Cierra el PDF en cualquier otro programa. Usa **solo** el visor dentro de VS Code.

### Tabla de problemas frecuentes

> **¿No quieres diagnosticar tú misma?** Está bien. Salta esta tabla y ve directo a la [sección verde (🟢)](#-y-si-nada-de-esto-funciona) más abajo para mandarnos tu proyecto.

| Problema | Causa probable | Solución |
|----------|---------------|----------|
| **El PDF no se actualiza aunque guardo** | El PDF está abierto en WPS Office, Adobe u otro programa | Cierra el PDF en el otro programa. Solo velo dentro de VS Code |
| **Las citas aparecen como `[?]`** | Compilación incompleta o nombre del `.bib` incorrecto | 1) Verifica que `\bibliography{biblio}` coincida con tu archivo `biblio.bib`. 2) Recompila con el atajo de Build. Esto es muy común y se resuelve fácil |
| **Las citas funcionaban y de repente se rompieron** | A veces Overleaf no procesa bien ciertos formatos de `.bib`. No es tu culpa | Descarga y compila en VS Code. Si ahí funciona, ya tienes tu PDF. Si no: revisa que cada entrada en el `.bib` tenga sus llaves `{ }` cerradas y comas entre campos |
| **Error: "File 'paquete.sty' not found"** | Un paquete de LaTeX no está instalado | MiKTeX lo instala solo. Si no: abre **MiKTeX Console → Packages → busca el paquete → instalar**. En Mac, MacTeX ya incluye todo |
| **La compilación tarda mucho** | Primera vez, MiKTeX descarga paquetes | Normal. Espera. Las siguientes veces será rápido |
| **Aparecen errores rojos en la barra inferior** | Error de sintaxis en tu `.tex` | Haz clic en el número de errores (barra inferior) para ver qué línea tiene el problema |
| **El PDF se ve pero el contenido es viejo** | VS Code muestra versión en caché | Cierra la pestaña del PDF y ábrela de nuevo con el atajo de Ver PDF |
| **"I found no \\citation commands"** | No hay ningún `\cite{...}` en el texto | Agrega al menos una cita en el cuerpo del documento |
| **"I found no \\bibstyle command"** | Falta `\bibliographystyle{...}` en tu `.tex` | Agrega `\bibliographystyle{apalike}` antes de `\bibliography{biblio}` |

### 🟢 ¿Y si nada de esto funciona?

**Está perfectamente bien pedir ayuda.** Si seguiste los pasos y ni Overleaf ni VS Code compilan tu documento, mándanos lo siguiente:

1. Tu archivo `main.tex`
2. Tu archivo `.bib` (por ejemplo, `biblio.bib`)
3. Cualquier otro archivo que use tu proyecto (imágenes, otros `.tex`, etc.)
4. Una descripción breve de qué pasa: "le doy compilar y sale este error" o "las citas salen como [?]"

**Puedes mandarlo por Overleaf** (compartiéndonos el proyecto) **o por correo** (en un .zip con los archivos).

No tienes que resolverlo sola. A veces el error está en un lugar que no es obvio, y entre todos lo encontramos más rápido. **Para eso estamos.**

**Mensaje que puedes copiar y pegar:**

> *Hola, tengo un problema con mi documento. En Overleaf [describe qué pasa, ej: "las citas salen como [?]" o "no compila"]. Intenté compilar en VS Code y [describe qué pasó, ej: "salió el mismo error" o "no sé cómo hacerlo"]. Les comparto mis archivos para que me ayuden. ¡Gracias!*

---

## Practica con el ejemplo incluido

En la carpeta [`ejemplo/`](ejemplo/) de esta guía hay dos archivos listos para practicar:

- `main.tex` — Un documento mínimo con una cita
- `biblio.bib` — El archivo de bibliografía con 2 entradas

### Ejercicio

1. En VS Code, ve a **File → Open Folder** y abre la carpeta `ejemplo/`
2. Abre `main.tex`
3. Compila con el atajo de Build
4. Ve el PDF con el atajo de Ver PDF
5. Verifica que la cita aparezca correctamente (no como `[?]`)
6. Cambia algo en el texto (por ejemplo, agrega una oración)
7. Guarda y observa cómo el PDF se actualiza solo

Si todo funciona, ya estás lista para usar VS Code cuando Overleaf te dé problemas. Y si algo falla en este ejercicio, mándanos un mensaje — eso nos ayuda a saber si hay algo que ajustar en la instalación.

---

## Resumen: El flujo completo

```
                     ┌──────────────────────────┐
                     │     Trabajo normal        │
                     │     en Overleaf           │
                     └─────────┬────────────────┘
                               │
                  ¿Overleaf no compila?
                       │           │
                      No          Sí
                       │           │
                  Sigue en     ┌───▼───────────────────┐
                  Overleaf     │ 1. Descargar Source    │
                  (por ahora)  │ 2. Abrir carpeta en   │
                               │    VS Code            │
                               │ 3. Compilar (Ctrl+    │
                               │    Alt+B / Cmd+Opt+B) │
                               └───────┬───────────────┘
                                       │
                              ¿Compiló en VS Code?
                                 │           │
                                Sí          No
                                 │           │
                           ¡Quédate en   Manda tu proyecto
                           VS Code!     al equipo. No es
                           Es gratis,   tu culpa, y para
                           rápido, y    eso estamos.
                           más estable.
```

---

## Tarjeta de referencia rápida

```
╔══════════════════════════════════════════════════════════════╗
║         LaTeX: Overleaf + VS Code — Referencia              ║
╠══════════════════════════════════════════════════════════════╣
║                                                              ║
║  FLUJO:  Overleaf → ¿no compila? → VS Code → ¡quédate!    ║
║                                                              ║
╠══════════════════════════════════════════════════════════════╣
║                     ATAJOS EN VS CODE                        ║
║                                                              ║
║            Windows                    Mac                    ║
║  Compilar: Ctrl + Alt + B    Compilar: Cmd + Option + B     ║
║  Ver PDF:  Ctrl + Alt + V    Ver PDF:  Cmd + Option + V     ║
║  Guardar:  Ctrl + S          Guardar:  Cmd + S              ║
║                                                              ║
╠══════════════════════════════════════════════════════════════╣
║  ⚠️  En VS Code, el PDF SOLO se ve dentro de VS Code.       ║
║      Nunca abrirlo con WPS, Adobe u otro programa.           ║
║                                                              ║
║  Si las citas salen como [?]:                                ║
║     → Recompilar con el atajo de Build                       ║
║     → Verificar nombre en \bibliography{...}                 ║
║                                                              ║
║  Si nada funciona:                                           ║
║     → Mándanos tu main.tex + .bib y lo vemos juntos.         ║
║       Para eso estamos.                                      ║
║                                                              ║
║  VS Code es gratis y compila tan rápido como Overleaf Pro.   ║
║  ¡Quédate en VS Code!                                        ║
╚══════════════════════════════════════════════════════════════╝
```
