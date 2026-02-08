# Análisis de Dificultad de Trivias: Comparación con Preguntas de Econometría

Este documento analiza cómo se aumentó la dificultad de las trivias del curso para alcanzar un nivel comparable a las preguntas de Variables Instrumentales (IV) del curso de econometría de MRU.

---

## Características de las Preguntas Objetivo (IV Econometrics)

Las preguntas del curso de econometría sobre Variables Instrumentales tienen las siguientes características:

### 1. **Comprensión de Relaciones Conceptuales**
Ejemplo de pregunta IV:
> "The first stage in the IV analysis of charter attendance effects is:
> - d. The effect of charter school offers on charter attendance."

**Análisis**: Requiere entender la relación causal entre oferta y asistencia, no solo definir términos.

### 2. **Aplicación a Nuevos Escenarios**
Ejemplo de pregunta IV:
> "Suppose that instead of randomly offering seats, we were to randomly assign the opportunity to watch a video advertisement... which of the following best describes how we might use this scenario to estimate the effects?"

**Análisis**: Toma un concepto (IV) y pide aplicarlo a un contexto diferente (video en lugar de lotería).

### 3. **Identificación de Violaciones de Supuestos**
Ejemplo de pregunta IV:
> "Suppose that instead of using lotteries, the city of Lynn were to allocate charter seats to the families with the lowest incomes. In this case, offers are unlikely to be a good instrument because:
> - a. The resulting instrument is correlated with family characteristics, violating the independence assumption."

**Análisis**: Requiere reconocer cuándo un supuesto crítico (independencia) es violado.

### 4. **Razonamiento sobre Procesos Completos**
Ejemplo de pregunta COVID vaccine:
> "In an IV analysis of the data from this trial, the first stage is...
> - b. The effect of being offered the vaccine on receiving the vaccine."

**Análisis**: Distinguir entre diferentes etapas del proceso causal (oferta → recepción → efectividad).

---

## Evolución de las Trivias del Curso Git+GitHub+Overleaf

### TRIVIA 1: Comprensión de Git

#### ❌ Versión Original (Nivel Básico)

**Pregunta 1 (Antes):**
> ¿Qué es un "commit" en Git?
> - C) Una "foto" o snapshot de tu proyecto en un momento específico

**Problema**: Pregunta de definición pura. Respuesta memorizable sin comprensión profunda.

**Pregunta 2 (Antes):**
> Si quieres volver a una versión anterior de tu proyecto, ¿qué analogía describe mejor lo que hace Git?
> - B) Una máquina del tiempo que te lleva al momento de esa "foto"

**Problema**: Nuevamente, memorización de la analogía presentada en clase.

#### ✅ Versión Mejorada (Nivel Avanzado)

**Pregunta 1 (Ahora):**
> José Miguel hace varios cambios en `introduction.tex` pero olvida hacer `git add` antes de hacer `git commit`. ¿Qué sucede con esos cambios?
> - B) Los cambios NO se incluyen en el commit; solo se guardan los archivos que fueron preparados con `git add`

**Mejora**: 
- **Escenario realista**: Situación común que enfrentarán
- **Comprensión de proceso**: Requiere entender staging area y la intencionalidad de Git
- **Consecuencias**: Deben razonar sobre qué pasa, no solo recordar definición

**Pregunta 2 (Ahora):**
> Rodrigo hizo tres commits locales: "Commit A", "Commit B" y "Commit C". Luego se da cuenta de que el Commit B introdujo un error. ¿Cuál es la mejor descripción de lo que puede hacer Git?
> - B) Git puede volver al estado del Commit A, permitiendo ver exactamente cómo estaba el proyecto en ese momento

**Mejora**:
- **Aplicación práctica**: Depuración real (encontrar cuándo apareció un bug)
- **Razonamiento temporal**: Entender que los commits persisten y son navegables
- **Resolución de problemas**: No solo "qué es" sino "cómo usar" para resolver un problema

**Pregunta 3 (Ahora):**
> Si Mauricio trabaja en su laptop toda la tarde, hace cinco commits guardando su progreso, pero su laptop se apaga antes de que pueda hacer `git push`, ¿qué pasa con su trabajo?
> - B) Su trabajo está seguro localmente en los commits; puede hacer `git push` cuando encienda su laptop

