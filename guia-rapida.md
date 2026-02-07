# Guía Rápida: Colaboración en LaTeX
> Una página para tener a mano durante el taller

---

## 🔄 El Flujo en 6 Pasos

```
1. git pull              ← Obtener cambios de otros
2. [editar en VS Code]   ← Trabajar localmente
3. git add archivo.tex   ← Preparar cambios
4. git commit -m "msg"   ← Tomar "foto"
5. git push              ← Subir a GitHub
6. Overleaf: Pull        ← Sincronizar (Mauricio)
```

---

## 📋 Comandos Esenciales

| Quiero... | Comando |
|-----------|---------|
| Ver qué cambió | `git status` |
| Obtener cambios | `git pull origin main` |
| Agregar UN archivo | `git add ruta/archivo.tex` |
| Agregar TODO | `git add .` |
| Guardar snapshot | `git commit -m "descripción"` |
| Subir cambios | `git push` |
| Crear rama | `git checkout -b mi-rama` |
| Cambiar de rama | `git checkout nombre-rama` |
| Ver historial | `git log --oneline` |

---

## 🌿 Trabajar con Ramas

```bash
# Crear y cambiar a rama nueva
git checkout -b mi-nombre-seccion

# Trabajar, luego:
git add .
git commit -m "Mis cambios"
git push -u origin mi-nombre-seccion

# Crear Pull Request en GitHub
# Después del merge, actualizar:
git checkout main
git pull origin main
```

---

## ⚠️ Resolver Conflictos

Si ves `CONFLICT` al hacer pull:

1. Abrir archivo en VS Code
2. Buscar los marcadores:
   ```
   <<<<<<< HEAD
   Tu versión
   =======
   La otra versión
   >>>>>>> origin/main
   ```
3. Decidir qué mantener (o combinar)
4. Eliminar los marcadores `<<<<<<<`, `=======`, `>>>>>>>`
5. Guardar
6. `git add archivo.tex`
7. `git commit -m "Resuelto conflicto"`

---

## ⌨️ Atajos VS Code

| Acción | Windows | Mac |
|--------|---------|-----|
| Guardar | `Ctrl+S` | `Cmd+S` |
| Ver PDF | `Ctrl+Alt+V` | `Cmd+Opt+V` |
| Terminal | `` Ctrl+` `` | `` Cmd+` `` |

---

## 🆘 Problemas Comunes

| Problema | Solución |
|----------|----------|
| Push rechazado | `git pull` primero |
| No compila | Revisar Output → LaTeX Workshop |
| Conflicto | Ver sección de arriba |
| Cambios no en Overleaf | Menu → GitHub → Pull |

---

## 📁 Estructura del Proyecto

```
articulo/
├── main.tex           ← Archivo principal
├── sections/
│   ├── introduction.tex
│   ├── related-work.tex
│   ├── methods.tex
│   ├── results.tex
│   └── conclusion.tex
├── references.bib
└── .gitignore
```

---

## 📦 Proyecto con Código y Datos (Gentzkow & Shapiro)

```
proyecto/
├── codigo/           ← Scripts (versionados)
├── datos/
│   ├── crudos/       ← NUNCA modificar
│   └── limpios/      ← Regenerables
├── resultados/       ← Generados por scripts
├── documentos/       ← Artículo LaTeX
├── Makefile          ← "make" ejecuta todo
└── README.md         ← Documentación
```

**Reglas clave:**
- Datos crudos son **sagrados** (no se editan)
- `make` regenera todo desde cero
- Todo lo generado va en `.gitignore`

---

## 🔗 Enlaces Útiles

- **Este taller**: [github.com/DonovanDiazcide/Curso_Github_Overleaf](https://github.com/DonovanDiazcide/Curso_Github_Overleaf)
- **Pro Git Book**: git-scm.com/book
- **Overleaf Docs**: overleaf.com/learn

---

## 👥 Asignaciones del Taller

| Persona | Sección | Archivo |
|---------|---------|---------|
| José Miguel | Introduction + Related Work | `introduction.tex`, `related-work.tex` |
| Rodrigo | Methods + Conclusion | `methods.tex`, `conclusion.tex` |
| Mauricio | Results + Sync | `results.tex` + Overleaf |

---

*Imprime esta página o tenla abierta durante el taller.*
