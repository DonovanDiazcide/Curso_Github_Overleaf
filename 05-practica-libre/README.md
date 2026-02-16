# Parte 5: Práctica Libre y Cierre

> **Duración**: 20 minutos (15 práctica + 5 cierre)  
> **Objetivo**: Aplicar todo lo aprendido de forma independiente — 100% en el navegador

---

## Resumen de esta parte

| Paso | Descripción | Tiempo |
|------|-------------|--------|
| 5.1 | Tareas asignadas para cada participante | 2 min |
| 5.2 | Trabajo independiente en Overleaf | 8 min |
| 5.3 | Push, Pull Requests y revisión | 5 min |
| 5.4 | Merge y sincronización final | 3 min |
| 5.5 | Cierre: resumen y recursos | 2 min |

---

## 5.1 Tareas asignadas

Cada participante completará una sección del artículo de forma **independiente**, aplicando todo el flujo aprendido. Todo se hace en el navegador: edición en Overleaf, revisión en GitHub.

| Participante | Proyecto Overleaf | Archivo a editar | Tarea específica |
|--------------|-------------------|------------------|------------------|
| **José Miguel** | Articulo-JM-Workspace | `sections/related-work.tex` | Agregar 2-3 párrafos sobre trabajos relacionados |
| **Mauricio** | Articulo-Main | `sections/results.tex` | Completar con una tabla comparativa |
| **Rodrigo** | Articulo-Rodrigo-Workspace | `sections/conclusion.tex` | Escribir conclusiones y trabajo futuro |

### Contenido sugerido para cada sección

<details>
<summary><strong>José Miguel: Related Work</strong></summary>

Crear el archivo `sections/related-work.tex` en su proyecto Overleaf y escribir:

```latex
\section{Trabajos Relacionados}

Existen diversas aproximaciones a la colaboración en documentos académicos.
A continuación revisamos las más relevantes.

\subsection{Herramientas de edición colaborativa}

Google Docs y Microsoft Word Online permiten edición simultánea, pero carecen
de soporte nativo para LaTeX. Overleaf \citep{overleaf2024docs} resuelve esto
parcialmente al ofrecer un editor LaTeX en línea con colaboración en tiempo real.

\subsection{Control de versiones en academia}

El uso de Git en investigación ha crecido significativamente.
\citet{perez2024github} demuestran que GitHub facilita la reproducibilidad
y colaboración en laboratorios de investigación.

\subsection{Flujos de trabajo híbridos}

Algunos equipos combinan múltiples herramientas. El enfoque que presentamos
en este artículo sigue esta línea, integrando Overleaf y GitHub con un modelo
de forks que permite revisión formal sin necesidad de herramientas locales.
```

**No olviden** agregar `\input{sections/related-work}` en `main.tex` (después de introduction).

</details>

<details>
<summary><strong>Mauricio: Results (con tabla)</strong></summary>

Editar `sections/results.tex` en el proyecto "Articulo-Main":

```latex
\section{Resultados}

Implementamos el flujo de trabajo propuesto durante el desarrollo de este
artículo. A continuación presentamos los resultados observados.

\subsection{Beneficios de la colaboración con GitHub y Overleaf}

Durante el taller, el equipo logró:
\begin{itemize}
    \item Configurar un entorno de trabajo completamente en el navegador
    \item Realizar múltiples contribuciones en paralelo sin conflictos
    \item Revisar formalmente cada contribución antes de integrarla
    \item Mantener un historial completo de cambios con contexto
\end{itemize}

\subsection{Comparación con métodos tradicionales}

La Tabla \ref{tab:comparacion} muestra las diferencias entre el flujo
tradicional y el flujo propuesto.

\begin{table}[h]
\centering
\caption{Comparación de flujos de trabajo colaborativo}
\label{tab:comparacion}
\begin{tabular}{|l|c|c|}
\hline
\textbf{Característica} & \textbf{Tradicional} & \textbf{Overleaf + GitHub} \\
\hline
Control de versiones & Manual & Intencional \\
\hline
Historial de cambios & Limitado & Completo con contexto \\
\hline
Trabajo simultáneo & Difícil & Cada quien en su espacio \\
\hline
Revisión de cambios & Por correo/chat & Pull Requests formales \\
\hline
Instalación requerida & Variable & Ninguna (100\% navegador) \\
\hline
Backup & Manual & Automático en GitHub \\
\hline
\end{tabular}
\end{table}
```

