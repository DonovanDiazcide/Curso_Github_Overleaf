# Parte 4: Ramas, Pull Requests y Resolución de Conflictos

> **Duración**: 20 minutos  
> **Objetivo**: Usar ramas para trabajar en paralelo y aprender a resolver conflictos

---

## Resumen de esta parte

| Paso | Descripción | Tiempo |
|------|-------------|--------|
| 4.1 | Entender qué son las ramas y por qué usarlas | 5 min |
| 4.2 | Crear y trabajar en su propia rama | 5 min |
| 4.3 | Crear un Pull Request en GitHub | 3 min |
| 4.4 | Resolver conflictos (ejercicio guiado) | 5 min |
| 4.5 | Usar ramas para versiones alternativas | 2 min |

---

## 4.1 ¿Qué son las ramas?

Una **rama** (branch) es una línea paralela de desarrollo. Es como tener una **copia del proyecto** donde pueden experimentar sin afectar la versión principal.

### Analogía: El árbol de versiones

```
                            ┌─── 📝 rama: rodrigo-metodologia
                            │    "Estoy probando una nueva estructura"
                            │
main ●────●────●────●───────●────●────● versión estable
                   │                 ↑
                   │                 │ merge (integrar)
                   │                 │
                   └─── 📝 rama: jose-introduccion
                        "Reescribí la introducción"
```

### ¿Por qué usar ramas?

| Sin ramas | Con ramas |
|-----------|-----------|
| Todos trabajan en `main` | Cada quien tiene su espacio |
| Un error afecta a todos inmediatamente | Los errores se contienen en la rama |
| No hay revisión antes de integrar | Pull Requests permiten revisar antes de integrar |
| Difícil experimentar | Pueden probar ideas sin riesgo |

### Flujo de trabajo con ramas (GitHub Flow)

```
1. Crear rama desde main      →  git checkout -b mi-rama
2. Hacer cambios y commits    →  git add . && git commit -m "..."
3. Subir rama a GitHub        →  git push -u origin mi-rama
4. Crear Pull Request         →  En GitHub, pedir revisión
5. Revisión y aprobación      →  Compañeros revisan
6. Merge a main               →  Integrar cambios aprobados
7. Actualizar local           →  git checkout main && git pull
```

