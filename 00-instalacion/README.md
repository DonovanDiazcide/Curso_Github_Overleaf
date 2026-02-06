# Guías de Instalación

> **Tiempo estimado**: 45-60 minutos  
> **Cuándo**: Completar ANTES del taller

---

## Encuentra tu guía

| Tu Sistema Operativo | Idioma del Sistema | Tu Guía |
|---------------------|-------------------|---------|
| Windows | Inglés | [windows-ingles.md](windows-ingles.md) |
| Windows | Español | [windows-espanol.md](windows-espanol.md) |
| macOS | Español | [mac-espanol.md](mac-espanol.md) |

---

## ¿Qué vas a instalar?

| Herramienta | ¿Para qué? | Tiempo |
|-------------|------------|--------|
| **Cuenta de GitHub** | Almacenar y compartir el proyecto | 2 min |
| **Git** | Control de versiones en tu computadora | 10 min |
| **Visual Studio Code** | Editor de código | 5 min |
| **MiKTeX** (Windows) / **MacTeX** (Mac) | Compilar documentos LaTeX | 15-30 min |
| **Strawberry Perl** (solo Windows) | Requerido por LaTeX Workshop | 5 min |
| **Extensión LaTeX Workshop** | Integrar LaTeX con VS Code | 2 min |

---

## Verificación rápida

Después de instalar todo, abre una terminal y ejecuta:

### Windows (PowerShell)
```powershell
git --version
pdflatex --version
perl --version
```

### macOS (Terminal)
```bash
git --version
pdflatex --version
```

Si todos los comandos muestran una versión, ¡estás listo!

---

## Prueba final

1. Crea un archivo `test.tex` en VS Code con este contenido:
```latex
\documentclass{article}
\begin{document}
Hola, \LaTeX!
\end{document}
```

2. Guarda el archivo (Ctrl+S en Windows, Cmd+S en Mac)
3. Compila el documento: Presiona Ctrl+Alt+B (Windows) o Cmd+Option+B (Mac)
4. Ve el PDF: Presiona Ctrl+Alt+V (Windows) o Cmd+Option+V (Mac)

Si ves "Hola, LATEX!" en el PDF, **¡todo funciona!** 🎉

---

## ¿Problemas?

Cada guía tiene una sección de "Solución de Problemas" al final. Si algo no funciona:

1. Revisa esa sección primero
2. Reinicia tu computadora (muchos problemas se resuelven así)
3. Contacta al instructor antes del taller

---

[← Volver al índice principal](../README.md)