**Mejora**:
- **Distinción Git vs GitHub**: Comprensión fundamental de local vs remoto
- **Intencionalidad**: Entienden que nada es automático
- **Confianza en la herramienta**: Saben que Git guarda su trabajo localmente

**Comparación con IV Questions**: Similar a distinguir entre "first stage" (local) y "reduced form" (completo), requiere entender diferentes etapas del proceso.

---

### TRIVIA 2: Git vs GitHub y Flujo de Trabajo

#### ❌ Versión Original (Nivel Básico)

**Pregunta 1 (Antes):**
> ¿Cuál es la diferencia principal entre Git y GitHub?
> - B) Git es local en tu computadora, GitHub es una plataforma en la nube

**Problema**: Definición directa que puede memorizarse sin entender implicaciones.

#### ✅ Versión Mejorada (Nivel Avanzado)

**Pregunta 1 (Ahora):**
> José Miguel hace cambios localmente y ejecuta `git commit`. Rodrigo, trabajando en su propia computadora, ejecuta `git pull` inmediatamente después. ¿Qué sucede?
> - B) Rodrigo NO recibe los cambios de José Miguel porque José Miguel no ha hecho `git push`

**Mejora**:
- **Escenario de colaboración**: Situación real de dos personas trabajando
- **Comprensión de sincronización**: Requiere entender el flujo completo: commit → push → GitHub → pull
- **Modelo mental correcto**: Combate el malentendido común de "sincronización automática"

**Comparación con IV**: Similar a la pregunta de vacuna COVID que distingue entre "oferta" y "recepción", esta distingue entre "commit local" y "disponibilidad remota".

**Pregunta 2 (Ahora):**
> El equipo está colaborando en un artículo. Mauricio hace cambios en `methods.tex` y hace push a GitHub. Al mismo tiempo, José Miguel también modificó `methods.tex` localmente pero aún no ha hecho pull. ¿Qué debería hacer José Miguel antes de hacer push de sus cambios?
> - B) Hacer `git pull` primero para integrar los cambios de Mauricio, luego resolver cualquier conflicto, y finalmente hacer `git push`

**Mejora**:
- **Cambios concurrentes**: Situación extremadamente común en colaboración
- **Flujo de resolución**: Secuencia completa de pasos (pull → merge → resolve → push)
- **Prevención de pérdida de datos**: Entienden por qué es importante el orden

**Comparación con IV**: Similar a entender la secuencia completa del análisis IV (instrumento → first stage → second stage → reduced form), requiere comprender el orden y las dependencias.

**Pregunta 3 (Ahora):**
> Rodrigo quiere resolver dos issues (#5 y #8) con un solo Pull Request porque ambos están relacionados con correcciones de la bibliografía. ¿Cuál es la forma correcta de hacerlo?
> - B) En la descripción del PR escribir: `closes #5, fixes #8`

**Mejora**:
- **Aplicación práctica**: Uso real de GitHub para gestión de proyectos
- **Conocimiento técnico específico**: Sintaxis de palabras clave de GitHub
- **Buenas prácticas**: Cuándo y cómo agrupar issues relacionados

---

### TRIVIA 3: Integración de Herramientas y Flujo de Trabajo

#### ❌ Versión Original (Nivel Básico)

**Pregunta 1 (Antes):**
> ¿Cuál es la principal limitación de trabajar solo en Overleaf?
> - C) Sin internet no puedes trabajar (a menos que tengas Premium)

**Problema**: Lista de hechos que pueden memorizarse sin entender el "por qué".

#### ✅ Versión Mejorada (Nivel Avanzado)

**Pregunta 1 (Ahora):**
> El equipo está escribiendo un artículo y quieren asegurar que todos puedan compilar el documento correctamente. Han decidido usar el flujo: trabajo local (VS Code) → GitHub → Overleaf. ¿Cuál de las siguientes afirmaciones describe mejor POR QUÉ este flujo es superior a trabajar solo en Overleaf?
> - B) El flujo permite trabajo offline y compilación simultánea de todos los miembros, mientras Overleaf limita la compilación a una persona a la vez y requiere internet