> 📖 Fuente oficial: [GitHub Flow](https://docs.github.com/en/get-started/using-github/github-flow)

---

## 4.2 Crear y trabajar en su propia rama (Todos)

Cada participante creará su propia rama para trabajar de forma aislada.

> 💡 El flujo sigue siendo el mismo: **editan local → commit → push a GitHub**. La única diferencia es que ahora suben a **su rama** en vez de directamente a `main`, y usan un **Pull Request** para integrar.

### Paso 1: Asegurarse de estar actualizado

```bash
# Ir a la rama principal
git checkout main

# Obtener los últimos cambios
git pull origin main
```

### Paso 2: Crear su rama

El nombre de la rama debe ser descriptivo. Convención sugerida: `nombre-seccion` o `feature/descripcion`.

<details>
<parameter name="summary"><strong>José Miguel</strong></summary>

```bash
# Crear y cambiar a la nueva rama
git checkout -b jose-introduccion

# Verificar que están en la rama correcta
git branch
```

Salida esperada:
```
  main
* jose-introduccion    ← El asterisco indica su rama actual
```

</details>

<details>
<summary><strong>Rodrigo</strong></summary>

```bash
# Crear y cambiar a la nueva rama
git checkout -b rodrigo-metodologia

# Verificar
git branch
```

</details>

<details>
<summary><strong>Mauricio</strong></summary>

```bash
# Crear y cambiar a la nueva rama
git checkout -b mauricio-resultados

# Verificar
git branch
```

</details>

### Paso 3: Hacer cambios en su rama

1. Editen su sección asignada en VS Code
2. Guarden los cambios
3. Hagan commit:

```bash
git add sections/su-seccion.tex
git commit -m "Descripción de sus cambios"
```

Pueden hacer **múltiples commits** en su rama antes de compartirla.

### Paso 4: Subir su rama a GitHub

```bash
# Primera vez que suben esta rama
git push -u origin nombre-de-su-rama
```

Por ejemplo:
- José Miguel: `git push -u origin jose-introduccion`
- Rodrigo: `git push -u origin rodrigo-metodologia`
- Mauricio: `git push -u origin mauricio-resultados`

> **Nota**: El `-u` configura el "upstream" para que futuros `git push` sepan a dónde ir.

---

## 4.3 Crear un Pull Request en GitHub

Un **Pull Request (PR)** es una solicitud para integrar los cambios de su rama a `main`. Permite que otros revisen su trabajo antes de integrarlo.

### Paso 1: Ir a GitHub

1. Abran el repositorio en GitHub
2. Verán un mensaje amarillo: **"nombre-de-su-rama had recent pushes"**
3. Click en **"Compare & pull request"**

(Si no ven el mensaje, vayan a la pestaña "Pull requests" → "New pull request")

### Paso 2: Configurar el Pull Request

| Campo | Qué poner |
|-------|-----------|
| **base** | `main` (la rama destino) |
| **compare** | su rama (ej: `jose-introduccion`) |
| **Title** | Descripción breve: "Completé la sección de introducción" |
| **Description** | Detalles de qué cambiaron, por qué, etc. |

### Paso 3: Crear el PR

1. Click en **"Create pull request"**
2. GitHub mostrará los cambios que hicieron
3. Sus compañeros pueden revisar, comentar y aprobar

### Paso 4: Revisión (compañeros)

Los revisores pueden:
- 👀 Ver los cambios línea por línea
- 💬 Agregar comentarios en líneas específicas
- ✅ Aprobar: "Approve"
- 🔄 Pedir cambios: "Request changes"

### Paso 5: Merge (después de aprobación)

> ⚠️ **Tipo de merge correcto**: Asegúrense de usar **"Create a merge commit"** (no "Squash" ni "Rebase"). Esto preserva el historial completo de todos los commits de la rama, incluso si después la eliminan.

Una vez aprobado:
1. Click en **"Merge pull request"** (botón verde)
2. **Verificar el menú desplegable**: debe decir "Create a merge commit"
3. Click en **"Confirm merge"**
4. (Opcional) Click en **"Delete branch"** para limpiar — los commits permanecen en el historial

### Paso 6: Actualizar su copia local

Después del merge, actualicen su `main` local:

```bash
git checkout main
git pull origin main
```

---

## 4.4 Resolver conflictos (Ejercicio guiado)

### ¿Cuándo ocurren conflictos?

Un conflicto ocurre cuando **dos personas modifican la misma línea** del mismo archivo.

```
       Mauricio (en main)           José Miguel (en su rama)
            │                             │
            ▼                             ▼
   Cambió título de               Cambió título de
   introduction.tex                introduction.tex
   (línea 1: \section{...})       (línea 1: \section{...})
            │                             │
            └──────────┬──────────────────┘
                       │
                       ▼
                  CONFLICTO
            Git no sabe cuál versión elegir
```

### ¿Quién resuelve los conflictos?

| Tipo de conflicto | Responsable |
|-------------------|-------------|
| Conflicto en **su rama** al hacer merge de main | **Ustedes** (el autor de la rama) |
| Conflicto al hacer **merge del PR** a main | **Quien creó el PR** (con ayuda del owner si es complejo) |
| Conflicto persistente o muy complejo | **Mauricio** como owner del proyecto |

### Ejercicio: Provocar y resolver un conflicto

Vamos a crear un conflicto intencionalmente para aprender a resolverlo.

#### Preparación (Mauricio)

1. En `main`, edita `sections/introduction.tex`, línea 1:
```latex
\section{Introducción al Trabajo Colaborativo}
```
2. Commit y push:
```bash
git add sections/introduction.tex
git commit -m "Cambié título de introducción"
git push origin main
```

#### José Miguel (sin saber del cambio de Mauricio)

1. En su rama `jose-introduccion`, edita la misma línea 1:
```latex
\section{Introducción y Motivación}
```
2. Commit:
```bash
git add sections/introduction.tex
git commit -m "Actualicé título de introducción"
```
3. Intenta hacer merge de main a su rama:
```bash
git pull origin main
```

#### ¡CONFLICTO!

Git mostrará:
```
Auto-merging sections/introduction.tex
CONFLICT (content): Merge conflict in sections/introduction.tex
Automatic merge failed; fix conflicts and then commit the result.
```

### Paso a paso para resolver el conflicto

#### Paso 1: Ver qué archivos tienen conflicto

```bash
git status
```

Salida:
```
Unmerged paths:
  (use "git add <file>..." to mark resolution)
        both modified:   sections/introduction.tex
```

#### Paso 2: Abrir el archivo en VS Code

VS Code detectará el conflicto y mostrará algo así:

```latex
<<<<<<< HEAD
\section{Introducción y Motivación}
=======
\section{Introducción al Trabajo Colaborativo}
>>>>>>> origin/main
```

**¿Qué significa esto?**

| Sección | Significado |
|---------|-------------|
| `<<<<<<< HEAD` | Inicio de SUS cambios (su rama) |
| `=======` | Separador entre las dos versiones |
| `>>>>>>> origin/main` | Fin de los cambios de MAIN |

#### Paso 3: Decidir cómo resolver

Tienen tres opciones:

**Opción A: Mantener SU versión**
```latex
\section{Introducción y Motivación}
```

**Opción B: Mantener la versión de MAIN**
```latex
\section{Introducción al Trabajo Colaborativo}
```

**Opción C: Combinar ambas (lo más común)**
```latex
\section{Introducción y Motivación del Trabajo Colaborativo}
```

#### Paso 4: Editar el archivo

1. **Eliminen** los marcadores de conflicto (`<<<<<<<`, `=======`, `>>>>>>>`)
2. **Dejen** el contenido que quieren mantener
3. **Guarden** el archivo

Resultado final:
```latex
\section{Introducción y Motivación del Trabajo Colaborativo}
```

#### Paso 5: Marcar como resuelto

```bash
# Agregar el archivo resuelto
git add sections/introduction.tex

# Completar el merge con un commit
git commit -m "Resuelto conflicto en título de introducción: combiné ambas versiones"
```

#### Paso 6: Verificar que compila localmente

Antes de subir, asegúrense de que el documento sigue compilando correctamente:

1. Guarden el archivo en VS Code (`Ctrl+S` / `Cmd+S`)
2. Revisen que el PDF se genere sin errores
3. Si todo está bien, continúen:

```bash
# Subir su rama actualizada
git push origin jose-introduccion
```

> 💡 Recuerda: incluso al trabajar con ramas, el flujo sigue siendo **Local → GitHub → Overleaf**. Primero verifican que funciona en su máquina, luego suben.

### VS Code: Herramientas visuales para conflictos

VS Code ofrece botones para resolver conflictos fácilmente:

```
<<<<<<< HEAD (Current Change)
[Accept Current Change] [Accept Incoming Change] [Accept Both Changes] [Compare Changes]
\section{Introducción y Motivación}
=======
\section{Introducción al Trabajo Colaborativo}
>>>>>>> origin/main (Incoming Change)
```

| Botón | Acción |
|-------|--------|
| **Accept Current Change** | Mantener su versión |
| **Accept Incoming Change** | Mantener la versión de main |
| **Accept Both Changes** | Mantener ambas (una después de otra) |
| **Compare Changes** | Ver lado a lado |

> **Recomendación**: Usa los botones para casos simples. Para conflictos complejos, edita manualmente.

---

## 4.5 Usar ramas para versiones alternativas del artículo

> **Escenario**: Mauricio quiere mantener dos versiones del artículo: una con enfoque teórico y otra con enfoque práctico.

### Crear ramas para propuestas alternativas

```bash
# Desde main, crear rama para versión teórica
git checkout main
git checkout -b propuesta/enfoque-teorico

# Hacer cambios para esta versión
# ... editar archivos ...
git add .
git commit -m "Versión con enfoque teórico"
git push -u origin propuesta/enfoque-teorico

# Volver a main y crear otra propuesta
git checkout main
git checkout -b propuesta/enfoque-practico

# Hacer cambios para esta versión
# ... editar archivos ...
git add .
git commit -m "Versión con enfoque práctico"
git push -u origin propuesta/enfoque-practico
```

### Estructura resultante

```
main                    ← Versión estable/actual
  │
  ├── propuesta/enfoque-teorico     ← Versión alternativa 1
  │
  └── propuesta/enfoque-practico    ← Versión alternativa 2
```

### Beneficios de este enfoque

| Beneficio | Descripción |
|-----------|-------------|
| **Preservación** | Las propuestas quedan guardadas para siempre |
| **Comparación fácil** | Pueden comparar ramas en GitHub |
| **Reversibilidad** | Si eliges una y luego cambias de opinión, la otra sigue ahí |
| **Colaboración** | Diferentes personas pueden trabajar en diferentes propuestas |

### Cambiar entre versiones

```bash
# Ver todas las ramas
git branch -a

# Cambiar a la propuesta teórica
git checkout propuesta/enfoque-teorico

# Cambiar a la propuesta práctica
git checkout propuesta/enfoque-practico

# Volver a main
git checkout main
```

### Comparar ramas en GitHub

1. Ir al repositorio en GitHub
2. Click en **"branches"** (junto al contador de ramas)
3. Click en una rama
4. Click en **"Compare"** para ver diferencias con main

---

## Resumen de comandos de ramas

| Qué quiero hacer | Comando |
|------------------|---------|
| Ver ramas locales | `git branch` |
| Ver todas las ramas (local + remoto) | `git branch -a` |
| Crear y cambiar a nueva rama | `git checkout -b nombre-rama` |
| Cambiar a rama existente | `git checkout nombre-rama` |
| Subir rama nueva a GitHub | `git push -u origin nombre-rama` |
| Traer cambios de main a mi rama | `git pull origin main` |
| Eliminar rama local | `git branch -d nombre-rama` |
| Eliminar rama en GitHub | `git push origin --delete nombre-rama` |

---

## Resumen de resolución de conflictos

```
┌─────────────────────────────────────────────────────────────┐
│              FLUJO DE RESOLUCIÓN DE CONFLICTOS              │
└─────────────────────────────────────────────────────────────┘

    ┌──────────────────────────────────────┐
    │  1. Git detecta conflicto            │
    │     "CONFLICT in archivo.tex"        │
    └──────────────────────────────────────┘
                      │
                      ▼
    ┌──────────────────────────────────────┐
    │  2. Ver archivos afectados           │
    │     git status                       │
    └──────────────────────────────────────┘
                      │
                      ▼
    ┌──────────────────────────────────────┐
    │  3. Abrir archivo en VS Code         │
    │     Buscar: <<<<<<< HEAD             │
    └──────────────────────────────────────┘
                      │
                      ▼
    ┌──────────────────────────────────────┐
    │  4. Decidir qué mantener             │
    │     - Su versión                     │
    │     - La otra versión                │
    │     - Combinación de ambas           │
    └──────────────────────────────────────┘
                      │
                      ▼
    ┌──────────────────────────────────────┐
    │  5. Editar: eliminar marcadores      │
    │     Quitar <<<<<<<, =======, >>>>>>> │
    └──────────────────────────────────────┘
                      │
                      ▼
    ┌──────────────────────────────────────┐
    │  6. Guardar y marcar resuelto        │
    │     git add archivo.tex              │
    │     git commit -m "Resuelto..."      │
    └──────────────────────────────────────┘
```

---

## Checkpoint ✅

Antes de continuar a la Parte 5, verifiquen que:

- [ ] Crearon su propia rama
- [ ] Hicieron al menos un commit en su rama
- [ ] Subieron su rama a GitHub
- [ ] Entienden cómo leer los marcadores de conflicto (`<<<<<<<`, `=======`, `>>>>>>>`)
- [ ] Saben cómo marcar un conflicto como resuelto (`git add` + `git commit`)

---

**Anterior**: [← Parte 3 - Flujo Básico](../03-flujo-basico/README.md)

**Siguiente**: [Parte 5 - Práctica Libre →](../05-practica-libre/README.md)
