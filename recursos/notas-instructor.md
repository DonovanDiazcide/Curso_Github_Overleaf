# Notas para el Instructor

> Guía de facilitación para el taller (~2 horas)  
> **Versión 2**: Flujo 100% en el navegador (sin VS Code ni instalaciones locales)

---

## Antes del taller

### Una semana antes

- [ ] Enviar instrucciones de configuración previa a los participantes: [00-instalacion/README.md](../00-instalacion/README.md)
  - Todos: Crear cuenta de GitHub y de Overleaf
  - Solo Mauricio: Vincular GitHub con Overleaf (Premium)
- [ ] Pedir que envíen su **username de GitHub** para poder agregarlos como colaboradores
- [ ] Verificar que Mauricio tiene Overleaf Premium activo

### Un día antes

- [ ] Enviar recordatorio con:
  - Link de la videollamada (si es remoto)
  - Agenda del taller
  - Recordar: solo necesitan un navegador web
- [ ] Verificar que las cuentas de todos funcionan

### 30 minutos antes (Preparación del instructor + Mauricio)

- [ ] Abrir Overleaf, GitHub y los materiales del taller en pestañas separadas
- [ ] Tener la [guía rápida](../guia-rapida.md) lista para compartir
- [ ] Preparar el repositorio base si aún no existe (o hacerlo en vivo como parte de la Parte 2)

---

## Durante el taller

### Agenda con tiempos

| Tiempo | Duración | Parte | Notas para el instructor |
|--------|----------|-------|--------------------------|
| 0:00 | 5 min | Verificación | Confirmar que todos tienen cuentas funcionando |
| 0:05 | 15 min | Parte 1: Conceptos | Usar analogías. Enfatizar problemas de Overleaf compartido |
| 0:20 | 20 min | Parte 2: Configuración | **Crítico**: ir paso a paso, compartir pantalla. Muchas cosas que hacer |
| 0:40 | 25 min | Parte 3: Flujo básico | **Lo más importante**: que todos hagan Push y creen un PR |
| 1:05 | 15 min | Parte 4: Revisión y conflictos | Demostrar revisión de PR. Provocar conflicto como demo |
| 1:20 | 15 min | Parte 5: Práctica libre | Dejar que trabajen solos, estar disponible para dudas |
| 1:35 | 5 min | Cierre | Compartir guía rápida, agradecer, preguntar dudas finales |

> **Tiempo total estimado**: ~1 hora 45 minutos (incluyendo verificación y buffer). Reserven ~2 horas para tener margen.

### Tips de facilitación

1. **Compartir pantalla frecuentemente**: Especialmente en Partes 2 y 3
2. **Ir más lento de lo que crees necesario**: El concepto de forks es nuevo para muchos
3. **Verificar antes de avanzar**: "¿Todos ven la opción de GitHub en el menú de Overleaf?"
4. **Repetir el flujo verbalmente**: Antes de cada paso, decir "ahora vamos a..." para que todos sepan dónde están
5. **Celebrar cada logro**: "¡Excelente, ya crearon su primer Pull Request!"

### Ventaja clave de esta versión del curso

A diferencia de la versión v1 del taller (rama `main` de este repositorio, que usa VS Code + Git local), en esta versión:
- **No hay problemas de instalación**: No Git, no MiKTeX, no LaTeX Workshop, no Perl
- **No hay terminal**: Todo se hace con clicks en el navegador
- **No hay configuración local**: No `git config`, no PATH, no extensiones
- **Errores más predecibles**: Los pocos errores posibles son de permisos o configuración de cuentas

Esto reduce drásticamente el tiempo que típicamente se pierde resolviendo problemas de instalación.

---

## Problemas comunes y soluciones

### Cuentas y acceso

| Problema | Síntoma | Solución |
|----------|---------|----------|
| No vinculó GitHub con Overleaf | No aparece opción GitHub en Overleaf Menu | Solo Mauricio necesita vincular. Settings → Project Integrations → GitHub → Link |
| No puede ver el fork | 404 al ir a su fork | Verificar que hizo fork correctamente. El fork está en `github.com/SU-USUARIO/nombre-repo` |
| No puede editar en Overleaf | Proyecto es "View only" | Mauricio debe compartir con permisos "Can Edit" |
| No puede crear PR | No ve opción "Contribute" | Verificar que hizo Push primero y que su fork tiene cambios respecto a main |

### Sincronización Overleaf ↔ GitHub

| Problema | Síntoma | Solución |
|----------|---------|----------|
| Push falla | Error al hacer Push to GitHub | Hacer Pull from GitHub primero para sincronizar |
| Pull no trae cambios | Overleaf no se actualiza | Verificar que hizo "Sync fork" en GitHub ANTES del Pull en Overleaf |
| Conflicto al hacer Push | Overleaf reporta conflicto | Overleaf creará una rama temporal. Resolver en GitHub y luego Pull |
| "Nothing to push" | No hay cambios que subir | Verificar que editó algo en Overleaf después del último Pull |

### GitHub

| Problema | Síntoma | Solución |
|----------|---------|----------|
| Sync fork no aparece | No ve el botón | Su fork ya está actualizado, o está viendo el repo principal en vez de su fork |
| PR tiene conflictos | "This branch has conflicts" | Resolver en GitHub web: click "Resolve conflicts", editar, commit |
| PR no se puede mergear | Botón de merge no está verde | Necesita al menos una aprobación, o hay conflictos pendientes |
| Fork desactualizado | "X commits behind main" | Ir a GitHub → fork → "Sync fork" → "Update branch" |

### LaTeX (en Overleaf)

