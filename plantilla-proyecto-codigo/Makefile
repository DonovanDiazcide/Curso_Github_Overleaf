# Makefile para proyecto de investigación
# Basado en Gentzkow & Shapiro (2014), "Code and Data for the Social Sciences"
#
# Uso:
#   make          → Ejecuta todo el pipeline (limpiar datos → analizar → compilar PDF)
#   make datos    → Solo procesa los datos
#   make pdf      → Solo compila el artículo LaTeX
#   make clean    → Elimina archivos temporales
#   make distclean → Elimina TODOS los archivos generados

# ── Variables ────────────────────────────────────────────────────
PYTHON   = python3
LATEX    = pdflatex
BIBTEX   = bibtex
MAIN     = documentos/main

# ── Regla principal ──────────────────────────────────────────────
all: datos pdf

# ── Etapa 1: Procesamiento de datos ─────────────────────────────
datos: datos/limpios/datos_clean.csv

datos/limpios/datos_clean.csv: datos/crudos/*.csv codigo/01_limpiar.py
	$(PYTHON) codigo/01_limpiar.py

# ── Etapa 2: Análisis ───────────────────────────────────────────
analisis: resultados/tablas/resumen.tex resultados/figuras/distribucion.png

resultados/tablas/resumen.tex resultados/figuras/distribucion.png: datos/limpios/datos_clean.csv codigo/02_analizar.py
	$(PYTHON) codigo/02_analizar.py

# ── Etapa 3: Compilar artículo ───────────────────────────────────
pdf: $(MAIN).pdf

$(MAIN).pdf: $(MAIN).tex
	cd documentos && $(LATEX) main.tex
	cd documentos && $(BIBTEX) main || true
	cd documentos && $(LATEX) main.tex
	cd documentos && $(LATEX) main.tex

# ── Limpiar ──────────────────────────────────────────────────────
clean:
	rm -f documentos/*.aux documentos/*.bbl documentos/*.blg \
	      documentos/*.log documentos/*.out documentos/*.toc \
	      documentos/*.fdb_latexmk documentos/*.fls \
	      documentos/*.synctex.gz

distclean: clean
	rm -f documentos/*.pdf
	rm -f datos/limpios/*.csv
	rm -f resultados/figuras/*.png resultados/figuras/*.pdf
	rm -f resultados/tablas/*.tex resultados/tablas/*.csv

.PHONY: all datos analisis pdf clean distclean
