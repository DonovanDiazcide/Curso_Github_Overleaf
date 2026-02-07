#!/bin/bash
# ============================================================================
# compilar.sh — Automatización de compilación LaTeX para Mac/Linux
#
# G&S Capítulo 2 (Automatización):
#   Un solo comando ejecuta toda la cadena de compilación.
#
# Uso:
#   ./compilar.sh          — Compila el documento completo
#   ./compilar.sh check    — Verifica que compile (antes de git commit)
#   ./compilar.sh clean    — Elimina archivos temporales
# ============================================================================

MAIN="main"
OUTDIR="output"
TEMPDIR="temp"

# Crear directorios si no existen
mkdir -p "$OUTDIR" "$TEMPDIR"

case "$1" in
    check)
        echo "Verificando compilación..."
        pdflatex -output-directory="$TEMPDIR" -interaction=nonstopmode "$MAIN.tex" > /dev/null 2>&1 && \
        cp references.bib "$TEMPDIR/" && \
        cd "$TEMPDIR" && bibtex "$MAIN" > /dev/null 2>&1 && cd .. && \
        pdflatex -output-directory="$TEMPDIR" -interaction=nonstopmode "$MAIN.tex" > /dev/null 2>&1 && \
        pdflatex -output-directory="$TEMPDIR" -interaction=nonstopmode "$MAIN.tex" > /dev/null 2>&1 && \
        echo "✓ Documento compila correctamente. Seguro para hacer commit." || \
        { echo "✗ ERROR: El documento NO compila. Corrige antes de hacer commit."; exit 1; }
        ;;
    clean)
        echo "Limpiando archivos temporales..."
        rm -rf "$TEMPDIR"
        echo "✓ Temporales eliminados."
        ;;
    *)
        echo "══════════════════════════════════════════"
        echo "  Compilando documento..."
        echo "══════════════════════════════════════════"
        pdflatex -output-directory="$TEMPDIR" -interaction=nonstopmode "$MAIN.tex"
        cp references.bib "$TEMPDIR/"
        cd "$TEMPDIR" && bibtex "$MAIN" && cd ..
        pdflatex -output-directory="$TEMPDIR" -interaction=nonstopmode "$MAIN.tex"
        pdflatex -output-directory="$TEMPDIR" -interaction=nonstopmode "$MAIN.tex"
        cp "$TEMPDIR/$MAIN.pdf" "$OUTDIR/$MAIN.pdf"
        echo "══════════════════════════════════════════"
        echo "  ✓ PDF generado: $OUTDIR/$MAIN.pdf"
        echo "══════════════════════════════════════════"
        ;;
esac
