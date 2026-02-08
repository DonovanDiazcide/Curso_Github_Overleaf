#!/usr/bin/env python3
"""
02_analizar.py — Análisis de datos limpios
============================================
Entrada: datos/limpios/datos_clean.csv
Salida:  resultados/tablas/resumen.tex
         resultados/figuras/distribucion.png (si matplotlib está disponible)

Este script lee los datos limpios y genera tablas y figuras
para incluir en el artículo LaTeX.

Basado en los principios de Gentzkow & Shapiro (2014):
- Los resultados se generan desde código (reproducible)
- Las tablas se exportan en formato LaTeX directamente
- Las figuras se guardan como archivos (no se copian a mano)
"""

import csv
import os

# ── Rutas ────────────────────────────────────────────────────
RUTA_DATOS    = os.path.join("datos", "limpios", "datos_clean.csv")
RUTA_TABLAS   = os.path.join("resultados", "tablas")
RUTA_FIGURAS  = os.path.join("resultados", "figuras")

# ── Crear directorios de salida ──────────────────────────────
os.makedirs(RUTA_TABLAS, exist_ok=True)
os.makedirs(RUTA_FIGURAS, exist_ok=True)

# ── Leer datos limpios ──────────────────────────────────────
print("Paso 1: Leyendo datos limpios...")

datos = []
with open(RUTA_DATOS, "r", encoding="utf-8") as f:
    reader = csv.DictReader(f)
    for fila in reader:
        datos.append(fila)

print(f"  Se cargaron {len(datos)} registros.")

# ── Análisis: estadísticas descriptivas ─────────────────────
print("Paso 2: Calculando estadísticas descriptivas...")

edades = [int(d["edad"]) for d in datos]
respuestas = [int(d["respuesta_q1"]) for d in datos]

n = len(datos)
edad_promedio = sum(edades) / n
resp_promedio = sum(respuestas) / n
edad_min = min(edades)
edad_max = max(edades)

# ── Generar tabla LaTeX ─────────────────────────────────────
print("Paso 3: Generando tabla LaTeX...")

tabla_latex = r"""\begin{table}[h]
\centering
\caption{Estadísticas descriptivas de la muestra}
\label{tab:descriptivas}
\begin{tabular}{lc}
\hline
\textbf{Variable} & \textbf{Valor} \\
\hline
Número de participantes & %d \\
Edad promedio & %.1f \\
Edad mínima & %d \\
Edad máxima & %d \\
Respuesta promedio (Q1) & %.2f \\
\hline
\end{tabular}
\end{table}
""" % (n, edad_promedio, edad_min, edad_max, resp_promedio)

archivo_tabla = os.path.join(RUTA_TABLAS, "resumen.tex")
with open(archivo_tabla, "w", encoding="utf-8") as f:
    f.write(tabla_latex)

print(f"  Tabla guardada en: {archivo_tabla}")

# ── Generar figura (solo si matplotlib está disponible) ──────
print("Paso 4: Generando figuras...")

try:
    import matplotlib
    matplotlib.use("Agg")  # Backend sin GUI para servidores
    import matplotlib.pyplot as plt

    fig, ax = plt.subplots(1, 1, figsize=(6, 4))
    ax.bar(range(1, 6), [respuestas.count(i) for i in range(1, 6)],
           color="#4C72B0", edgecolor="white")
    ax.set_xlabel("Respuesta (escala Likert)")
    ax.set_ylabel("Frecuencia")
    ax.set_title("Distribución de respuestas a Q1")
    ax.set_xticks(range(1, 6))

    archivo_figura = os.path.join(RUTA_FIGURAS, "distribucion.png")
    fig.savefig(archivo_figura, dpi=150, bbox_inches="tight")
    plt.close(fig)
    print(f"  Figura guardada en: {archivo_figura}")

except ImportError:
    print("  matplotlib no disponible → se omite la generación de figuras.")
    print("  Para instalar: pip install matplotlib")

print("\n¡Análisis completado!")