**Mejora**:
- **Justificación de diseño**: Pregunta "por qué", no solo "qué"
- **Comparación de alternativas**: Evaluar trade-offs entre enfoques
- **Comprensión de limitaciones sistémicas**: Identificar problemas de escala/colaboración

**Comparación con IV**: Similar a preguntar "por qué usamos IV en lugar de comparación simple", requiere entender las ventajas del método.

**Pregunta 2 (Ahora):**
> Rodrigo está trabajando offline en su laptop en un vuelo. Hace varios commits de cambios importantes en `results.tex`. Al aterrizar, conecta su laptop a internet. ¿Cuál secuencia de acciones describe correctamente lo que debería hacer para que sus cambios estén disponibles tanto en GitHub como en Overleaf?
> - B) Hacer `git push` para subir a GitHub; luego cualquier miembro del equipo puede hacer "Pull from GitHub" en Overleaf para actualizar

**Mejora**:
- **Escenario completo de principio a fin**: Trabajo offline → online → sincronización completa
- **Múltiples herramientas integradas**: Git, GitHub, Overleaf trabajando juntos
- **Secuencia correcta de acciones**: Orden importa (push antes de pull en Overleaf)
- **Aclaración de permisos**: Cualquier invitado puede hacer pull (no solo Premium)

**Comparación con IV**: Similar a la pregunta del video de publicidad que requiere aplicar el método IV completo a un nuevo escenario.

**Pregunta 3 (Ahora):**
> José Miguel y Mauricio modificaron diferentes secciones de `introduction.tex` al mismo tiempo. José Miguel editó los párrafos 1-3, y Mauricio editó los párrafos 5-7. Ambos hicieron commits localmente. José Miguel hace push primero. Cuando Mauricio intenta hacer push, ¿qué sucederá?
> - C) GitHub rechazará el push de Mauricio porque su versión está desactualizada; debe hacer `git pull` primero, Git fusionará los cambios automáticamente (sin conflicto porque son secciones diferentes), y luego puede hacer push

**Mejora**:
- **Distinción crucial**: Ediciones en diferentes líneas = fusión automática
- **Comprensión de conflictos**: Cuándo Git puede fusionar solo vs cuándo necesita intervención humana
- **Flujo completo de resolución**: Rechazo → pull → fusión automática → push
- **Razonamiento sobre el algoritmo**: Entender cómo Git decide si hay conflicto

**Comparación con IV**: Similar a identificar cuándo la "exclusion restriction" se viola — requiere razonamiento sobre las condiciones específicas del escenario.

---

## Tabla Comparativa de Niveles Cognitivos

| Aspecto | Versión Original | Versión Mejorada | Preguntas IV Econometría |
|---------|------------------|------------------|--------------------------|
| **Tipo de conocimiento** | Declarativo (qué es X) | Procedimental (cómo hacer X) | Procedimental + Condicional (cuándo/por qué) |
| **Bloom's Taxonomy** | Recordar, Comprender | Aplicar, Analizar | Aplicar, Analizar, Evaluar |
| **Contexto** | Abstracto, genérico | Escenarios específicos del curso | Escenarios nuevos (transferencia) |
| **Complejidad** | 1 concepto por pregunta | 2-3 conceptos integrados | Múltiples conceptos + supuestos |
| **Distractores** | Obviamente incorrectos | Plausibles si no entiendes | Requieren eliminar malentendidos comunes |

---

## Ejemplos de Equivalencia de Dificultad

### Ejemplo 1: Comprensión de Etapas

**IV Question:**
> "The first stage in the IV analysis of charter attendance effects is:
> d. The effect of charter school offers on charter attendance."

**Equivalente Git:**
> "José Miguel hace `git commit`. Rodrigo hace `git pull` inmediatamente. ¿Qué sucede?
> B) Rodrigo NO recibe los cambios porque José Miguel no ha hecho `git push`"

**Similitud**: Ambas requieren identificar la etapa correcta en un proceso multi-paso y entender las dependencias.

---

### Ejemplo 2: Aplicación a Nuevo Escenario

**IV Question:**
> "Suppose that instead of randomly offering seats, we were to randomly assign the opportunity to watch a video advertisement... how might we use this scenario?"

