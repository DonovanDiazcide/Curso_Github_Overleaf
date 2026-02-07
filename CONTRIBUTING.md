# Guía de Contribución

¡Gracias por tu interés en contribuir a este proyecto! Este documento te guiará en el proceso.

## 🎯 Cómo Contribuir

### Reportar Problemas

Si encuentras un error o tienes una sugerencia:

1. Verifica que el problema no haya sido reportado en [Issues](https://github.com/DonovanDiazcide/Curso_Github_Overleaf/issues)
2. Abre un nuevo Issue con:
   - Título descriptivo
   - Descripción clara del problema
   - Pasos para reproducirlo
   - Sistema operativo y versiones de software

### Proponer Mejoras

Para proponer nuevas funcionalidades o mejoras:

1. Abre un Issue para discutir la idea antes de implementarla
2. Espera feedback de los mantenedores
3. Una vez aprobada, procede con el Pull Request

## 🔄 Proceso de Pull Request

### 1. Fork y Clone

```bash
# Fork el repositorio en GitHub, luego:
git clone https://github.com/TU_USUARIO/Curso_Github_Overleaf.git
cd Curso_Github_Overleaf
```

### 2. Crear una Rama

```bash
git checkout -b feature/nombre-descriptivo
```

Convenciones para nombres de ramas:
- `feature/nueva-funcionalidad` - Para nuevas características
- `fix/correccion-bug` - Para correcciones
- `docs/mejora-documentacion` - Para documentación
- `refactor/mejora-codigo` - Para refactorización

### 3. Hacer Cambios

- Escribe código claro y bien documentado
- Sigue el estilo existente del proyecto
- Actualiza la documentación si es necesario
- Prueba tus cambios localmente

#### Para cambios en LaTeX:

```bash
# Compilar para verificar
cd plantilla-articulo
pdflatex main.tex
bibtex main
pdflatex main.tex
pdflatex main.tex
```

### 4. Commit con Mensajes Claros

Usa mensajes descriptivos que expliquen **qué** y **por qué**:

```bash
git add archivo-modificado.tex
git commit -m "Agregué sección de metodología con ejemplos de código"
```

**Buenos ejemplos:**
- ✅ `Agregué tutorial para macOS con screenshots`
- ✅ `Corregí error en comandos de Windows PowerShell`
- ✅ `Actualicé README con requisitos de instalación`

**Malos ejemplos:**
- ❌ `cambios`
- ❌ `fix`
- ❌ `actualización`

### 5. Push y Pull Request

```bash
git push origin feature/nombre-descriptivo
```

Luego en GitHub:
1. Ve a tu fork
2. Click "Compare & pull request"
3. Completa el template de PR con:
   - Descripción clara de los cambios
   - Referencia a Issues relacionados
   - Screenshots si hay cambios visuales
   - Checklist de verificación

## ✅ Checklist Antes de Enviar PR

- [ ] El código compila sin errores
- [ ] He probado los cambios localmente
- [ ] He actualizado la documentación relevante
- [ ] Los commits tienen mensajes descriptivos
- [ ] He revisado el diff para evitar cambios no relacionados
- [ ] He seguido el estilo del código existente

## 📋 Estándares del Proyecto

### Documentación en Markdown

- Usa títulos claros con jerarquía apropiada
- Incluye ejemplos de código cuando sea relevante
- Añade emojis para mejorar legibilidad (⚠️ 💡 ✅)
- Proporciona comandos específicos por sistema operativo

### Archivos LaTeX

- Usa UTF-8 encoding
- Mantén líneas menores a 80 caracteres cuando sea posible
- Separa secciones en archivos individuales
- Comenta código LaTeX complejo

### Organización de Archivos

```
proyecto/
├── 00-XX-nombre/          # Carpetas numeradas para orden
│   └── README.md          # Cada carpeta tiene su README
├── plantilla-articulo/    # Templates reutilizables
├── recursos/              # Material de referencia
└── README.md             # Documentación principal
```

## 🧪 Pruebas

### Probar Instalación

Si modificas guías de instalación, prueba en:
- Windows (si es posible)
- macOS (si es posible)
- Documenta cualquier problema encontrado

### Probar LaTeX

```bash
# Compilar artículos de prueba
cd articulo-prueba
pdflatex main.tex
```

Verifica que:
- Compila sin errores
- El PDF se genera correctamente
- No hay warnings críticos

## 🐛 Reporte de Bugs

Incluye en tu reporte:

```markdown
**Descripción del problema:**
Breve descripción de qué salió mal

**Pasos para reproducir:**
1. Ir a '...'
2. Ejecutar comando '...'
3. Ver error

**Comportamiento esperado:**
Qué debería pasar

**Comportamiento actual:**
Qué pasa realmente

**Ambiente:**
- OS: [Windows 11 / macOS Sonoma]
- Git version: [2.43.0]
- TeX distribution: [MiKTeX 24.1 / MacTeX 2024]

**Screenshots:**
Si aplica, agrega capturas de pantalla
```

## 💬 Código de Conducta

- Sé respetuoso y constructivo
- Acepta críticas de manera profesional
- Enfócate en el contenido, no en las personas
- Ayuda a crear un ambiente inclusivo

## 📞 Contacto

¿Preguntas? Abre un Issue o contacta a los mantenedores del proyecto.

## 🙏 Reconocimientos

Todas las contribuciones son valiosas y serán reconocidas. Los contribuidores aparecerán en la lista de contributors de GitHub.

---

**Gracias por contribuir al proyecto!** 🎉
