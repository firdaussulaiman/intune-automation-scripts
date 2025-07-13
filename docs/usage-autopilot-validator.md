# Autopilot-Profile-Validator.ps1

This script checks all registered Windows Autopilot devices and reports whether they have an assigned deployment profile.

It helps prevent ESP hangs or enrollment errors due to missing profiles during large-scale Autopilot deployments.

---

## ⚙️ What It Does

- Queries `windowsAutopilotDeviceIdentities` from Microsoft Graph
- Checks the `deploymentProfileAssigned` flag for each device
- Logs serial numbers of devices without a profile

---

## 🛠 Usage Example

```powershell
.\Autopilot-Profile-Validator.ps1

✅ Example Output

✅ Profile assigned: 7CB1234XYZ
⚠️ No Autopilot profile assigned to: 5D9012WXYZ
🔐 Requirements
App registration with:

WindowsAutopilotDevice.ReadWrite.All permission

PowerShell authentication to Microsoft Graph (see setup.md)

💡 Notes
This is a read-only script, safe to use in production.

You can export the list of non-compliant devices using Export-Csv.

# Optional export example
$nonCompliant | Export-Csv -Path "missing-profiles.csv" -NoTypeInformation
For automation, consider scheduling this as a weekly check.
