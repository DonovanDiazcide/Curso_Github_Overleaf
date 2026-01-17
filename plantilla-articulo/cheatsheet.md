# Cheatsheet: Comandos Git para Colaboración en LaTeX

> Referencia rápida para el flujo de trabajo diario

---

## 🔄 Flujo básico diario

```bash
# 1. Inicio del día: obtener cambios
git pull origin main

# 2. Trabajar: editar en VS Code, guardar frecuentemente

# 3. Preparar cambios
git add archivo.tex          # Un archivo específico
git add .                    # Todos los archivos modificados

# 4. Guardar snapshot
git commit -m "Descripción de los cambios"

# 5. Subir cambios
git push origin main
```

---

## 📊 Ver estado

```bash
git status                   # Estado actual (qué cambió, qué está preparado)
git log --oneline            # Historial de commits (resumido)
git log --oneline -5         # Últimos 5 commits
git diff                     # Ver cambios no preparados
git diff --staged            # Ver cambios preparados (en staging)
```

---

## 🌿 Ramas

```bash
# Ver ramas
git branch                   # Ramas locales
git branch -a                # Todas (local + remoto)

# Crear y cambiar
git checkout -b mi-rama      # Crear y cambiar a nueva rama
git checkout main            # Cambiar a rama existente

# Subir rama nueva
git push -u origin mi-rama   # Primera vez (configura upstream)
git push                     # Siguientes veces

# Eliminar rama
git branch -d mi-rama        # Local (solo si ya está merged)
git branch -D mi-rama        # Local (forzar, aunque no esté merged)
git push origin --delete mi-rama  # Remota (en GitHub)
```

---

## ⚠️ Conflictos

```bash
# Detectar conflictos
git status                   # Muestra "both modified"

# Después de resolver manualmente en VS Code
git add archivo-resuelto.tex
git commit -m "Resuelto conflicto en archivo.tex"
```

### Marcadores de conflicto

```
<<<<<<< HEAD
Tu versión (rama actual)
=======
La otra versión (rama que estás mezclando)
>>>>>>> otra-rama
```

**Pasos para resolver:**
1. Abrir archivo en VS Code
2. Decidir qué mantener (o combinar)
3. Eliminar los marcadores (`<<<<<<<`, `=======`, `>>>>>>>`)
4. Guardar
5. `git add` + `git commit`

---

## 🔙 Deshacer cosas

```bash
# Descartar cambios no guardados en un archivo
git checkout -- archivo.tex

# Quitar archivo del staging (después de git add)
git restore --staged archivo.tex

# Deshacer último commit (manteniendo cambios)
git reset --soft HEAD~1

# Deshacer último commit (descartando cambios) ⚠️ PELIGROSO
git reset --hard HEAD~1

# Volver a un commit específico (solo ver, no modifica)
git checkout abc1234
git checkout main            # Volver al presente
```

---

## 🔍 Investigar

```bash
# ¿Quién escribió cada línea?
git blame archivo.tex

# Buscar en el historial
git log --grep="palabra"     # Buscar en mensajes de commit
git log -p archivo.tex       # Ver cambios de un archivo específico

# Comparar ramas
git diff main..mi-rama
```

---

## 🌐 Remotos (GitHub)

```bash
# Ver remotos configurados
git remote -v

# Agregar remoto
git remote add origin https://github.com/usuario/repo.git

# Cambiar URL del remoto
git remote set-url origin https://github.com/usuario/nuevo-repo.git

# Obtener info del remoto sin modificar nada
git fetch origin
```

---

## 📁 .gitignore para LaTeX

```
# Archivos auxiliares
*.aux
*.log
*.out
*.toc
*.lof
*.lot
*.bbl
*.blg
*.synctex.gz
*.fdb_latexmk
*.fls

# Archivos de respaldo
*.bak
*~

# Sistema
.DS_Store
Thumbs.db
```

---

## ⌨️ Atajos de VS Code

### Windows

| Acción | Atajo |
|--------|-------|
| Guardar | `Ctrl + S` |
| Ver PDF | `Ctrl + Alt + V` |
| Compilar | `Ctrl + Alt + B` |
| Terminal | `` Ctrl + ` `` |
| Paleta de comandos | `Ctrl + Shift + P` |
| Buscar archivos | `Ctrl + P` |

### macOS

| Acción | Atajo |
|--------|-------|
| Guardar | `Cmd + S` |
| Ver PDF | `Cmd + Option + V` |
| Compilar | `Cmd + Option + B` |
| Terminal | `` Cmd + ` `` |
| Paleta de comandos | `Cmd + Shift + P` |
| Buscar archivos | `Cmd + P` |

---

## 🔗 Enlaces útiles

- [Pro Git Book](https://git-scm.com/book/en/v2)
- [GitHub Docs](https://docs.github.com)
- [Overleaf Learn](https://www.overleaf.com/learn)
- [LaTeX Workshop Wiki](https://github.com/James-Yu/LaTeX-Workshop/wiki)

---

*Guarda este archivo para referencia rápida durante tu trabajo diario.*
