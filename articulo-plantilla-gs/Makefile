# ============================================================================
# Makefile — Automatización de compilación LaTeX
#
# G&S Capítulo 2 (Automatización):
#   "Automate everything that can be automated."
#   Un solo comando (make) ejecuta toda la cadena de compilación.
#
# G&S Capítulo 4 (Directorios):
#   Los archivos temporales van a temp/, el PDF final va a output/.
#   Solo los archivos fuente se rastrean en Git.
#
# Uso:
#   make          — Compila el documento completo
#   make clean    — Elimina archivos temporales
#   make veryclean— Elimina temporales Y el PDF final
#   make view     — Abre el PDF generado
#   make check    — Verifica compilación (usar ANTES de git commit)
# ============================================================================

# --- Configuración ---
MAIN     = main
OUTDIR   = output
TEMPDIR  = temp
LATEX    = pdflatex
BIBTEX   = bibtex

# Flags para pdflatex: salida en temp/, modo no interactivo
LATEXFLAGS = -output-directory=$(TEMPDIR) -interaction=nonstopmode

# --- Objetivo principal ---
.PHONY: all clean veryclean view check dirs

all: dirs $(OUTDIR)/$(MAIN).pdf

# Crear directorios si no existen
dirs:
	@mkdir -p $(OUTDIR) $(TEMPDIR)

# --- Cadena de compilación ---
# Paso 1: Primera pasada LaTeX (genera .aux)
# Paso 2: BibTeX (resuelve citas)
# Paso 3-4: Dos pasadas más (resuelve referencias cruzadas)
# Paso 5: Copiar PDF final a output/
$(OUTDIR)/$(MAIN).pdf: $(MAIN).tex references.bib sections/*.tex
	@echo "══════════════════════════════════════════"
	@echo "  Compilando documento..."
	@echo "══════════════════════════════════════════"
	$(LATEX) $(LATEXFLAGS) $(MAIN).tex
	@cp references.bib $(TEMPDIR)/
	cd $(TEMPDIR) && $(BIBTEX) $(MAIN)
	$(LATEX) $(LATEXFLAGS) $(MAIN).tex
	$(LATEX) $(LATEXFLAGS) $(MAIN).tex
	@cp $(TEMPDIR)/$(MAIN).pdf $(OUTDIR)/$(MAIN).pdf
	@echo "══════════════════════════════════════════"
	@echo "  ✓ PDF generado: $(OUTDIR)/$(MAIN).pdf"
	@echo "══════════════════════════════════════════"

# --- Verificación pre-commit (G&S Cap. 3, Regla B) ---
# "Run the whole directory before checking it back in."
check: dirs
	@echo "Verificando compilación..."
	@$(LATEX) $(LATEXFLAGS) $(MAIN).tex > /dev/null 2>&1 && \
		cp references.bib $(TEMPDIR)/ && \
		cd $(TEMPDIR) && $(BIBTEX) $(MAIN) > /dev/null 2>&1 && \
		cd .. && $(LATEX) $(LATEXFLAGS) $(MAIN).tex > /dev/null 2>&1 && \
		$(LATEX) $(LATEXFLAGS) $(MAIN).tex > /dev/null 2>&1 && \
		echo "✓ Documento compila correctamente. Seguro para hacer commit." || \
		(echo "✗ ERROR: El documento NO compila. Corrige antes de hacer commit." && exit 1)

# --- Limpieza ---
clean:
	@echo "Limpiando archivos temporales..."
	@rm -rf $(TEMPDIR)
	@echo "✓ Temporales eliminados."

veryclean: clean
	@echo "Limpiando PDF de salida..."
	@rm -rf $(OUTDIR)
	@echo "✓ Todo limpio."

# --- Visualización ---
view: $(OUTDIR)/$(MAIN).pdf
	@if command -v xdg-open > /dev/null 2>&1; then \
		xdg-open $(OUTDIR)/$(MAIN).pdf; \
	elif command -v open > /dev/null 2>&1; then \
		open $(OUTDIR)/$(MAIN).pdf; \
	else \
		echo "Abre manualmente: $(OUTDIR)/$(MAIN).pdf"; \
	fi
