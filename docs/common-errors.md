# Common Errors & Troubleshooting

This page lists frequent issues encountered when running the PowerShell automation scripts in this repository — along with possible fixes.

---

### ❌ 401 Unauthorized / Invalid Authentication

**Cause:**  
Access token expired or incorrect App Registration credentials.

**Fix:**  
- Verify `clientId`, `clientSecret`, and `tenantId`
- Re-generate a new secret in Azure Entra
- Ensure the app has `admin consent` granted

---

### ❌ The remote server returned an error: (403) Forbidden

**Cause:**  
Missing Graph API permissions.

**Fix:**  
- Go to Entra > App registrations > API permissions  
- Ensure required scopes like `User.ReadWrite.All`, `Device.ReadWrite.All`, etc. are added  
- Click "Grant admin consent"

---

### ❌ Cannot bind argument to parameter because it is null

**Cause:**  
The CSV file path provided was invalid or empty.

**Fix:**  
- Confirm CSV path is correct
- Ensure column names like `UserPrincipalName` are present and properly formatted

---

### ❌ The term 'Get-MpPreference' is not recognized

**Cause:**  
Script run on non-Windows system or Defender is not installed.

**Fix:**  
- Run `Defender-Baseline-Check.ps1` only on Windows
- Ensure Microsoft Defender Antivirus is present and active

---

### ❌ Device deletion failed with 404 Not Found

**Cause:**  
Device ID is no longer valid or already deleted.

**Fix:**  
- Use `GET https://graph.microsoft.com/v1.0/deviceManagement/managedDevices` to confirm device presence before deletion.

---

### 🧠 Tip: Enable Verbose Logging

You can add this to any script for debugging:
```powershell
$DebugPreference = "Continue"
