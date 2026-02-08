# Decisiones de Diseño - Parte 5: Práctica Libre y Cierre

Este documento registra las decisiones tomadas y los cambios realizados en la Parte 5 del taller, en respuesta al issue de correcciones.

---

## Decisión 1: ¿Quién es responsable de revisar y hacer merge de los Pull Requests?

### Pregunta
¿Hay alguien que tiene que preocuparse por resolver conflictos y/o hacer merge de los Pull Requests? ¿Se hace una reunión? ¿Cuál es el estándar?

### Decisión: **Mauricio como owner coordina, pero todos participan**

### Justificación

Basándome en las buenas prácticas para equipos de investigación pequeños (referencia: Gentzkow & Shapiro, "Code and Data for the Social Sciences"):

1. **Un responsable principal (owner)**: Mauricio, como owner del proyecto en GitHub y quien tiene la cuenta Premium de Overleaf, es el responsable natural de coordinar la integración. Esto no significa que sea el único que puede hacer merge, sino que tiene la responsabilidad de **supervisar** que la integración se haga correctamente.

2. **Revisión cruzada obligatoria**: Cada PR debe ser revisado por al menos una persona antes de hacer merge. La asignación circular ya existente funciona bien:
   - José Miguel revisa a Rodrigo
   - Rodrigo revisa a Mauricio
   - Mauricio revisa a José Miguel

3. **No es necesaria una reunión formal**: Para un equipo de 3 personas, basta con:
   - Crear el PR con una descripción clara
   - Esperar la aprobación del revisor asignado
   - Coordinarse brevemente (mensaje, chat) si hay conflictos
   - El autor del PR puede hacer merge tras la aprobación, o Mauricio lo hace si hay dudas

4. **El autor resuelve sus propios conflictos**: Si al intentar hacer merge de un PR surgen conflictos, el autor del PR es responsable de resolverlos (con ayuda de Mauricio si es complejo). Esto se alinea con lo ya documentado en la Parte 4.

### Referencia académica

Gentzkow & Shapiro (2014) recomiendan para equipos de investigación:
- Designar un "dueño" del código/repositorio que mantenga la calidad
- Usar revisiones de código (code review) incluso en equipos pequeños
- Mantener la rama principal (`main`) siempre en estado funcional
- Documentar las decisiones y el "por qué" de cada cambio

Para un laboratorio como LICS, con investigadores que no son expertos en programación, este flujo es suficientemente riguroso sin ser abrumador.

---

## Decisión 2: Orden de merge para minimizar conflictos

### Pregunta
Al momento de codificar puede que no sea trivial saber cuál es el mejor orden para hacer merge con main para minimizar conflictos.

### Decisión: **Guía práctica de orden de merge agregada**

### Regla implementada

Se agregó una guía clara en la sección 5.4:

1. **Primero**: PRs que modifican archivos compartidos (`main.tex`, `.gitignore`, `references.bib`)
2. **Después**: PRs que solo tocan archivos individuales (secciones propias)
3. **Si dos PRs tocan el mismo archivo**: Coordinar entre los autores antes de hacer merge
4. **Herramienta**: Usar la vista "Files changed" de cada PR en GitHub para detectar posibles conflictos antes de intentar el merge

### Justificación

En la práctica de la Parte 5 del taller:
- José Miguel modifica `main.tex` (agrega `\input{sections/related-work}`) → **merge primero**
- Mauricio solo edita `sections/results.tex` → sin dependencias
- Rodrigo solo edita `sections/conclusion.tex` → sin dependencias

Esto es un caso simple, pero la regla general aplica a proyectos más complejos del laboratorio.

---

## Resumen de cambios en `05-practica-libre/README.md`

| Sección | Cambio |
|---------|--------|
| 5.4 (Merge) | Reescrita la sección de responsabilidades de merge con guía detallada |
| 5.4 (Orden) | Agregada guía práctica para determinar orden de merge |
| 5.4 (Orden) | Agregada regla general aplicable a proyectos futuros del laboratorio |

---

*Documento creado como parte de la resolución del issue #12 de correcciones para la Parte 5.*