</details>

<details>
<summary><strong>Rodrigo: Conclusion</strong></summary>

Editar `sections/conclusion.tex` en su proyecto Overleaf:

```latex
\section{Conclusión}

En este artículo presentamos un flujo de trabajo colaborativo para la
escritura de artículos académicos en LaTeX, combinando Overleaf y GitHub
con un modelo de forks — todo desde el navegador.

\subsection{Contribuciones principales}

Las principales contribuciones de este trabajo son:
\begin{enumerate}
    \item Un flujo de trabajo que no requiere instalaciones locales
    \item Separación clara entre trabajo en progreso y versión oficial
    \item Revisión formal de cambios mediante Pull Requests
    \item Guías paso a paso accesibles para investigadores sin experiencia en Git
\end{enumerate}

\subsection{Limitaciones}

El flujo propuesto requiere que al menos un miembro del equipo tenga
cuenta Premium de Overleaf para la sincronización con GitHub. Además,
la sincronización no es automática — cada persona debe hacer Push/Pull
manualmente, lo cual también es una ventaja (intencionalidad).

\subsection{Trabajo futuro}

Como trabajo futuro, se podría explorar:
\begin{itemize}
    \item Integración con sistemas de gestión de referencias como Zotero
    \item Uso de GitHub Issues para organizar la escritura del artículo
    \item Plantillas pre-configuradas para diferentes journals
\end{itemize}

\subsection*{Agradecimientos}

Agradecemos a todos los participantes del taller por su entusiasmo
y colaboración durante el desarrollo de este ejercicio práctico.
```

</details>

---

## 5.2 Trabajo independiente (8 minutos)

### El flujo completo que deben seguir

```
┌─────────────────────────────────────────────────────────────┐
│  CHECKLIST DE TRABAJO INDEPENDIENTE                         │
└─────────────────────────────────────────────────────────────┘

□ 1. SINCRONIZAR (antes de empezar)
      GitHub: ir a su fork → "Sync fork" → "Update branch"
      Overleaf: Menu → GitHub → "Pull GitHub changes into Overleaf"

□ 2. EDITAR (en su proyecto Overleaf)
      Crear/editar su archivo .tex
      Si es archivo nuevo, actualizar main.tex:
        Agregar: \input{sections/su-seccion}

□ 3. COMPILAR
      Verificar que el PDF se genera correctamente en Overleaf

□ 4. SUBIR (Push a GitHub)
      Overleaf: Menu → GitHub → "Push Overleaf changes to GitHub"
      Mensaje: "Completé la sección de [su sección]"

□ 5. PROPONER (Pull Request)
      GitHub: ir a su fork → "Contribute" → "Open pull request"
      Escribir título y descripción del PR
```

### Pasos específicos por participante

<details>
<summary><strong>José Miguel</strong></summary>

1. **Sincronizar**: GitHub fork → "Sync fork" → Overleaf → "Pull from GitHub"
2. **Crear archivo**: En Overleaf (Articulo-JM-Workspace), crear `sections/related-work.tex`
3. **Actualizar main.tex**: Agregar `\input{sections/related-work}` después de `\input{sections/introduction}`
4. **Compilar**: Verificar que el PDF incluye la nueva sección
5. **Push**: Menu → GitHub → Push → Mensaje: `"Agregué sección Related Work con revisión de literatura"`
6. **PR**: GitHub → fork → Contribute → Open pull request

</details>

<details>
<summary><strong>Rodrigo</strong></summary>

1. **Sincronizar**: GitHub fork → "Sync fork" → Overleaf → "Pull from GitHub"
2. **Editar**: En Overleaf (Articulo-Rodrigo-Workspace), editar `sections/conclusion.tex`
3. **Compilar**: Verificar que el PDF se genera correctamente
4. **Push**: Menu → GitHub → Push → Mensaje: `"Escribí conclusiones con contribuciones y trabajo futuro"`
5. **PR**: GitHub → fork → Contribute → Open pull request

