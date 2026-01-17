# Notas para el Instructor

> Guía de facilitación para el taller de 2 horas

---

## Antes del taller

### Una semana antes

- [ ] Enviar guías de instalación a los participantes
  - Mauricio: `00-instalacion/windows-ingles.md`
  - José Miguel: `00-instalacion/windows-espanol.md`
  - Rodrigo: `00-instalacion/mac-espanol.md`
- [ ] Pedir que completen la instalación y envíen captura de `git --version` y `pdflatex --version`
- [ ] Crear el repositorio en GitHub (o pedirle a Mauricio que lo haga)
- [ ] Verificar que Mauricio tiene Overleaf Premium activo

### Un día antes

- [ ] Enviar recordatorio con:
  - Link de la videollamada (si es remoto)
  - Link del repositorio de GitHub
  - Agenda del taller
- [ ] Preparar la plantilla del artículo en Overleaf (Mauricio)
- [ ] Conectar Overleaf con GitHub (Mauricio)

### 30 minutos antes

- [ ] Abrir todos los recursos que vas a compartir pantalla
- [ ] Tener el cheatsheet (`recursos/cheatsheet.md`) listo para compartir
- [ ] Probar que tu LaTeX compila localmente

---

## Durante el taller

### Agenda con tiempos

| Tiempo | Duración | Parte | Notas para el instructor |
|--------|----------|-------|--------------------------|
| 0:00 | 10 min | Verificación | Resolver problemas de instalación pendientes |
| 0:10 | 15 min | Parte 1: Conceptos | Usar analogías, no abrumar con comandos |
| 0:25 | 20 min | Parte 2: Configuración | Compartir pantalla, ir paso a paso |
| 0:45 | 30 min | Parte 3: Flujo básico | **Más importante**: asegurar que todos hagan commit+push |
| 1:15 | 20 min | Parte 4: Ramas y conflictos | Provocar conflicto intencional como demo |
| 1:35 | 20 min | Parte 5: Práctica libre | Dejar que trabajen solos, estar disponible para dudas |
| 1:55 | 5 min | Cierre | Compartir cheatsheet, agradecer |

### Tips de facilitación

1. **Compartir pantalla frecuentemente**: Especialmente en Partes 2 y 3
2. **Ir más lento de lo que crees necesario**: Git es nuevo para muchos
3. **Verificar antes de avanzar**: "¿Todos ven el mismo output?"
4. **Usar el chat/audio**: Pedir que digan "listo" cuando completen cada paso
5. **Tener paciencia con errores**: Son oportunidades de aprendizaje

---

## Problemas comunes y soluciones

### Instalación

| Problema | Síntoma | Solución |
|----------|---------|----------|
| Git no está en PATH (Windows) | `git: command not found` | Reinstalar Git marcando "Git from command line and 3rd-party software" |
| MiKTeX no está en PATH | `pdflatex: command not found` | Abrir MiKTeX Console → Settings → agregar a PATH, reiniciar terminal |
| MacTeX no está en PATH | `pdflatex: command not found` | Ejecutar: `echo 'export PATH="/usr/local/texlive/2025/bin/universal-darwin:$PATH"' >> ~/.zshrc && source ~/.zshrc` |
| Perl falta (Windows) | LaTeX Workshop falla al compilar | Instalar Strawberry Perl, reiniciar VS Code |
| VS Code no detecta LaTeX | No aparece ícono TEX | Reinstalar extensión LaTeX Workshop, reiniciar VS Code |

### Git

| Problema | Síntoma | Solución |
|----------|---------|----------|
| Push rechazado | `rejected - non-fast-forward` | Hacer `git pull origin main` primero, resolver conflictos si hay |
| No configuró user.name | `Please tell me who you are` | Ejecutar `git config --global user.name "Nombre"` y `git config --global user.email "email"` |
| Rama incorrecta | Commits en main en lugar de rama | Crear rama ahora: `git checkout -b mi-rama`, los commits se llevan |
| Archivo no trackeado | `git status` muestra archivo pero no se sube | Hacer `git add archivo.tex` explícitamente |
| Conflicto de merge | `CONFLICT in archivo.tex` | Ver Parte 4, resolver manualmente, `git add` + `git commit` |

### Overleaf

| Problema | Síntoma | Solución |
|----------|---------|----------|
| No aparece opción GitHub | Menu no muestra GitHub | Verificar que tiene cuenta Premium/institucional |
| Sync falla | Error al push/pull | Verificar que el repo existe en GitHub, que tiene permisos |
| Cambios no aparecen | Editó en Overleaf pero no en GitHub | Hacer "Push Overleaf changes to GitHub" |
| Cambios de GitHub no aparecen | Otros subieron pero no ve | Hacer "Pull GitHub changes into Overleaf" |

