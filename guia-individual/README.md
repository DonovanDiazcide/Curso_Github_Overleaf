# Guía Individual: LaTeX con Overleaf + VS Code como respaldo

> **Duración**: 10–15 minutos  
> **Para quién**: Personas que trabajan en Overleaf y necesitan un plan B cuando algo se rompe.  
> **Idea central**: Tu herramienta principal es **Overleaf**. Cuando algo deje de funcionar ahí (citas rotas, errores de compilación, etc.), te pasas a **VS Code + LaTeX Workshop** en tu computadora, que es más tolerante con errores y te da más control para diagnosticar y arreglar problemas.

---

## ¿Qué vas a aprender?

1. Instalar las herramientas necesarias en tu computadora (una sola vez)
2. Descargar tu proyecto de Overleaf para abrirlo en VS Code
3. Compilar y ver el PDF localmente
4. Arreglar lo que se rompió
5. Subir el proyecto corregido de vuelta a Overleaf

> **No vamos a ver Git, GitHub, ni colaboración.** Solo el flujo: Overleaf → VS Code → arreglar → Overleaf.

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

> **No necesitas instalar Git ni crear cuenta de GitHub.** Esas partes de las guías de instalación las puedes saltar. Solo instala: VS Code, MiKTeX/MacTeX, Perl (si Windows) y la extensión LaTeX Workshop.

### ✅ Verificación de la instalación

Cuando termines la instalación, abre VS Code y verifica:

1. En la barra lateral izquierda, haz clic en el ícono de **Extensiones** (cuadrito con pieza de puzzle)
2. Busca "LaTeX Workshop" — debe aparecer como **instalada**
3. Abre una terminal dentro de VS Code: **Terminal → New Terminal** (o **Ctrl + `**)
4. Escribe `pdflatex --version` y presiona Enter — debe mostrar un número de versión

Si ambas cosas funcionan, la instalación está completa.

---

## Paso 1 — Descargar tu proyecto de Overleaf (2 min)

**Propósito**: Traer una copia de tu proyecto a tu computadora para poder trabajar en VS Code.

### Qué hacer

1. Abre tu proyecto en **Overleaf**
2. Haz clic en **Menu** (esquina superior izquierda)
3. En la sección **Download**, haz clic en **Source** — esto descarga un archivo `.zip` con todo tu proyecto
4. Abre tu carpeta de **Descargas** y **descomprime** el `.zip`:
   - **Windows**: Clic derecho → **Extraer todo** → **Extraer**
   - **Mac**: Doble clic en el `.zip`
5. Mueve la carpeta descomprimida a un lugar donde la puedas encontrar (por ejemplo, `Documentos/mi-articulo/`)

### ✅ Verificación

Abre la carpeta descomprimida. Debes ver tus archivos: `main.tex`, tu archivo `.bib`, y cualquier otra cosa que tengas en Overleaf.

---

## Paso 2 — Abrir el proyecto en VS Code (2 min)

**Propósito**: Que VS Code reconozca tu proyecto completo, no solo un archivo suelto.

### Qué hacer

1. Abre **VS Code**
2. Ve a **File → Open Folder** (Archivo → Abrir Carpeta)
3. Navega hasta la **carpeta** que descomprimiste en el paso anterior
4. Selecciona la **carpeta** (no un archivo individual) y haz clic en **Seleccionar carpeta** / **Select Folder**

### ⚠️ Importante

**Siempre abre la carpeta, nunca el archivo suelto.** Si abres solo `main.tex` arrastrándolo a VS Code, el programa no va a encontrar los otros archivos de tu proyecto (como tu `.bib` o las carpetas de secciones) y la compilación va a fallar.

### ✅ Verificación

En la **barra lateral izquierda** (Explorer) debes ver todos tus archivos: `main.tex`, tu archivo `.bib`, y cualquier otra carpeta o archivo de tu proyecto.

---

## Paso 3 — Compilar y ver tu PDF (3 min)

**Propósito**: Generar el PDF a partir de tu código LaTeX y visualizarlo dentro de VS Code.

### Los atajos dependen de tu sistema

| Acción | Windows | Mac |
|--------|---------|-----|
| **Compilar** (Build) | `Ctrl + Alt + B` | `Cmd + Option + B` |
| **Ver PDF** (View) | `Ctrl + Alt + V` | `Cmd + Option + V` |
| **Guardar + compilar auto** | `Ctrl + S` | `Cmd + S` |

### Qué hacer

1. Haz clic en `main.tex` en el Explorer para abrirlo
2. Presiona el atajo de **Compilar** (ver tabla arriba)
3. Espera a que termine la compilación
4. Presiona el atajo de **Ver PDF**

El PDF se abre en un panel a la derecha del código.

### ⏳ La primera vez tarda — es normal

Cuando compilas por primera vez, **MiKTeX/MacTeX descarga automáticamente los paquetes que necesita** tu documento. Esto puede tardar entre **1 y 3 minutos** dependiendo de tu internet.

Mientras tanto:
- Verás un ícono girando en la barra inferior de VS Code
- **No cierres VS Code** ni hagas nada hasta que termine
- Las siguientes compilaciones serán mucho más rápidas (2–5 segundos)

### ✅ Verificación

Ves tu documento PDF dentro de VS Code, en un panel a la derecha del código fuente.

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

## Paso 5 — Subir el proyecto corregido a Overleaf (2 min)

**Propósito**: Una vez que arreglaste el problema en VS Code, regresar a Overleaf con tu proyecto funcionando.

### Qué hacer

1. En Overleaf, abre tu proyecto
2. Haz clic en el botón de **Upload** (ícono de flecha hacia arriba, arriba del panel de archivos)
3. Selecciona los archivos que modificaste (por ejemplo, `main.tex` y/o `biblio.bib`)
4. Overleaf te preguntará si quieres **reemplazar** los archivos existentes — di que **sí**
5. Compila en Overleaf para verificar que todo funciona de nuevo

> **Tip**: Solo sube los archivos `.tex` y `.bib` que hayas modificado. No subas los archivos auxiliares (`.aux`, `.log`, `.bbl`, etc.) — esos los genera Overleaf automáticamente.

---

## Problemas comunes y cómo resolverlos

### 🔴 Regla de oro para VS Code

> **El PDF SOLO se debe ver dentro de VS Code.**  
> Nunca lo abras con WPS Office, Adobe Acrobat, ni ningún otro programa mientras estés trabajando.

**¿Por qué?** Cuando otro programa abre el PDF, lo **bloquea**. VS Code no puede actualizar un archivo bloqueado. Entonces aunque guardes y compiles, el PDF en VS Code se queda congelado en la versión anterior. Parece que "nada funciona", pero el problema es solo que otro programa tiene el archivo secuestrado.

**Solución**: Cierra el PDF en cualquier otro programa. Usa **solo** el visor dentro de VS Code.

### Tabla de problemas frecuentes

| Problema | Causa probable | Solución |
|----------|---------------|----------|
| **El PDF no se actualiza aunque guardo** | El PDF está abierto en WPS Office, Adobe u otro programa | Cierra el PDF en el otro programa. Solo velo dentro de VS Code |
| **Las citas aparecen como `[?]`** | Compilación incompleta o nombre del `.bib` incorrecto | 1) Verifica que `\bibliography{biblio}` coincida con tu archivo `biblio.bib`. 2) Recompila con el atajo de Build |
| **Las citas funcionaban y de repente se rompieron** | Probablemente un error de sintaxis en el `.bib` (una coma faltante, una llave sin cerrar) | Abre tu archivo `.bib` en VS Code y revisa que cada entrada tenga sus llaves `{ }` bien cerradas y comas entre campos |
| **Error: "File 'paquete.sty' not found"** | Un paquete de LaTeX no está instalado | MiKTeX lo instala solo. Si no: abre **MiKTeX Console → Packages → busca el paquete → instalar**. En Mac, MacTeX ya incluye todo |
| **La compilación tarda mucho** | Primera vez, MiKTeX descarga paquetes | Normal. Espera. Las siguientes veces será rápido |
| **Aparecen errores rojos en la barra inferior** | Error de sintaxis en tu `.tex` | Haz clic en el número de errores (barra inferior) para ver qué línea tiene el problema |
| **El PDF se ve pero el contenido es viejo** | VS Code muestra versión en caché | Cierra la pestaña del PDF y ábrela de nuevo con el atajo de Ver PDF |
| **"I found no \\citation commands"** | No hay ningún `\cite{...}` en el texto | Agrega al menos una cita en el cuerpo del documento |
| **"I found no \\bibstyle command"** | Falta `\bibliographystyle{...}` en tu `.tex` | Agrega `\bibliographystyle{apalike}` antes de `\bibliography{biblio}` |

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

Si todo funciona, ya estás lista para usar VS Code como respaldo de Overleaf.

---

## Resumen: El flujo completo

```
                     ┌──────────────────────────┐
                     │     Trabajo normal        │
                     │     en Overleaf           │
                     └─────────┬────────────────┘
                               │
                    ¿Algo se rompió?
                       │           │
                      No          Sí
                       │           │
                  Sigue en     ┌───▼───────────────────┐
                  Overleaf     │ 1. Overleaf → Menu     │
                               │    → Download Source   │
                               │ 2. Descomprimir .zip   │
                               │ 3. VS Code → Open      │
                               │    Folder              │
                               │ 4. Compilar + arreglar │
                               │ 5. Subir archivos      │
                               │    corregidos a        │
                               │    Overleaf            │
                               └───────────────────────┘
```

---

## Tarjeta de referencia rápida

```
╔══════════════════════════════════════════════════════════════╗
║         LaTeX: Overleaf + VS Code — Referencia              ║
╠══════════════════════════════════════════════════════════════╣
║                                                              ║
║  FLUJO NORMAL: Trabajar en Overleaf                          ║
║  SI SE ROMPE:  Descargar → VS Code → Arreglar → Subir       ║
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
╚══════════════════════════════════════════════════════════════╝
```
