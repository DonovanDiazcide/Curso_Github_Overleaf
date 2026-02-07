# Parte 5: Práctica Libre y Cierre

> **Duración**: 25 minutos (20 práctica + 5 cierre)  
> **Objetivo**: Aplicar todo lo aprendido de forma independiente

---

## Resumen de esta parte

| Paso | Descripción | Tiempo |
|------|-------------|--------|
| 5.1 | Tareas asignadas para cada participante | 2 min |
| 5.2 | Trabajo independiente | 12 min |
| 5.3 | Pull Requests y revisión | 5 min |
| 5.4 | Merge y sincronización final | 3 min |
| 5.5 | Cierre: resumen y recursos | 3 min |

---

## 5.1 Tareas asignadas

Cada participante completará una sección del artículo de forma **independiente**, aplicando todo el flujo aprendido.

| Participante | Sección | Archivo | Tarea específica |
|--------------|---------|---------|------------------|
| **José Miguel** | Related Work | `sections/related-work.tex` | Agregar 2-3 párrafos sobre trabajos relacionados |
| **Mauricio** | Results | `sections/results.tex` | Completar con una tabla comparativa |
| **Rodrigo** | Conclusion | `sections/conclusion.tex` | Escribir conclusiones y trabajo futuro |

### Contenido sugerido para cada sección

<details>
<summary><strong>José Miguel: Related Work</strong></summary>

Crea el archivo `sections/related-work.tex` con contenido como:

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
en este artículo sigue esta línea, integrando Overleaf, GitHub y editores locales.
```

**No olvides** agregar `\input{sections/related-work}` en `main.tex` (después de introduction).

</details>

<details>
<summary><strong>Mauricio: Results (con tabla)</strong></summary>

Edita `sections/results.tex` para incluir una tabla comparativa:

```latex
\section{Resultados}

Implementamos el flujo de trabajo propuesto durante el desarrollo de este 
artículo. A continuación presentamos los resultados observados.

\subsection{Beneficios de la colaboración con Git}

Durante las dos horas del taller, el equipo logró:
\begin{itemize}
    \item Configurar un entorno de trabajo compartido
    \item Realizar múltiples contribuciones en paralelo
    \item Resolver conflictos de manera sistemática
    \item Mantener un historial completo de cambios
\end{itemize}

\subsection{Comparación con métodos tradicionales}

La Tabla \ref{tab:comparacion} muestra las diferencias entre el flujo 
tradicional (envío de archivos por correo) y el flujo propuesto.

\begin{table}[h]
\centering
\caption{Comparación de flujos de trabajo colaborativo}
\label{tab:comparacion}
\begin{tabular}{|l|c|c|}
\hline
\textbf{Característica} & \textbf{Tradicional} & \textbf{Git + Overleaf} \\
\hline
Control de versiones & Manual & Automático \\
\hline
Historial de cambios & Limitado & Completo \\
\hline
Trabajo simultáneo & Difícil & Fácil \\
\hline
Resolución de conflictos & Ad-hoc & Sistemática \\
\hline
Backup & Manual & Automático \\
\hline
Revisión de cambios & Por correo & Pull Requests \\
\hline
\end{tabular}
\end{table}

\subsection{Observaciones}

El principal desafío fue la curva de aprendizaje inicial de Git. 
Sin embargo, una vez dominados los comandos básicos, el flujo de trabajo 
resultó más eficiente que los métodos tradicionales.
```

</details>

<details>
<summary><strong>Rodrigo: Conclusion</strong></summary>

Edita `sections/conclusion.tex`:

```latex
\section{Conclusión}

En este artículo presentamos un flujo de trabajo colaborativo para la 
escritura de artículos académicos en LaTeX, combinando Overleaf, GitHub 
y VS Code.

\subsection{Contribuciones principales}

Las principales contribuciones de este trabajo son:
\begin{enumerate}
    \item Un flujo de trabajo que aprovecha las fortalezas de cada herramienta
    \item Guías paso a paso para la configuración del entorno
    \item Estrategias para resolver conflictos de manera sistemática
    \item Uso de ramas para mantener versiones alternativas del documento
\end{enumerate}

\subsection{Limitaciones}

El flujo propuesto requiere que al menos un miembro del equipo tenga 
cuenta Premium de Overleaf para la sincronización con GitHub. Además, 
existe una curva de aprendizaje inicial para usuarios no familiarizados 
con Git.

\subsection{Trabajo futuro}

Como trabajo futuro, se podría explorar:
\begin{itemize}
    \item Integración con sistemas de gestión de referencias como Zotero
    \item Automatización de compilación con GitHub Actions
    \item Plantillas pre-configuradas para diferentes journals
\end{itemize}

\subsection*{Agradecimientos}

Agradecemos a todos los participantes del taller por su entusiasmo 
y colaboración durante el desarrollo de este ejercicio práctico.
```

</details>

---

## 5.2 Trabajo independiente (12 minutos)

### El flujo completo que debes seguir:

```
┌─────────────────────────────────────────────────────────────┐
│  CHECKLIST DE TRABAJO INDEPENDIENTE                          │
└─────────────────────────────────────────────────────────────┘

