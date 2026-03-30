$ErrorActionPreference = "Stop"

$repoRoot = Resolve-Path (Join-Path $PSScriptRoot "..")
$outputZip = Join-Path $repoRoot "curso-con-capturas.zip"
$staging = Join-Path $env:TEMP ("curso-con-capturas-" + [Guid]::NewGuid().ToString("N"))

$includeItems = @(
    "README.md",
    "guia-rapida.md",
    "00-instalacion",
    "01-conceptos",
    "02-configuracion-inicial",
    "03-flujo-basico",
    "04_ramas_y_conflictos",
    "05-practica-libre",
    "articulo-prueba",
    "plantilla-articulo",
    "recursos",
    "CodeAndData.pdf",
    "CodeAndData-1.pdf"
)

$excludeFilePatterns = @(
    "*.aux",
    "*.log",
    "*.out",
    "*.bbl",
    "*.blg",
    "*.fdb_latexmk",
    "*.fls",
    "*.synctex.gz",
    "*.zip"
)

New-Item -ItemType Directory -Force -Path $staging | Out-Null

foreach ($item in $includeItems) {
    $sourcePath = Join-Path $repoRoot $item
    $destinationPath = Join-Path $staging $item

    if (-not (Test-Path $sourcePath)) {
        Write-Warning "No existe y se omite: $item"
        continue
    }

    if (Test-Path $sourcePath -PathType Container) {
        Copy-Item -Path $sourcePath -Destination $destinationPath -Recurse -Force
    } else {
        $parent = Split-Path -Path $destinationPath -Parent
        New-Item -ItemType Directory -Force -Path $parent | Out-Null
        Copy-Item -Path $sourcePath -Destination $destinationPath -Force
    }
}

Get-ChildItem -Path $staging -Recurse -Directory -Filter ".vscode" | ForEach-Object {
    Remove-Item -Path $_.FullName -Recurse -Force
}

foreach ($pattern in $excludeFilePatterns) {
    Get-ChildItem -Path $staging -Recurse -File -Filter $pattern | ForEach-Object {
        Remove-Item -Path $_.FullName -Force
    }
}

if (Test-Path $outputZip) {
    Remove-Item -Path $outputZip -Force
}

Compress-Archive -Path (Join-Path $staging "*") -DestinationPath $outputZip -Force

$fileCount = (Get-ChildItem -Path $staging -Recurse -File).Count
$zipSizeMb = [Math]::Round(((Get-Item $outputZip).Length / 1MB), 2)

Write-Host "ZIP generado: $outputZip"
Write-Host "Archivos incluidos: $fileCount"
Write-Host "Tamano ZIP (MB): $zipSizeMb"

Remove-Item -Path $staging -Recurse -Force
