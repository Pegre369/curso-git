<#
.SYNOPSIS
    Copia un repositorio Git a otro con todo su historial, ramas y tags.

.DESCRIPTION
    1. Clona el repositorio origen en modo "bare" en una carpeta temporal.
    2. Sube todas las ramas y tags al destino con "git push --mirror".
    3. (Opcional) Migra los archivos de Git LFS.
    4. Verifica que las ramas y tags del destino coincidan con las del origen.
    5. Borra la carpeta temporal.

    El repositorio destino debe existir y estar VACÍO (sin README, .gitignore ni licencia).

.PARAMETER Origen
    URL del repositorio a copiar.

.PARAMETER Destino
    URL del repositorio nuevo (vacío).

.PARAMETER ConLfs
    Incluye los archivos almacenados con Git LFS.

.EXAMPLE
    .\migrar-repo.ps1 -Origen https://github.com/usuario/repo-viejo.git -Destino https://github.com/empresa/repo-nuevo.git

.EXAMPLE
    .\migrar-repo.ps1 -Origen https://gitlab.com/usuario/repo.git -Destino https://github.com/empresa/repo.git -ConLfs
#>
param(
    [Parameter(Mandatory = $true)][string]$Origen,
    [Parameter(Mandatory = $true)][string]$Destino,
    [switch]$ConLfs
)

$ErrorActionPreference = 'Stop'

function Invoke-Git {
    param([string[]]$Argumentos)
    & git @Argumentos
    if ($LASTEXITCODE -ne 0) {
        throw "Falló el comando: git $($Argumentos -join ' ')"
    }
}

function Get-Referencias {
    param([string]$Url)
    $salida = & git ls-remote --heads --tags $Url
    if ($LASTEXITCODE -ne 0) { throw "No se pudo leer el repositorio $Url" }
    return @($salida | Sort-Object)
}

if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
    throw 'Git no está instalado. Consulta docs/02-instalacion.md.'
}

$temporal = Join-Path $env:TEMP ('migracion-' + [guid]::NewGuid().ToString('N').Substring(0, 8))

Write-Host "`n==> Clonando $Origen" -ForegroundColor Cyan
Invoke-Git @('clone', '--bare', $Origen, $temporal)

Push-Location $temporal
try {
    if ($ConLfs) {
        Write-Host "`n==> Descargando archivos LFS" -ForegroundColor Cyan
        Invoke-Git @('lfs', 'fetch', '--all')
    }

    Write-Host "`n==> Subiendo historial, ramas y tags a $Destino" -ForegroundColor Cyan
    Invoke-Git @('push', '--mirror', $Destino)

    if ($ConLfs) {
        Write-Host "`n==> Subiendo archivos LFS" -ForegroundColor Cyan
        Invoke-Git @('lfs', 'push', '--all', $Destino)
    }
}
finally {
    Pop-Location
}

Write-Host "`n==> Verificando" -ForegroundColor Cyan
$refsOrigen = Get-Referencias $Origen
$refsDestino = Get-Referencias $Destino
$diferencias = Compare-Object $refsOrigen $refsDestino

Remove-Item -Recurse -Force $temporal

if ($diferencias) {
    Write-Host 'ATENCIÓN: el destino no coincide con el origen. Diferencias:' -ForegroundColor Yellow
    $diferencias | ForEach-Object {
        $lado = if ($_.SideIndicator -eq '<=') { 'solo en origen ' } else { 'solo en destino' }
        Write-Host "  [$lado] $($_.InputObject)"
    }
    exit 1
}

$ramas = @($refsOrigen | Where-Object { $_ -match 'refs/heads/' }).Count
$tags = @($refsOrigen | Where-Object { $_ -match 'refs/tags/' -and $_ -notmatch '\^\{\}$' }).Count
Write-Host "`nMigración completa y verificada: $ramas rama(s) y $tags tag(s)." -ForegroundColor Green
Write-Host 'Siguientes pasos: docs/06-migracion.md, sección "Después de migrar".'
