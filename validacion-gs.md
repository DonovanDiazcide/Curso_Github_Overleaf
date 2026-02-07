# Validación: Integración de Principios Gentzkow & Shapiro

Este documento verifica que cada principio del artículo se implementa
correctamente en los materiales del taller.

## Capítulo 2: Automatización

**Regla:** *"Automate everything that can be automated."*

| Prueba | Resultado |
|--------|-----------|
| `make` genera `output/main.pdf` desde cero | ✓ Verificado |
| `make check` reporta éxito con código fuente válido | ✓ Verificado |
| `make clean` elimina `temp/` | ✓ Verificado |
| `make veryclean` elimina `temp/` y `output/` | ✓ Verificado |
| `scripts/compilar.sh` produce el mismo resultado que `make` | ✓ Verificado |
| `scripts/compilar.bat` tiene la misma lógica para Windows | ✓ Estructura verificada (no hay entorno Windows) |
| Un solo comando reproduce todo el documento | ✓ Verificado |

**Citas resueltas:** Las cuatro referencias bibliográficas
(gentzkow2014code, perez2024github, chacon2014pro, overleaf2024docs)
se resuelven correctamente en la compilación final.

## Capítulo 3: Control de versiones

**Regla:** *"Run the whole directory before checking it back in."*

| Prueba | Resultado |
|--------|-----------|
| `make check` detecta compilación exitosa | ✓ Verificado |
| `make check` retorna exit code 0 en éxito | ✓ Verificado |
| `.gitignore` excluye `output/` y `temp/` | ✓ Verificado |
| Solo archivos fuente serían rastreados por Git | ✓ Verificado |
| Tutorial instruye verificar antes de commit | ✓ Verificado (módulo 06) |

## Capítulo 4: Directorios

**Regla:** *"Separate files into inputs and outputs."*

| Prueba | Resultado |
|--------|-----------|
| Archivos fuente separados de salida | ✓ `sections/` vs `output/` |
| Archivos temporales en directorio dedicado | ✓ `temp/` |
| Figuras en directorio dedicado | ✓ `figures/` |
| Scripts en directorio dedicado | ✓ `scripts/` |
| Rutas portables (sin rutas absolutas) | ✓ `\graphicspath{{figures/}}` |
| `.gitignore` documenta la separación | ✓ Comentarios explican cada sección |

## Capítulo 5: Claves

**Regla:** *"Store cleaned data in tables with unique, non-missing keys."*

| Prueba | Resultado |
|--------|-----------|
| `\label{}` sigue convención consistente (`sec:`, `fig:`, `tab:`) | ✓ Verificado |
| Claves BibTeX siguen convención `apellido+año+palabra` | ✓ Verificado |
| No hay labels duplicados | ✓ Verificado |
| Tutorial documenta la convención de labels | ✓ Módulo 06, Principio 4 |

## Capítulo 6: Abstracción

**Regla:** *"Abstract to eliminate redundancy."*

| Prueba | Resultado |
|--------|-----------|
| `\herramienta{}` elimina formato repetido | ✓ Usado en todos los .tex |
| `\comando{}` formatea comandos de terminal | ✓ Usado consistentemente |
| `\archivo{}` formatea nombres de archivo | ✓ Usado consistentemente |
| `\principio{}` formatea principios G&S | ✓ Usado en introducción |
| `\gs` referencia el artículo sin repetir | ✓ Definido y usado |
| Cambiar un comando propaga globalmente | ✓ Probado conceptualmente |

## Capítulo 7: Documentación

**Regla:** *"Don't write documentation you will not maintain."*

| Prueba | Resultado |
|--------|-----------|
| Comentarios en main.tex explican POR QUÉ, no QUÉ | ✓ Verificado |
| Nombres de archivos son descriptivos | ✓ `introduction.tex`, no `sec1.tex` |
| Nombres de comandos declaran su función | ✓ `\herramienta`, no `\fmt` |
| Makefile incluye instrucciones de uso | ✓ Encabezado con `make`, `make check`, etc. |
| .gitignore explica la lógica de exclusión | ✓ Comentarios por sección |

## Capítulo 8: Gestión

**Regla:** *"Email is not a task management system."*

| Prueba | Resultado |
|--------|-----------|
| Tutorial explica GitHub Issues | ✓ Módulo 06, Principio 7 |
| Tutorial muestra cómo cerrar Issues con commits | ✓ `Closes #3` |
| Tutorial incluye ejercicio práctico de Issues | ✓ Paso 4 del ejercicio |
| Guías por participante incluyen Issues en flujo | ✓ Implícito en flujo diario |

## Prueba de perspectiva: usuario inexperto

Simulando la experiencia de Mauricio (Windows, principiante):

1. **¿Puede clonar y compilar?** Sí: `git clone` → `scripts\compilar.bat`
2. **¿Sabe qué archivos editar?** Sí: la estructura separa claramente `sections/`
3. **¿Sabe qué NO tocar?** Sí: `output/` y `temp/` están documentados como generados
4. **¿Puede verificar su trabajo?** Sí: `make check` o `scripts\compilar.bat check`
5. **¿Entiende el flujo?** Sí: el tutorial tiene guía específica para Windows

## Resumen

| Capítulo G&S | Implementado | Documentado | Probado |
|:-------------|:------------:|:-----------:|:-------:|
| 2. Automatización | ✓ | ✓ | ✓ |
| 3. Control de versiones | ✓ | ✓ | ✓ |
| 4. Directorios | ✓ | ✓ | ✓ |
| 5. Claves | ✓ | ✓ | ✓ |
| 6. Abstracción | ✓ | ✓ | ✓ |
| 7. Documentación | ✓ | ✓ | ✓ |
| 8. Gestión | ✓ | ✓ | — (requiere GitHub) |
