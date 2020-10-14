param (
    [Parameter(Mandatory=$true, Position=0)]
    [string]$TestName,
    [string]$Channel = "$env:HAB_BLDR_CHANNEL",
    [string]$BuilderUrl = $env:HAB_BLDR_URL
)


Write-Host "Channel = $Channel"
Write-Host "TestName = $TestName"
Write-Host "BuilderUrl = $BuilderUrl"

. .expeditor/scripts/shared.ps1
. .expeditor/scripts/end_to_end/setup_environment.ps1 $Channel $BuilderUrl
Invoke-NativeCommand pwsh .expeditor/scripts/end_to_end/run_e2e_test_core.ps1 $TestName $BuilderUrl
