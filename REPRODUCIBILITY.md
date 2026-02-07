# Guía de Reproducibilidad

Este documento describe cómo reproducir el entorno y workflow de este proyecto, siguiendo las mejores prácticas de investigación reproducible descritas en el artículo [arXiv:2408.09344](https://arxiv.org/abs/2408.09344).

## 🎯 Objetivo

Esta guía te permitirá:
- ✅ Configurar un entorno idéntico al usado en el taller
- ✅ Verificar que todas las herramientas funcionan correctamente
- ✅ Reproducir los ejemplos LaTeX del repositorio
- ✅ Entender el flujo de trabajo colaborativo

## 📋 Requisitos del Sistema

### Mínimos

| Componente | Versión Mínima | Recomendada |
|------------|----------------|-------------|
| **Sistema Operativo** | Windows 10 / macOS 10.14 / Ubuntu 20.04 | Última versión |
| **Git** | 2.30.0 | 2.40+ |
| **LaTeX** | TeX Live 2020 / MiKTeX 21.0 | TeX Live 2024 / MiKTeX 24.0 |
| **VS Code** | 1.70.0 | Última versión |
| **Espacio en disco** | 5 GB | 10 GB+ |
| **RAM** | 4 GB | 8 GB+ |

### Software Necesario

1. **Git**: Control de versiones
   - Windows: https://git-scm.com/download/win
   - macOS: `brew install git` o https://git-scm.com/download/mac
   - Linux: `sudo apt-get install git`

2. **LaTeX Distribution**:
   - Windows: [MiKTeX](https://miktex.org/download)
   - macOS: [MacTeX](https://www.tug.org/mactex/)
   - Linux: `sudo apt-get install texlive-full`

3. **VS Code**: https://code.visualstudio.com/download

4. **Extensión LaTeX Workshop**:
   - Abrir VS Code
   - Ir a Extensions (Ctrl+Shift+X / Cmd+Shift+X)
   - Buscar "LaTeX Workshop"
   - Instalar

## 🚀 Instalación Paso a Paso

### Paso 1: Verificar Git

```bash
# Verificar instalación
git --version

# Debe mostrar: git version 2.x.x
```

**Si no funciona**:
- Windows: Reiniciar terminal o computadora después de instalar
- macOS: Instalar Xcode Command Line Tools: `xcode-select --install`
- Linux: Verificar que Git está en el PATH

### Paso 2: Configurar Git

```bash
# Configurar nombre y email
git config --global user.name "Tu Nombre"
git config --global user.email "tu@email.com"

# Verificar configuración
git config --global --list
```

### Paso 3: Verificar LaTeX

```bash
# Verificar instalación
pdflatex --version

# Debe mostrar: pdfTeX 3.x (TeX Live 202x) o similar
```

**Si no funciona**:
- Windows (MiKTeX): Agregar a PATH: `C:\Users\TU_USUARIO\AppData\Local\Programs\MiKTeX\miktex\bin\x64`
- macOS: Agregar a PATH: `export PATH="/Library/TeX/texbin:$PATH"` en `~/.zshrc` o `~/.bash_profile`
- Reiniciar terminal

### Paso 4: Verificar VS Code y LaTeX Workshop

1. Abrir VS Code
2. Verificar que la extensión LaTeX Workshop está instalada:
   - Ver → Extensions
   - Buscar "LaTeX Workshop" en instaladas
3. Crear archivo de prueba `test.tex`:

```latex
\documentclass{article}
\begin{document}
Hola LaTeX!
\end{document}
```

4. Guardar (Ctrl+S / Cmd+S)
5. VS Code debe compilar automáticamente y mostrar PDF

## 📥 Clonar el Repositorio

### Opción 1: HTTPS (Recomendado para principiantes)

```bash
# Clonar repositorio
git clone https://github.com/DonovanDiazcide/Curso_Github_Overleaf.git

# Entrar al directorio
cd Curso_Github_Overleaf

# Verificar estado
git status
```

### Opción 2: SSH (Para usuarios avanzados)

```bash
# Configurar SSH key primero (ver documentación de GitHub)
git clone git@github.com:DonovanDiazcide/Curso_Github_Overleaf.git
cd Curso_Github_Overleaf
```

## ✅ Verificación de Instalación

### Test 1: Compilar Artículo de Prueba

```bash
cd articulo-prueba
pdflatex main.tex
```

**Resultado esperado**: 
- ✅ Se crea `main.pdf`
- ✅ No hay errores críticos (warnings son normales)

### Test 2: Compilar con Referencias

```bash
pdflatex main.tex
bibtex main
pdflatex main.tex
pdflatex main.tex
```

**Resultado esperado**:
- ✅ Las referencias aparecen correctamente en el PDF
- ✅ No hay errores de citación

### Test 3: Compilar en VS Code

1. Abrir `articulo-prueba/main.tex` en VS Code
2. Guardar (Ctrl+S / Cmd+S)
3. Esperar compilación automática
4. Ver PDF en panel lateral

**Resultado esperado**:
- ✅ Compilación automática al guardar
- ✅ PDF se actualiza en tiempo real
- ✅ No hay errores en el panel de problemas

## 🔄 Flujo de Trabajo Reproducible

### Configuración Inicial (Una sola vez)

```bash
# 1. Fork el repositorio en GitHub (click en "Fork" en la web)

# 2. Clonar TU fork
git clone https://github.com/TU_USUARIO/Curso_Github_Overleaf.git
cd Curso_Github_Overleaf

# 3. Configurar remote upstream
git remote add upstream https://github.com/DonovanDiazcide/Curso_Github_Overleaf.git

# 4. Verificar remotes
git remote -v
```

### Flujo Diario de Trabajo

```bash
# 1. Actualizar desde upstream
git checkout main
git pull upstream main

# 2. Crear rama para tu trabajo
git checkout -b mi-nombre-tarea

# 3. Hacer cambios (editar archivos en VS Code)

# 4. Verificar cambios
git status
git diff

# 5. Agregar cambios
git add archivo-modificado.tex

# 6. Commit con mensaje descriptivo
git commit -m "Descripción clara de los cambios"

# 7. Subir a TU fork
git push origin mi-nombre-tarea

# 8. Crear Pull Request en GitHub
# (ir a tu fork en GitHub y seguir las indicaciones)
```

## 🧪 Tests Automatizados

Este repositorio incluye GitHub Actions para compilación automática.

### Ver estado de compilación

- Ir a https://github.com/DonovanDiazcide/Curso_Github_Overleaf/actions
- Verificar que los workflows están pasando (✅)

### Ejecutar tests localmente

```bash
# Compilar todos los documentos
cd articulo-prueba && pdflatex main.tex && cd ..
cd plantilla-articulo && pdflatex main.tex && cd ..

# Si todos compilan sin errores, ✅ tests locales pasados
```

## 📊 Estructura de Datos y Código

### Organización del Repositorio

```
Curso_Github_Overleaf/
├── 00-instalacion/         # Guías de instalación por OS
├── 01-conceptos/           # Material teórico
├── 02-configuracion-inicial/
├── 03-flujo-basico/
├── 04_ramas_y_conflictos/
├── 05-practica-libre/
├── articulo-prueba/        # Documento LaTeX de ejemplo
│   ├── main.tex           # Archivo principal
│   ├── sections/          # Secciones en archivos separados
│   └── references.bib     # Referencias bibliográficas
├── plantilla-articulo/     # Template reutilizable
├── recursos/              # Material de apoyo
├── .github/               # Configuración GitHub (Actions, templates)
├── CONTRIBUTING.md        # Guía de contribución
├── LICENSE               # Licencia MIT
├── CITATION.cff          # Cómo citar este trabajo
└── README.md             # Documentación principal
```

### Convenciones de Archivos

- **`.tex`**: Archivos fuente LaTeX
- **`.bib`**: Referencias bibliográficas
- **`.pdf`**: PDFs generados (no se suben a Git)
- **`.md`**: Documentación en Markdown

## 🐛 Solución de Problemas Comunes

### Problema 1: `git command not found`

**Solución**:
```bash
# Windows: Reiniciar terminal y verificar instalación
# macOS: Instalar Command Line Tools
xcode-select --install
# Linux:
sudo apt-get update && sudo apt-get install git
```

### Problema 2: `pdflatex: command not found`

**Solución**:
- Verificar que LaTeX está instalado
- Agregar al PATH (ver Paso 3 arriba)
- Reiniciar terminal

### Problema 3: LaTeX Workshop no compila automáticamente

**Solución**:
1. Verificar que la extensión está activa
2. Ver Output → LaTeX para mensajes de error
3. Reiniciar VS Code

### Problema 4: `Permission denied (publickey)` con SSH

**Solución**:
- Usar HTTPS en lugar de SSH
- O configurar SSH keys: https://docs.github.com/en/authentication/connecting-to-github-with-ssh

### Problema 5: Conflictos al hacer `git pull`

**Solución**:
```bash
# Guardar cambios locales temporalmente
git stash

# Actualizar
git pull upstream main

# Recuperar cambios
git stash pop

# Resolver conflictos si los hay (ver tutorial en 04_ramas_y_conflictos)
```

## 📞 Soporte

Si encuentras problemas:

1. **Revisa esta guía** completa
2. **Busca en Issues**: https://github.com/DonovanDiazcide/Curso_Github_Overleaf/issues
3. **Abre un nuevo Issue**: Usa el template de bug report

## 📚 Recursos Adicionales

- [Pro Git Book](https://git-scm.com/book) - Referencia completa de Git
- [LaTeX Workshop Wiki](https://github.com/James-Yu/LaTeX-Workshop/wiki) - Documentación de la extensión
- [Overleaf Learn](https://www.overleaf.com/learn) - Tutoriales de LaTeX
- [GitHub Docs](https://docs.github.com) - Documentación oficial de GitHub

## ✅ Checklist de Verificación

Antes de empezar el taller, verifica que:

- [ ] `git --version` funciona
- [ ] `pdflatex --version` funciona
- [ ] VS Code abre correctamente
- [ ] LaTeX Workshop está instalado en VS Code
- [ ] Puedes compilar `articulo-prueba/main.tex`
- [ ] El PDF se genera sin errores
- [ ] Puedes hacer `git clone` del repositorio
- [ ] `git status` muestra "working tree clean"

**Si todos los checks están ✅, estás listo para el taller!**

---

*Última actualización: 2026-02-07*  
*Basado en: arXiv:2408.09344 - Mejores prácticas para investigación reproducible con GitHub*
