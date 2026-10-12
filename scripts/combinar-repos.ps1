<#
.SYNOPSIS
    Junta varios repositorios en uno solo, cada uno en su propia carpeta y con su historial.

.DESCRIPTION
    Lee un archivo CSV con las columnas: carpeta,url,rama
    y ejecuta "git subtree add" para cada proyecto dentro del repositorio indicado.

    Requisitos:
    - El repositorio destino ya está clonado en tu computadora y tiene al menos un commit
      (créalo en GitHub marcando "Add a README file" y clónalo).
    - No hay cambios sin guardar en el repositorio destino.

.PARAMETER Repositorio
    Ruta de la carpeta local del repositorio destino.

.PARAMETER Csv
    Ruta del archivo CSV con la lista de proyectos (ver proyectos-ejemplo.csv).

.PARAMETER Subir
    Hace "git push" al terminar.

.EXAMPLE
    .\combinar-repos.ps1 -Repositorio C:\Proyectos\repo-nuevo -Csv .\proyectos.csv -Subir
#>
param(
    [Parameter(Mandatory = $true)][string]$Repositorio,
    [Parameter(Mandatory = $true)][string]$Csv,
    [switch]$Subir
)

$ErrorActionPreference = 'Stop'

function Invoke-Git {
    param([string[]]$Argumentos)
    # Git escribe su progreso en stderr; se muestra como texto para que
    # PowerShell 5.1 no lo trate como error y detenga el script.
    $ErrorActionPreference = 'Continue'
    & git @Argumentos 2>&1 | ForEach-Object { Write-Host "$_" }
    if ($LASTEXITCODE -ne 0) {
        throw "Falló el comando: git $($Argumentos -join ' ')"
    }
}

$proyectos = @(Import-Csv -Path (Resolve-Path $Csv))
if ($proyectos.Count -eq 0) { throw "El archivo $Csv no contiene proyectos." }

Push-Location (Resolve-Path $Repositorio)
try {
    if (& git status --porcelain) {
        throw 'El repositorio destino tiene cambios sin guardar. Haz commit o descártalos antes de continuar.'
    }

    foreach ($p in $proyectos) {
        if (-not $p.carpeta -or -not $p.url -or -not $p.rama) {
            throw "Fila incompleta en el CSV: $($p | Out-String)"
        }
        if (Test-Path $p.carpeta) {
            Write-Host "Se omite '$($p.carpeta)': la carpeta ya existe." -ForegroundColor Yellow
            continue
        }
        Write-Host "`n==> Importando $($p.url) ($($p.rama)) en '$($p.carpeta)'" -ForegroundColor Cyan
        Invoke-Git @('subtree', 'add', "--prefix=$($p.carpeta)", $p.url, $p.rama,
                     '-m', "Integra $($p.carpeta) con su historial desde $($p.url)")
    }

    if ($Subir) {
        Write-Host "`n==> Subiendo a GitHub" -ForegroundColor Cyan
        Invoke-Git @('push')
    }
}
finally {
    Pop-Location
}

Write-Host "`nListo. Revisa el resultado con: git log --oneline --graph" -ForegroundColor Green
if (-not $Subir) { Write-Host 'Cuando estés conforme, ejecuta "git push" para subirlo.' }
