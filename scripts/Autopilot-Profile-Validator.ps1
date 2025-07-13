# scripts/Autopilot-Profile-Validator.ps1

$clientId     = "<Your-App-Client-ID>"
$tenantId     = "<Your-Tenant-ID>"
$clientSecret = "<Your-App-Client-Secret>"

$body = @{
    grant_type    = "client_credentials"
    scope         = "https://graph.microsoft.com/.default"
    client_id     = $clientId
    client_secret = $clientSecret
}
$token = Invoke-RestMethod -Uri "https://login.microsoftonline.com/$tenantId/oauth2/v2.0/token" -Method POST -Body $body
$headers = @{ Authorization = "Bearer $($token.access_token)" }

$uri = "https://graph.microsoft.com/v1.0/deviceManagement/windowsAutopilotDeviceIdentities"
$data = Invoke-RestMethod -Method GET -Uri $uri -Headers $headers

foreach ($device in $data.value) {
    if (-not $device.deploymentProfileAssigned) {
        Write-Warning "⚠️ No Autopilot profile assigned to: $($device.serialNumber)"
    } else {
        Write-Host "✅ Profile assigned: $($device.serialNumber)"
    }
}