| Problema | Síntoma | Solución |
|----------|---------|----------|
| No compila | Error en la compilación | Revisar el log de errores en Overleaf (click en "Logs and output files") |
| Bibliografía no aparece | Referencias como `[?]` | Verificar que `references.bib` existe y que los `\cite{}` coinciden con las keys del .bib |
| Sección no aparece en PDF | Falta contenido | Verificar que `\input{sections/archivo}` está en `main.tex` |
| Caracteres raros | ñ, á se ven mal | Agregar `\usepackage[utf8]{inputenc}` en el preámbulo |

---

## Respuestas a preguntas frecuentes

### "¿Por qué no editar todos en el mismo proyecto de Overleaf?"

> Overleaf compartido funciona para equipos pequeños con baja frecuencia de edición.
> Pero cuando tres personas editan activamente:
> - Solo una persona puede compilar a la vez
> - El historial no captura el "por qué" de cada cambio
> - No hay revisión formal antes de integrar cambios
> - Un error afecta a todos inmediatamente
>
> Con forks, cada quien tiene su espacio. Los cambios se revisan antes de llegar a la versión oficial.

### "¿Necesito aprender Git de línea de comandos?"

> No para este flujo. Todo se hace con clicks:
> - Overleaf: Push/Pull con botones en el menú
> - GitHub: Sync fork, PRs, revisiones — todo en la web
>
> Si quieren aprender Git de terminal más adelante, será un complemento útil pero no es requisito.

### "¿Qué pasa si alguien edita directamente en el proyecto Main de Overleaf?"

> Eso saltaría el proceso de revisión. La disciplina es:
> - Main solo recibe cambios vía Pull Requests aprobados
> - Si Mauricio necesita hacer cambios, idealmente debería tener su propio fork también
> - En la práctica, para cambios menores (como corregir un typo), Mauricio puede editar Main directamente si el equipo está de acuerdo

### "¿Esto sirve para proyectos que no son LaTeX?"

> ¡Sí! El modelo de forks + Pull Requests funciona con cualquier archivo de texto.
> Solo cambiaría Overleaf por otro editor. GitHub sigue siendo el centro de colaboración.

### "¿Qué hago si alguien nuevo quiere unirse al proyecto?"

> 1. Que cree cuenta de GitHub (y de Overleaf si va a editar LaTeX)
> 2. Que haga fork del repositorio principal
> 3. Mauricio importa el fork como nuevo proyecto en Overleaf y lo comparte
> 4. Agregarle como colaborador en el repo principal de GitHub
> 5. Compartir la guía rápida y el material de Partes 1-3

---

## Ejercicio de conflicto (Parte 4)

### Setup del conflicto intencional

**Objetivo**: Que todos vean un conflicto real y aprendan a resolverlo en GitHub web.

**Preparación** (antes de la Parte 4):

1. **Mauricio** edita `sections/introduction.tex` en el proyecto "Main" de Overleaf:
   - Cambiar el título de la sección a: `\section{Introducción al Trabajo Colaborativo}`
   - Push to GitHub con mensaje: `"Cambié título de introducción (para demo de conflicto)"`

2. **José Miguel** (sin saber del cambio de Mauricio) edita el mismo título en su Overleaf:
   - Cambiar a: `\section{Introducción y Motivación}`
   - Push to GitHub con mensaje: `"Actualicé título de introducción"`

3. José Miguel intenta crear PR → GitHub mostrará **"This branch has conflicts"**

**Resolución en vivo** (demostrar en pantalla compartida):
1. Click en **"Resolve conflicts"** en GitHub
2. Mostrar los marcadores `<<<<<<<`, `=======`, `>>>>>>>`
3. Decidir qué versión mantener (o combinar)
4. Click en "Mark as resolved" → "Commit merge"
5. Ahora sí se puede hacer Merge normalmente

> 💡 **Tip**: Si el tiempo es corto, el instructor puede hacer la demo solo con pantalla compartida en vez de que José Miguel lo haga él mismo.

---

## Checklist de cierre

- [ ] Todos hicieron al menos un Push desde Overleaf
- [ ] Al menos un PR fue creado y merged
- [ ] Todos sincronizaron y ven la versión final en su Overleaf
- [ ] Compartiste la guía rápida
- [ ] Preguntaste si hay dudas finales
- [ ] Agradeciste la participación

---

## Después del taller

- [ ] Enviar email de seguimiento con:
  - Link a este repositorio (material del taller)
  - Link a la guía rápida
  - Recursos adicionales (Pro Git Book, GitHub Skills, Overleaf Docs)
- [ ] Pedir feedback sobre el taller
- [ ] Estar disponible para dudas en los siguientes días
- [ ] Considerar si vale la pena que Mauricio también trabaje con fork propio (en vez de editar Main directamente) para proyectos reales post-taller

---

## Comparación con la v1 del curso (rama `main`)

| Aspecto | v1 (VS Code + Git local) | v2 (Overleaf + GitHub web) |
|---------|--------------------------|----------------------------|
| **Instalaciones** | Git, MiKTeX/MacTeX, VS Code, Perl, extensiones | Solo cuentas web |
| **Tiempo de setup** | 30-60 min (con problemas frecuentes) | 15-20 min |
| **Curva de aprendizaje** | Alta (terminal, Git commands, editor nuevo) | Baja (clicks en navegador) |
| **Capacidad offline** | ✅ Sí | ❌ No |
| **Control granular** | ✅ Ramas locales, stash, rebase | ⚠️ Limitado a un Push por sesión |
| **Público ideal** | Personas técnicas o dispuestas a aprender herramientas | Investigadores que quieren colaborar sin fricción extra |

> Usa v1 si el equipo quiere invertir en aprender herramientas de desarrollo. Usa v2 si la prioridad es empezar a colaborar rápido con la menor barrera de entrada.

---

*Estas notas son para el instructor. No compartir directamente con participantes.*
