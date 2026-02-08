# Plantilla de Proyecto: Código y Datos

> Esta plantilla implementa la estructura de directorios recomendada por Gentzkow & Shapiro (2014) en *"Code and Data for the Social Sciences: A Practitioner's Guide"*.

---

## Estructura del proyecto

```
plantilla-proyecto-codigo/
│
├── README.md              ← Estás aquí. Describe el proyecto completo.
│
├── codigo/                # Scripts de análisis (VERSIONADOS con Git)
│   ├── 01_limpiar.py      # Limpieza de datos crudos → datos limpios
│   └── 02_analizar.py     # Análisis: datos limpios → resultados
│
├── datos/                 # Datos del proyecto
│   ├── crudos/            # Datos originales (NUNCA se modifican)
│   │   └── README.md      # Diccionario de datos crudos
│   └── limpios/           # Datos procesados (regenerables con scripts)
│       └── .gitkeep       # Mantiene la carpeta en Git (vacía inicialmente)
│
├── resultados/            # Salidas generadas (NO versionadas)
│   ├── figuras/           # Gráficas generadas por scripts
│   │   └── .gitkeep
│   └── tablas/            # Tablas generadas por scripts
│       └── .gitkeep
│
├── documentos/            # Artículo LaTeX (VERSIONADO con Git)
│   └── main.tex           # Archivo principal del artículo
│
├── Makefile               # Automatización: "make" ejecuta todo
└── .gitignore             # Archivos que Git debe ignorar
```

---

## Cómo usar esta plantilla

### 1. Copiar a tu proyecto

```bash
# Desde la raíz del repositorio del curso
cp -r plantilla-proyecto-codigo/ mi-nuevo-proyecto/
cd mi-nuevo-proyecto/
```

### 2. Ejecutar todo el pipeline

```bash
make
```

### 3. Limpiar archivos generados

```bash
make clean
```

---

## Principios aplicados

| Principio | Cómo se aplica aquí |
|-----------|---------------------|
| **Automatización** | El `Makefile` ejecuta todo el pipeline con un comando |
| **Estructura de directorios** | Separación clara entre código, datos y resultados |
| **Datos crudos intocables** | `datos/crudos/` nunca se modifica directamente |
| **Resultados regenerables** | Todo en `resultados/` se puede regenerar desde código + datos |
| **Documentación** | README en cada carpeta |
| **Control de versiones** | `.gitignore` excluye archivos generados |

---

## Convenciones de nombres

| Tipo de archivo | Convención | Ejemplo |
|-----------------|------------|---------|
| Scripts | Numerados por orden de ejecución | `01_limpiar.py`, `02_analizar.py` |
| Datos crudos | Nombre descriptivo, sin modificar | `encuesta_2024.csv` |
| Datos limpios | Sufijo `_clean` o `_limpio` | `encuesta_2024_clean.csv` |
| Figuras | Nombre descriptivo del contenido | `distribucion_edad.png` |
| Tablas | Nombre descriptivo del contenido | `regresion_principal.tex` |

---

*Basada en Gentzkow, M. & Shapiro, J. M. (2014). "Code and Data for the Social Sciences: A Practitioner's Guide"*
