# scripts/Reset-Bulk-Passwords.ps1

param (
    [Parameter(Mandatory=$true)]
    [string]$CSVPath
)

# Azure AD App credentials
$clientId     = "<Your-App-Client-ID>"
$tenantId     = "<Your-Tenant-ID>"
$clientSecret = "<Your-App-Client-Secret>"

# Get access token
$body = @{
    grant_type    = "client_credentials"
    scope         = "https://graph.microsoft.com/.default"
    client_id     = $clientId
    client_secret = $clientSecret
}
$token = Invoke-RestMethod -Uri "https://login.microsoftonline.com/$tenantId/oauth2/v2.0/token" -Method POST -Body $body
$headers = @{ Authorization = "Bearer $($token.access_token)" }

# Load CSV of user emails
$users = Import-Csv $CSVPath

foreach ($user in $users) {
    $uri = "https://graph.microsoft.com/v1.0/users/$($user.UserPrincipalName)"
    $body = @{
        passwordProfile = @{
            forceChangePasswordNextSignIn = $true
            password = "P@ssword2025!"
        }
        accountEnabled = $true
    } | ConvertTo-Json -Depth 10

    try {
        Invoke-RestMethod -Uri $uri -Headers $headers -Method PATCH -Body $body -ContentType "application/json"
        Write-Host "✅ Password reset for $($user.UserPrincipalName)"
    } catch {
        Write-Warning "❌ Failed for $($user.UserPrincipalName): $_"
    }
}
