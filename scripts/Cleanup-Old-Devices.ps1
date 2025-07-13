# scripts/Cleanup-Old-Devices.ps1

$clientId     = "<Your-App-Client-ID>"
$tenantId     = "<Your-Tenant-ID>"
$clientSecret = "<Your-App-Client-Secret>"

$body = @{
    grant_type    = "client_credentials"
    scope         = "https://graph.microsoft.com/.default"
    client_id     = $clientId
    client_secret = $clientSecret
}
$tokenResp = Invoke-RestMethod -Method Post -Uri "https://login.microsoftonline.com/$tenantId/oauth2/v2.0/token" -Body $body
$headers = @{ Authorization = "Bearer $($tokenResp.access_token)" }

$uri = "https://graph.microsoft.com/v1.0/deviceManagement/managedDevices"
$devices = Invoke-RestMethod -Uri $uri -Headers $headers -Method GET

foreach ($device in $devices.value) {
    $lastSync = [datetime]$device.lastSyncDateTime
    if ($lastSync -lt (Get-Date).AddDays(-60)) {
        Write-Host "🗑️ Deleting stale device: $($device.deviceName) ($($device.id))"
        Invoke-RestMethod -Uri "$uri/$($device.id)" -Method DELETE -Headers $headers
    }
}
