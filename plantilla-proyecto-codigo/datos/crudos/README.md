# Datos Crudos

> ⚠️ **REGLA FUNDAMENTAL**: Los archivos en esta carpeta **NUNCA se modifican directamente**.

Toda limpieza y transformación de datos se hace a través de los scripts en `codigo/`.

## Diccionario de datos

> Documenta aquí cada archivo de datos y sus variables.

### Ejemplo: `encuesta_2024.csv`

| Variable | Tipo | Descripción | Valores posibles |
|----------|------|-------------|------------------|
| `participante_id` | texto | Identificador único del participante | P001, P002, ... |
| `sesion_id` | texto | Identificador de la sesión experimental | S01, S02, ... |
| `edad` | entero | Edad del participante en años | 18–99 |
| `genero` | texto | Género reportado | M, F, Otro |
| `respuesta_q1` | entero | Respuesta a la pregunta 1 | 1–5 (Likert) |

### Origen de los datos

| Archivo | Fuente | Fecha de obtención | Notas |
|---------|--------|-------------------|-------|
| *(nombre del archivo)* | *(de dónde vino)* | *(cuándo se descargó/recopiló)* | *(notas relevantes)* |