**Equivalente Git:**
> "Rodrigo está trabajando offline en un vuelo. Hace commits. Al aterrizar, ¿qué secuencia de acciones debería hacer para que sus cambios estén en GitHub y Overleaf?"

**Similitud**: Toman un concepto aprendido (flujo Git/GitHub) y piden aplicarlo a un contexto ligeramente diferente (offline → online → Overleaf).

---

### Ejemplo 3: Identificación de Violación de Supuestos

**IV Question:**
> "If seats were allocated to families with lowest incomes, offers are unlikely to be a good instrument because:
> a. The resulting instrument is correlated with family characteristics, violating the independence assumption."

**Equivalente Git:**
> "José Miguel y Mauricio modificaron diferentes secciones del mismo archivo. ¿Qué pasa?
> C) Git fusionará automáticamente sin conflicto porque son secciones diferentes"

**Similitud**: Requieren identificar cuándo una condición (no hay conflicto / independencia) se cumple o viola, basándose en las características específicas del escenario.

---

## Justificación Pedagógica del Nivel de Dificultad

### Por qué AUMENTAR la dificultad es apropiado:

1. **Audiencia**: Estudiantes de posgrado/investigadores (similar a audiencia de econometría)
2. **Aplicación inmediata**: Usarán estas herramientas en su trabajo diario
3. **Costo de error**: Errores en Git pueden causar pérdida de trabajo real
4. **Prerequisitos**: Ya instalaron las herramientas, tienen motivación práctica

### Por qué este nivel es ADECUADO (no excesivo):

1. **Contexto específico**: Todas las preguntas usan los mismos tres participantes (JM, Mauricio, Rodrigo) y el mismo proyecto (artículo académico)
2. **Conceptos limitados**: Solo Git, GitHub, Overleaf — no se introducen nuevas herramientas
3. **Explicaciones detalladas**: Cada respuesta incluye explicación extensa para aprendizaje
4. **Progresión lógica**: Las trivias aparecen después de explicar cada concepto

---

## Decisión sobre Ubicación de Trivias

### ¿Por qué SOLO en 01-conceptos?

**Argumento a favor de agregar en 02-05:**
- Reforzar aprendizaje en cada sección
- Evaluación continua del progreso

**Argumento en contra (adoptado):**
1. **Naturaleza de las secciones**:
   - 01: Teórica → trivias conceptuales apropiadas
   - 02-05: Prácticas guiadas → evaluación mediante ejecución

2. **Evitar fatiga**:
   - 3 trivias en conceptos = suficiente
   - Más trivias podrían sentirse repetitivas

3. **Evaluación auténtica**:
   - En secciones prácticas, el éxito se mide por: "¿Lograste hacer commit?", "¿Resolviste el conflicto?"
   - Las trivias evaluarían conocimiento teórico cuando ya están haciendo práctica

4. **Flujo del taller**:
   - Parte 1: Entender (trivias ayudan)
   - Partes 2-5: Hacer (el hacer es la evaluación)

**Conclusión**: Mantener trivias solo en 01-conceptos. Las secciones prácticas se auto-evalúan mediante la ejecución exitosa de tareas.

---

## Métricas de Éxito

Para verificar que el nivel de dificultad es apropiado, monitorear:

1. **Tasa de respuestas correctas**: 40-60% ideal (demasiado fácil si >80%, demasiado difícil si <30%)
2. **Tiempo de respuesta**: 1-2 minutos por pregunta (indica razonamiento, no adivinanza)
3. **Preguntas de seguimiento**: Si muchos estudiantes piden aclaración sobre el concepto después de la trivia, podría ser muy difícil
4. **Engagement**: Estudiantes discuten las respuestas entre ellos (señal positiva)

---

## Conclusión

Las trivias revisadas ahora están al nivel de las preguntas de IV de econometría:

✅ **Requieren comprensión conceptual profunda**, no memorización  
✅ **Prueban aplicación a escenarios realistas**  
✅ **Identifican malentendidos comunes** a través de distractores plausibles  
✅ **Integran múltiples conceptos** en una sola pregunta  
✅ **Preparan para situaciones reales** que encontrarán en su trabajo  

El nivel es desafiante pero apropiado para la audiencia y los objetivos del curso.