</details>

<details>
<summary><strong>Mauricio</strong></summary>

1. **Editar**: En Overleaf (Articulo-Main), editar `sections/results.tex`
2. **Compilar**: Verificar PDF
3. **Push**: Menu → GitHub → Push → Mensaje: `"Completé Results con tabla comparativa"`

> ⚠️ **Nota**: En este ejercicio, Mauricio edita directamente en "Main" para simplificar. En un flujo real, incluso Mauricio debería usar su propio fork para que sus cambios pasen por revisión.

</details>

---

## 5.3 Pull Requests y revisión (5 minutos)

### Crear los Pull Requests

José Miguel y Rodrigo:
1. Ir a su fork en GitHub
2. Click en **"Contribute"** → **"Open pull request"**
3. Configurar:
   - **base repository**: `mauricio/articulo-taller-colaboracion`
   - **base**: `main`
   - **head repository**: su fork
   - **compare**: `main`
4. Escribir título y descripción
5. Click **"Create pull request"**

### Revisar los PRs de los compañeros

| Revisor | Revisa el PR de |
|---------|-----------------|
| José Miguel | Rodrigo |
| Rodrigo | José Miguel |
| Mauricio | Ambos PRs |

**Cómo revisar (recordatorio):**
1. Ir al PR → pestaña **"Files changed"**
2. Revisar los cambios (líneas verdes = agregadas, rojas = eliminadas)
3. Agregar comentarios si tienen sugerencias
4. Click en **"Review changes"** → **"Approve"** → **"Submit review"**

---

## 5.4 Merge y sincronización final (3 minutos)

### Hacer merge de los PRs (Mauricio)

Para cada PR aprobado:
1. Ir al PR en GitHub
2. Verificar que tiene al menos una aprobación
3. Click en **"Merge pull request"**
4. ⚠️ **Verificar**: debe decir **"Create a merge commit"** (NO squash ni rebase)
5. Click en **"Confirm merge"**

### Sincronización final (Todos)

**Mauricio** (proyecto Main):
1. Overleaf → Menu → GitHub → "Pull GitHub changes into Overleaf"
2. Compilar → verificar que el documento completo funciona con las contribuciones de todos

**José Miguel y Rodrigo** (sus workspaces):
1. GitHub → su fork → "Sync fork" → "Update branch"
2. Overleaf → Menu → GitHub → "Pull from GitHub"
3. Compilar → verificar que ven el artículo completo

### ¡Ciclo completado! 🎉

```
┌─────────────────────────────────────────────────────────────┐
│  ✅ Artículo actualizado con contribuciones de todos        │
│  ✅ Cada cambio fue revisado antes de integrarse            │
│  ✅ Historial completo con contexto en GitHub               │
│  ✅ Todo hecho desde el navegador — sin instalar nada       │
└─────────────────────────────────────────────────────────────┘
```

---

## 5.5 Cierre: Resumen y Recursos

### El flujo diario en una imagen

```
┌─────────────────────────────────────────────────────────────┐
│                    FLUJO DE TRABAJO DIARIO                   │
│              (100% en el navegador)                          │
└─────────────────────────────────────────────────────────────┘

    INICIO DEL DÍA                    DURANTE EL DÍA
    ┌─────────────┐                   ┌─────────────┐
    │ GitHub:     │                   │ Editar en   │
    │ Sync fork   │ ──────────────▶   │ Overleaf    │
    │             │                   │             │
    │ Overleaf:   │                   │ Compilar    │
    │ Pull from   │                   │ Ver PDF     │
    │ GitHub      │                   └─────────────┘
    └─────────────┘                         │
                                            ▼
                                      CUANDO TERMINAN
                                      ┌─────────────┐
                                      │ Overleaf:   │
                                      │ Push to     │
                                      │ GitHub      │
                                      │             │
                                      │ (mensaje    │
                                      │ descriptivo)│
                                      └─────────────┘
                                            │
                                            ▼
    FIN DEL CICLO                     SOLICITAR REVISIÓN
    ┌─────────────┐                   ┌─────────────┐
    │ Merge +     │                   │ GitHub:     │
    │ Sync fork + │ ◀──────────────   │ Create      │
    │ Pull from   │                   │ Pull Request│
    │ GitHub      │                   └─────────────┘
    └─────────────┘
```

