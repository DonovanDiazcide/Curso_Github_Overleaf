@echo off
REM ============================================================================
REM compilar.bat — Automatización de compilación LaTeX para Windows
REM
REM G&S Capítulo 2 (Automatización):
REM   Un solo comando ejecuta toda la cadena de compilación.
REM
REM Uso:
REM   compilar.bat          — Compila el documento completo
REM   compilar.bat check    — Verifica que compile (antes de git commit)
REM   compilar.bat clean    — Elimina archivos temporales
REM ============================================================================

set MAIN=main
set OUTDIR=output
set TEMPDIR=temp

REM Crear directorios si no existen
if not exist "%OUTDIR%" mkdir "%OUTDIR%"
if not exist "%TEMPDIR%" mkdir "%TEMPDIR%"

if "%1"=="check" goto :check
if "%1"=="clean" goto :clean

:compile
echo ==================================================
echo   Compilando documento...
echo ==================================================

pdflatex -output-directory=%TEMPDIR% -interaction=nonstopmode %MAIN%.tex
copy references.bib %TEMPDIR%\ >nul
cd %TEMPDIR% && bibtex %MAIN% && cd ..
pdflatex -output-directory=%TEMPDIR% -interaction=nonstopmode %MAIN%.tex
pdflatex -output-directory=%TEMPDIR% -interaction=nonstopmode %MAIN%.tex
copy %TEMPDIR%\%MAIN%.pdf %OUTDIR%\%MAIN%.pdf >nul

echo ==================================================
echo   PDF generado: %OUTDIR%\%MAIN%.pdf
echo ==================================================
goto :eof

:check
echo Verificando compilacion...
pdflatex -output-directory=%TEMPDIR% -interaction=nonstopmode %MAIN%.tex >nul 2>&1
copy references.bib %TEMPDIR%\ >nul 2>&1
cd %TEMPDIR% && bibtex %MAIN% >nul 2>&1 && cd ..
pdflatex -output-directory=%TEMPDIR% -interaction=nonstopmode %MAIN%.tex >nul 2>&1
pdflatex -output-directory=%TEMPDIR% -interaction=nonstopmode %MAIN%.tex >nul 2>&1
if %ERRORLEVEL%==0 (
    echo Documento compila correctamente. Seguro para hacer commit.
) else (
    echo ERROR: El documento NO compila. Corrige antes de hacer commit.
    exit /b 1
)
goto :eof

:clean
echo Limpiando archivos temporales...
if exist "%TEMPDIR%" rmdir /s /q "%TEMPDIR%"
echo Temporales eliminados.
goto :eof
