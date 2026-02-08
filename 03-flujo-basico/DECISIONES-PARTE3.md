# Decisiones de Diseño - Parte 3: Flujo de Trabajo Básico

Este documento registra las decisiones tomadas y los cambios realizados en la Parte 3 del taller, en respuesta al issue de correcciones.

---

## Decisión 1: Archivos personales en VS Code

### Pregunta
¿Es usual/estándar tener archivos personales (notas, borradores) en la carpeta de trabajo de VS Code?

### Decisión: **Sí, es estándar y recomendable**

### Justificación

Es una práctica completamente normal mantener archivos personales en el directorio de trabajo. La clave está en usar las herramientas correctas para que no se compartan accidentalmente:

1. **`.gitignore`**: Para archivos que **nunca** deben subirse (notas privadas, borradores personales). Se agregan al `.gitignore` desde el momento en que se crean.
2. **`git add` selectivo**: Para archivos que todavía no están listos pero eventualmente se compartirán, simplemente no se les hace `git add` hasta que estén listos.
3. **`git restore --staged`**: Si se agregó un archivo por error con `git add .`, se puede quitar antes del commit.

### Cambios realizados

- **Actualizado el diagrama** del Working Directory: cambiado `notas-personales.txt [NUEVO - no quiero compartir]` por `notas-personales.txt [NUEVO - en .gitignore, ignorado]`, y se agregó la nota de que `git add .` es seguro si `.gitignore` está configurado.
- **Agregada nota explicativa** bajo el diagrama recomendando usar `.gitignore` para archivos personales.
- **Actualizada la regla de oro** sobre `git add` para incluir la recomendación de `.gitignore`.

---

## Decisión 2: ¿Trabajar en ramas desde la Parte 3?

### Pregunta
¿Conviene que desde un principio cada quien trabaje en su propia rama, o es mejor que en la Parte 3 todos trabajen en `main`?

### Decisión: **En la Parte 3, todos trabajan en `main`**

### Justificación

**Simulación realizada** (3 iteraciones) para verificar que no surgen conflictos:

Se simuló el flujo completo de la Parte 3 donde:
- José Miguel edita `sections/introduction.tex`
- Rodrigo edita `sections/methods.tex`
- Mauricio edita `sections/results.tex`

**Resultado**: En las 3 iteraciones, **no hubo conflictos**. Cada persona edita un archivo diferente, por lo que Git puede hacer merge automáticamente sin problemas.

**Razones para mantener `main` en la Parte 3:**

1. **Simplicidad pedagógica**: La Parte 3 introduce los conceptos fundamentales (add, commit, push). Agregar ramas en este punto sobrecargaría a los participantes.
2. **No hay riesgo de conflictos**: Al editar archivos diferentes, el flujo en `main` funciona sin problemas.
3. **Progresión natural**: La Parte 4 introduce ramas como una mejora al flujo básico, dando a los participantes una razón clara para aprender algo nuevo.

**Referencia a ramas**: Se agregó una nota en la sección 3.6 (git push) que dice: *"En la Parte 4, aprenderán a trabajar en ramas individuales y usar Pull Requests para un flujo más profesional."*

### Verificación

El flujo fue probado 3 veces simulando repos locales separados para cada participante. En todos los casos:
1. Mauricio crea la estructura inicial y hace push
2. José Miguel y Rodrigo hacen pull, editan sus archivos, y hacen push secuencialmente
3. Mauricio hace pull, edita su archivo, y hace push
4. **Cero conflictos en las 3 iteraciones**

---

## Decisión 3: Ejemplos para los tres participantes

### Pregunta
¿Se deben incluir ejemplos para Rodrigo y Mauricio, además de José Miguel?

### Decisión: **Sí, se agregaron ejemplos para los tres**

### Cambios realizados

- **Sección 3.4** (Cada quien edita su sección): Se agregaron ejemplos completos de código LaTeX para Rodrigo (`methods.tex`) y Mauricio (`results.tex`), además del ya existente de José Miguel (`introduction.tex`).
- **Sección 3.5** (git add + git commit): Se agregaron ejemplos concretos de `git status`, `git add` y `git commit` para Rodrigo y Mauricio, mostrando exactamente qué comandos deben ejecutar y qué salida esperar.

---

## Decisión 4: Formas adicionales de usar `git add`

### Pregunta
¿Se debe agregar la opción de `git add .` con `.gitignore`?

### Decisión: **Sí, se agregó como Opción 4**

### Cambios realizados

- **Agregada Opción 4**: "Usar `.gitignore` + `git add .`" como método recomendado para el día a día, explicando paso a paso cómo configurar `.gitignore` antes de usar `git add .`.
- **Agregada nota de exploración**: Se incluyó un mensaje invitando a los participantes a descubrir más formas de usar `git add` consultando su LLM de preferencia, reforzando la idea de que "están a un prompt de distancia" de la respuesta.
- **Agregado `.gitignore`** a la tabla de comandos rápidos.
- **Actualizado el Checkpoint** para incluir verificación del uso de `.gitignore`.

---

## Resumen de todos los cambios en `03-flujo-basico/README.md`

| Sección | Cambio |
|---------|--------|
| 3.4 | Agregados ejemplos de edición para Rodrigo y Mauricio |
| 3.5 (diagrama) | Actualizado para reflejar `.gitignore` y `git add .` como alternativas |
| 3.5 (regla de oro) | Actualizada para incluir recomendación de `.gitignore` |
| 3.5 (ejemplos) | Agregados ejemplos concretos de add+commit para Rodrigo y Mauricio |
| 3.5 (formas de git add) | Renombrado a "Formas de usar git add", agregada Opción 4 (`.gitignore` + `git add .`) |
| 3.5 (nota exploración) | Agregada nota sobre explorar más formas de `git add` |
| 3.6 | Agregada nota de referencia a ramas y Parte 4 |
| Comandos rápidos | Agregada fila para `.gitignore` |
| Checkpoint | Agregado ítem sobre `.gitignore` |

---

*Documento creado como parte de la resolución del issue #12 de correcciones para la Parte 3.*