### Recursos para seguir aprendiendo

| Recurso | URL | Descripción |
|---------|-----|-------------|
| **Pro Git Book** | [git-scm.com/book](https://git-scm.com/book/en/v2) | Libro oficial y gratuito sobre Git |
| **GitHub Skills** | [skills.github.com](https://skills.github.com/) | Cursos interactivos de GitHub |
| **Overleaf Docs** | [overleaf.com/learn](https://www.overleaf.com/learn) | Tutoriales de LaTeX y Overleaf |
| **Oh My Git!** | [ohmygit.org](https://ohmygit.org/) | Juego para entender Git visualmente |
| **Learn Git Branching** | [learngitbranching.js.org](https://learngitbranching.js.org/) | Visualización interactiva de ramas |

### Preguntas frecuentes post-taller

<details>
<summary><strong>¿Qué hago si olvidé hacer "Sync fork" antes de empezar a trabajar?</strong></summary>

1. Si no editaste nada todavía: simplemente haz Sync fork ahora y Pull from GitHub en Overleaf
2. Si ya editaste: haz Push to GitHub primero (para no perder cambios), luego Sync fork en GitHub (puede crear un merge automático o mostrar conflictos), y finalmente Pull from GitHub en Overleaf

</details>

<details>
<summary><strong>¿Puedo tener múltiples Pull Requests abiertos al mismo tiempo?</strong></summary>

En este flujo, cada fork trabaja sobre su rama `main`. Todos los Push desde Overleaf se acumulan ahí. Si ya tienes un PR abierto, los nuevos Push se agregan automáticamente a ese PR. Es mejor terminar un ciclo (PR → revisión → merge) antes de comenzar uno nuevo.

</details>

<details>
<summary><strong>¿Qué pasa si quiero deshacer un Push?</strong></summary>

Una vez que hiciste Push to GitHub desde Overleaf, los cambios están en tu fork. No puedes "deshacerlos" fácilmente desde Overleaf. Pero tampoco afectan a nadie más — están solo en tu fork. Si creaste un PR, simplemente puedes cerrarlo sin hacer merge.

</details>

<details>
<summary><strong>¿Esto sirve para otros proyectos que no son LaTeX?</strong></summary>

¡Sí! El modelo de forks + Pull Requests funciona con cualquier tipo de archivo de texto. Solo cambiaría la herramienta de edición — en vez de Overleaf, usarían un editor apropiado para su tipo de proyecto. GitHub sigue siendo el centro de revisión y colaboración.

</details>

<details>
<summary><strong>¿Qué pasa si quiero trabajar offline?</strong></summary>

Overleaf requiere internet. Si necesitan capacidad de trabajo offline, pueden explorar la versión alternativa de este curso (rama `main` del repositorio) que usa VS Code como editor local con Git en la terminal.

</details>

---

## ¡Felicidades! 🎓

Han completado el taller. Ahora tienen:

- ✅ Un flujo de trabajo colaborativo profesional
- ✅ Control de versiones intencional para su artículo
- ✅ Capacidad de trabajar en paralelo sin afectarse mutuamente
- ✅ Revisión formal antes de integrar cambios
- ✅ Historial completo con contexto en GitHub
- ✅ Backup automático en GitHub
- ✅ **Todo sin instalar nada en su computadora**

### Próximos pasos sugeridos

1. **Practiquen** el flujo con un proyecto real de su laboratorio
2. **Exploren** GitHub Issues para organizar las tareas del artículo
3. **Experimenten** con la función "Track Changes" de Overleaf como complemento
4. **Compartan** este flujo con otros colaboradores

---

**Anterior**: [← Parte 4 - Pull Requests, Revisión y Conflictos](../04_ramas_y_conflictos/README.md)

**Volver al inicio**: [README principal](../README.md)
