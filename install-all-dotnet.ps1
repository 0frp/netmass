[CmdletBinding()]
param(
    [switch]$IncludePreviewChannels,
    [switch]$InstallAspNetRuntime,
    [switch]$InstallDotnetRuntime,
    [switch]$SkipSdk,
    [switch]$Quiet
)

$ErrorActionPreference = 'Stop'
$ProgressPreference = 'SilentlyContinue'

$ScriptRoot = Split-Path -Parent $MyInvocation.MyCommand.Path
$DotnetInstallScript = Join-Path $ScriptRoot 'dotnet-install.ps1'
$ReleaseIndexUrl = 'https://dotnetcli.blob.core.windows.net/dotnet/release-metadata/releases-index.json'

function Write-Status {
    param([string]$Message)

    if (-not $Quiet) {
        Write-Host $Message
    }
}

if (-not (Test-Path -Path $DotnetInstallScript)) {
    Write-Status 'Downloading dotnet-install.ps1...'
    Invoke-WebRequest -Uri 'https://dot.net/v1/dotnet-install.ps1' -OutFile $DotnetInstallScript
}

Write-Status 'Loading .NET release channel metadata...'
$releaseIndex = Invoke-RestMethod -Uri $ReleaseIndexUrl

$channels = $releaseIndex.'releases-index' |
    Sort-Object -Property @{ Expression = { [int]($_.'channel-version'.Split('.')[0]) } } -Descending

if (-not $IncludePreviewChannels) {
    $channels = $channels | Where-Object { -not $_.'support-phase'.ToLowerInvariant().Contains('preview') }
}

if (-not $channels) {
    throw 'No .NET channels were discovered from release metadata.'
}

$channelNames = $channels | ForEach-Object { $_.'channel-version' }
Write-Status ("Channels selected: {0}" -f ($channelNames -join ', '))

foreach ($channel in $channels) {
    $channelVersion = $channel.'channel-version'

    if (-not $SkipSdk) {
        Write-Status "Installing SDK for channel $channelVersion..."
        & $DotnetInstallScript -Channel $channelVersion -Quality GA
    }

    if ($InstallAspNetRuntime) {
        Write-Status "Installing ASP.NET Core Runtime for channel $channelVersion..."
        & $DotnetInstallScript -Channel $channelVersion -Quality GA -Runtime aspnetcore
    }

    if ($InstallDotnetRuntime) {
        Write-Status "Installing .NET Runtime for channel $channelVersion..."
        & $DotnetInstallScript -Channel $channelVersion -Quality GA -Runtime dotnet
    }
}

Write-Status 'Installation complete.'

if (Get-Command dotnet -ErrorAction SilentlyContinue) {
    Write-Status 'Installed SDKs:'
    & dotnet --list-sdks
}