□ 1. Actualizar main
      git checkout main
      git pull origin main

□ 2. Crear tu rama
      git checkout -b tu-nombre-seccion

□ 3. Crear/editar tu archivo
      (en VS Code)

□ 4. Si es archivo nuevo, actualizar main.tex
      Agregar: \input{sections/tu-seccion}

□ 5. Verificar que compila
      Guardar y revisar el PDF

□ 6. Agregar archivos al staging
      git add sections/tu-seccion.tex
      git add main.tex  (si lo modificaste)

□ 7. Hacer commit
      git commit -m "Agregué sección de [tu sección]"

□ 8. Subir tu rama
      git push -u origin tu-nombre-seccion

□ 9. Crear Pull Request en GitHub
      (ver instrucciones en Parte 4)
```

### Comandos específicos por participante

<details>
<summary><strong>🪟 José Miguel (Windows)</strong></summary>

```powershell
# 1. Actualizar
git checkout main
git pull origin main

# 2. Crear rama
git checkout -b jose-related-work

# 3. Crear archivo (en VS Code)
# Crear: sections/related-work.tex
# Editar: main.tex (agregar \input{sections/related-work})

# 4. Verificar que compila (Ctrl+S en VS Code)

# 5. Agregar archivos
git add sections/related-work.tex
git add main.tex

# 6. Commit
git commit -m "Agregué sección Related Work con revisión de literatura"

# 7. Subir rama
git push -u origin jose-related-work

# 8. Ir a GitHub y crear Pull Request
```

</details>

<details>
<summary><strong>🪟 Mauricio (Windows)</strong></summary>

```powershell
# 1. Actualizar
git checkout main
git pull origin main

# 2. Crear rama
git checkout -b mauricio-results-tabla

# 3. Editar archivo (en VS Code)
# Editar: sections/results.tex

# 4. Verificar que compila (Ctrl+S en VS Code)

# 5. Agregar archivos
git add sections/results.tex

# 6. Commit
git commit -m "Completé Results con tabla comparativa de flujos de trabajo"

# 7. Subir rama
git push -u origin mauricio-results-tabla

# 8. Ir a GitHub y crear Pull Request
```

</details>

<details>
<summary><strong>🍎 Rodrigo (macOS)</strong></summary>

```bash
# 1. Actualizar
git checkout main
git pull origin main

# 2. Crear rama
git checkout -b rodrigo-conclusion

# 3. Editar archivo (en VS Code)
# Editar: sections/conclusion.tex

# 4. Verificar que compila (Cmd+S en VS Code)

# 5. Agregar archivos
git add sections/conclusion.tex

# 6. Commit
git commit -m "Escribí conclusiones con contribuciones, limitaciones y trabajo futuro"

# 7. Subir rama
git push -u origin rodrigo-conclusion

# 8. Ir a GitHub y crear Pull Request
```

</details>

---

## 5.3 Pull Requests y revisión (5 minutos)

### Crear los Pull Requests

Cada participante:
1. Va a GitHub → repositorio
2. Click en **"Compare & pull request"** (o Pull requests → New)
3. Configura:
   - **base**: `main`
   - **compare**: tu rama
4. Escribe título y descripción
5. Click **"Create pull request"**

### Revisar los PRs de los compañeros

Cada participante revisa al menos UN PR de otro compañero:

| Revisor | Revisa el PR de |
|---------|-----------------|
| José Miguel | Rodrigo |
| Rodrigo | Mauricio |
| Mauricio | José Miguel |

**Cómo revisar:**
1. Ir al PR asignado
2. Click en **"Files changed"**
3. Revisar los cambios
4. Click en **"Review changes"**
5. Seleccionar **"Approve"** (o dejar comentarios si hay sugerencias)
6. Click **"Submit review"**

---

## 5.4 Merge y sincronización final (3 minutos)

### Hacer merge de los PRs (Mauricio como owner, o cada quien el suyo)

Para cada PR aprobado:
1. Click en **"Merge pull request"**
2. Click en **"Confirm merge"**
3. (Opcional) **"Delete branch"**

### Orden sugerido de merge

Para evitar conflictos, hacer merge en este orden:
1. Primero: PR que modifica `main.tex` (José Miguel - agrega `\input`)
2. Después: Los demás PRs

### Actualizar copias locales (Todos)

```bash
git checkout main
git pull origin main
```

### Sincronizar Overleaf (Mauricio) — verificación final

Una vez que todos los PRs están fusionados en `main` y cada quien ha verificado que compila localmente:

1. Ir a Overleaf → Proyecto
2. **Menu** → **GitHub** → **"Pull GitHub changes into Overleaf"**
3. Compilar en la nube y confirmar que el documento completo funciona

> Recuerda: Overleaf es el **último paso** del flujo (Local → GitHub → Overleaf).

### ¡Celebrar! 🎉

El artículo ahora tiene contribuciones de todos los participantes, con historial completo de quién hizo qué.

---

## 5.5 Cierre: Resumen y recursos

### El flujo diario en una imagen

```
┌─────────────────────────────────────────────────────────────┐
│                    FLUJO DE TRABAJO DIARIO                   │
└─────────────────────────────────────────────────────────────┘

    INICIO DEL DÍA                    DURANTE EL DÍA
    ┌─────────────┐                   ┌─────────────┐
    │ git pull    │                   │ Editar en   │
    │             │ ──────────────▶   │ VS Code     │
    │ (obtener    │                   │             │
    │  cambios)   │                   │ Guardar     │
    └─────────────┘                   │ frecuente   │
                                      └─────────────┘
                                            │
                                            ▼
    FIN DEL DÍA                       CUANDO TERMINAS
    ┌─────────────┐                   ┌─────────────┐
    │ git push    │                   │ git add     │
    │             │ ◀──────────────   │ git commit  │
    │ (subir      │                   │             │
    │  cambios)   │                   │ (guardar    │
    └─────────────┘                   │  "foto")    │
          │                           └─────────────┘
          ▼
    ┌─────────────┐
    │ Overleaf:   │
    │ Pull from   │
    │ GitHub      │
    │ (verificar) │
    └─────────────┘
