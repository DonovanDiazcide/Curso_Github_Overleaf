#!/usr/bin/env python3
"""
01_limpiar.py — Limpieza de datos crudos
=========================================
Entrada: datos/crudos/*.csv
Salida:  datos/limpios/datos_clean.csv

Este script lee los datos crudos y genera una versión limpia.
Los datos crudos NUNCA se modifican directamente.

Basado en los principios de Gentzkow & Shapiro (2014):
- Los datos crudos son sagrados (nunca se modifican)
- La limpieza se hace siempre por script (reproducible)
- El script se versiona con Git
"""

import csv
import os

# ── Rutas ────────────────────────────────────────────────────
RUTA_CRUDOS  = os.path.join("datos", "crudos")
RUTA_LIMPIOS = os.path.join("datos", "limpios")

# ── Crear directorio de salida si no existe ──────────────────
os.makedirs(RUTA_LIMPIOS, exist_ok=True)

# ── Ejemplo: leer datos crudos y limpiar ─────────────────────
# (Reemplaza este bloque con tu lógica de limpieza real)
print("Paso 1: Leyendo datos crudos...")

# Ejemplo: crear datos de demostración si no existen datos reales
archivo_crudo = os.path.join(RUTA_CRUDOS, "ejemplo_encuesta.csv")
if not os.path.exists(archivo_crudo):
    print(f"  No se encontró {archivo_crudo}")
    print("  Creando datos de ejemplo para demostración...")
    with open(archivo_crudo, "w", newline="", encoding="utf-8") as f:
        writer = csv.writer(f)
        writer.writerow(["participante_id", "sesion_id", "edad", "respuesta_q1"])
        writer.writerow(["P001", "S01", "25", "4"])
        writer.writerow(["P002", "S01", " 30 ", "3"])  # nota: espacios extra
        writer.writerow(["P003", "S01", "22", "5"])
        writer.writerow(["P004", "S02", "", "2"])       # nota: edad faltante
        writer.writerow(["P005", "S02", "28", "4"])

# ── Leer y limpiar ──────────────────────────────────────────
print("Paso 2: Limpiando datos...")
datos_limpios = []

with open(archivo_crudo, "r", encoding="utf-8") as f:
    reader = csv.DictReader(f)
    for fila in reader:
        # Limpiar espacios extra
        fila_limpia = {k: v.strip() for k, v in fila.items()}

        # Saltar filas con edad faltante
        if not fila_limpia["edad"]:
            print(f"  Advertencia: participante {fila_limpia['participante_id']} sin edad → excluido")
            continue

        datos_limpios.append(fila_limpia)

# ── Guardar datos limpios ────────────────────────────────────
archivo_limpio = os.path.join(RUTA_LIMPIOS, "datos_clean.csv")
print(f"Paso 3: Guardando {len(datos_limpios)} registros limpios en {archivo_limpio}")

with open(archivo_limpio, "w", newline="", encoding="utf-8") as f:
    writer = csv.DictWriter(f, fieldnames=datos_limpios[0].keys())
    writer.writeheader()
    writer.writerows(datos_limpios)

print("¡Limpieza completada!")
