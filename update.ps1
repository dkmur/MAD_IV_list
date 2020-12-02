param(
    [String] [Alias("c")] $Config,
    [Parameter(Position=0)] [String] $IVList
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

if ([String]::IsNullOrEmpty($Config)) {
    $Config = $PSScriptRoot + "\config"
}

$Config = (Resolve-Path $Config)
if (!(Test-Path -PathType Leaf $Config)) {
    Write-Error -Category ObjectNotFound "Config file $Config doesn't exist."
    exit 1
}

if ([String]::IsNullOrEmpty($IVList)) {
    $IVList = Get-ChildItem -File ".\ivlist_*" | Sort-Object -Desc Name | Select-Object -First 1
    if ($IVList -eq $null) {
        Write-Error -Category ObjectNotFound "No IV list file found."
        exit 1
    }
}

$IVList = (Resolve-Path $IVList)
if (!(Test-Path -PathType Leaf $IVList)) {
    Write-Error -Category ObjectNotFound "IV list file $IVList doesn't exist."
    exit 1
}

Write-Host "Using config file $Config";
Write-Host "Using IV list file $IVList";

$ConfigTable = (Get-Content -Raw $Config | ConvertFrom-StringData)

$Password = ConvertTo-SecureString $ConfigTable["PASSWORD"] -AsPlainText -Force
$Credential = New-Object System.Management.Automation.PSCredential ($ConfigTable["USERNAME"], $Password)

Invoke-RestMethod `
    -UseBasicParsing `
    -Credential $Credential `
    -ContentType "application/json" `
    -Method Patch `
    -Headers @{ "X-Beautify" = "1"; "Accept" = "application/json" } `
    -Body (Get-Content -Raw $IVList) `
    -Uri "$($ConfigTable['MAD_URL'])/api/monivlist/$($ConfigTable['IV_LIST_ID'])"

Write-Host "IV list updated"