```

### Comandos esenciales (Cheatsheet)

| Categoría | Comando | Descripción |
|-----------|---------|-------------|
| **Básicos** | `git status` | Ver estado actual |
| | `git pull origin main` | Obtener cambios |
| | `git add archivo.tex` | Preparar archivo |
| | `git add .` | Preparar todos |
| | `git commit -m "msg"` | Guardar snapshot |
| | `git push` | Subir cambios |
| **Ramas** | `git branch` | Ver ramas |
| | `git checkout -b nombre` | Crear rama |
| | `git checkout main` | Cambiar a main |
| **Conflictos** | `git status` | Ver archivos en conflicto |
| | (editar archivo) | Resolver manualmente |
| | `git add archivo` | Marcar resuelto |
| | `git commit` | Completar merge |
| **Historial** | `git log --oneline` | Ver commits |
| | `git diff` | Ver cambios no guardados |

### Recursos para seguir aprendiendo

| Recurso | URL | Descripción |
|---------|-----|-------------|
| **Pro Git Book** | [git-scm.com/book](https://git-scm.com/book/en/v2) | Libro oficial, gratuito |
| **GitHub Skills** | [skills.github.com](https://skills.github.com/) | Cursos interactivos |
| **Overleaf Docs** | [overleaf.com/learn](https://www.overleaf.com/learn) | Tutoriales de LaTeX |
| **LaTeX Workshop Wiki** | [GitHub Wiki](https://github.com/James-Yu/LaTeX-Workshop/wiki) | Configuración avanzada |
| **Oh My Git!** | [ohmygit.org](https://ohmygit.org/) | Juego para aprender Git |
| **Learn Git Branching** | [learngitbranching.js.org](https://learngitbranching.js.org/) | Visualización interactiva |

### Preguntas frecuentes post-taller

<details>
<summary><strong>¿Qué hago si olvidé hacer pull y ahora tengo conflictos?</strong></summary>

1. Primero, guarda tu trabajo actual: `git stash`
2. Actualiza: `git pull origin main`
3. Recupera tu trabajo: `git stash pop`
4. Resuelve conflictos si los hay (ver Parte 4)

</details>

<details>
<summary><strong>¿Cómo deshago mi último commit (sin perder cambios)?</strong></summary>

```bash
git reset --soft HEAD~1
```

Esto "deshace" el commit pero mantiene los archivos modificados.

</details>

<details>
<summary><strong>¿Cómo veo quién escribió cada línea?</strong></summary>

```bash
git blame archivo.tex
```

O en VS Code: instalar la extensión "GitLens" para ver autoría en tiempo real.

</details>

<details>
<summary><strong>¿Puedo usar esto para proyectos que no son LaTeX?</strong></summary>

¡Absolutamente! Git funciona con cualquier tipo de archivo de texto:
- Código (Python, R, JavaScript, etc.)
- Markdown
- Datos en CSV
- Configuraciones

Solo cambia la parte de Overleaf por el entorno que corresponda.

</details>

---

## ¡Felicidades! 🎓

Han completado el taller y ahora tienen:

✅ Un flujo de trabajo colaborativo profesional  
✅ Control de versiones para su artículo  
✅ Capacidad de trabajar en paralelo sin conflictos  
✅ Historial completo de quién cambió qué  
✅ Backup automático en GitHub  
✅ Herramientas para resolver conflictos  

### Próximos pasos sugeridos

1. **Practiquen** el flujo con un proyecto real
2. **Experimenten** con ramas para propuestas alternativas
3. **Exploren** GitHub Issues para organizar tareas
4. **Configuren** GitHub Actions para compilación automática (avanzado)

---

## Feedback

¿Cómo estuvo el taller? ¿Qué podemos mejorar?

Comparte tus comentarios para mejorar futuras versiones.

---

**Anterior**: [← Parte 4 - Ramas y Conflictos](../04_ramas_y_conflictos/README.md)

**Siguiente**: [Parte 6 - Principios de Código y Datos →](../06-code-and-data/README.md)

**Volver al inicio**: [README principal](../README.md)