### LaTeX

| Problema | Síntoma | Solución |
|----------|---------|----------|
| Paquete faltante | `File 'paquete.sty' not found` | MiKTeX: debería instalar auto. Si no, abrir MiKTeX Console → Packages → buscar e instalar |
| Error de compilación | PDF no se genera | Ver panel Output → LaTeX Workshop para el error específico |
| Bibliografía no aparece | Referencias como `[?]` | Compilar dos veces, o usar latexmk (LaTeX Workshop lo hace auto) |
| Encoding incorrecto | Caracteres raros (ñ, á) | Agregar `\usepackage[utf8]{inputenc}` y guardar archivo como UTF-8 |

---

## Respuestas a preguntas frecuentes

### "¿Por qué no usar solo Overleaf?"

> Overleaf es excelente para edición rápida, pero:
> - Solo una persona puede compilar a la vez
> - El historial es menos detallado que Git
> - No hay Pull Requests para revisión formal
> - Depende 100% de internet
>
> Nuestro flujo usa Overleaf para verificación final, pero el trabajo diario es local.

### "¿Qué pasa si hago algo mal y rompo todo?"

> Git guarda todo. Siempre puedes:
> - Ver el historial: `git log`
> - Volver a un commit anterior: `git checkout abc123`
> - Deshacer cambios: `git reset`
>
> Es casi imposible perder trabajo de verdad con Git.

### "¿Necesito internet para trabajar?"

> No. Git funciona 100% local. Solo necesitas internet para:
> - `git push` (subir cambios)
> - `git pull` (bajar cambios)
> - Sincronizar con Overleaf
>
> Puedes trabajar offline todo el día y sincronizar al final.

### "¿Esto sirve para otros proyectos que no son LaTeX?"

> ¡Sí! Git funciona con cualquier archivo de texto:
> - Código (Python, R, etc.)
> - Markdown
> - Datos CSV
>
> Solo cambia la parte de Overleaf por el entorno correspondiente.

### "¿Qué hago si alguien no vino al taller pero quiere unirse al proyecto?"

> 1. Agregarlos como colaborador en GitHub
> 2. Compartirles las guías de instalación
> 3. Que clonen el repo: `git clone URL`
> 4. Repasar Parte 3 (flujo básico) con ellos

---

## Ejercicio de conflicto (Parte 4)

### Setup del conflicto intencional

**Objetivo**: Que todos vean un conflicto real y aprendan a resolverlo.

**Preparación** (tú o Mauricio):
1. En `main`, editar línea 1 de `sections/introduction.tex`:
   ```latex
   \section{Introducción al Trabajo Colaborativo}
   ```
2. Commit y push:
   ```bash
   git add sections/introduction.tex
   git commit -m "Cambié título de introducción (para demo de conflicto)"
   git push origin main
   ```

**Instrucción a José Miguel** (sin decirle del cambio):
1. En tu rama, edita la misma línea 1:
   ```latex
   \section{Introducción y Motivación}
   ```
2. Commit:
   ```bash
   git commit -am "Actualicé título"
   ```
3. Intenta traer main:
   ```bash
   git pull origin main
   ```

**Resultado**: Conflicto. Resolver en vivo mostrando:
- Los marcadores `<<<<<<<`, `=======`, `>>>>>>>`
- Cómo decidir qué mantener
- `git add` + `git commit` para completar

---

## Checklist de cierre

- [ ] Todos hicieron al menos un commit
- [ ] Todos hicieron push exitosamente
- [ ] Al menos un PR fue creado y merged
- [ ] Overleaf tiene la versión final sincronizada
- [ ] Compartiste el cheatsheet
- [ ] Preguntaste si hay dudas finales
- [ ] Agradeciste la participación

---

## Después del taller

- [ ] Enviar email de seguimiento con:
  - Link al repositorio del taller (este material)
  - Link al cheatsheet
  - Recursos adicionales (Pro Git Book, GitHub Skills)
- [ ] Pedir feedback sobre el taller
- [ ] Estar disponible para dudas en los siguientes días

---

## Contacto para problemas

Si el instructor tiene problemas durante el taller:

1. **Git/GitHub**: [GitHub Community](https://github.community/)
2. **Overleaf**: [Overleaf Support](https://www.overleaf.com/contact)
3. **LaTeX Workshop**: [GitHub Issues](https://github.com/James-Yu/LaTeX-Workshop/issues)

---

*Estas notas son para el instructor. No compartir con participantes.*
