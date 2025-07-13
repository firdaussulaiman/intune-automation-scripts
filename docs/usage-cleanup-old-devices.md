# Cleanup-Old-Devices.ps1

This PowerShell script removes stale or inactive devices from Microsoft Intune using Graph API.

Useful for cleaning up devices that haven’t checked in for over 60 days, improving policy targeting and compliance reporting.

---

## 🔍 What It Checks

- Queries all devices from Intune.
- Filters those with `lastSyncDateTime` older than 60 days.
- Deletes the devices using the Graph API.

---

## 🛠 Usage Example

```powershell
.\Cleanup-Old-Devices.ps1
No parameters are required, but ensure your authentication section is correctly filled.

🔐 Requirements
App registration with these permissions:

Device.ReadWrite.All

Token authentication (via GraphAPI-Auth-Helper.ps1)

Script must run in elevated PowerShell session

✅ Example Output

🗑️ Deleting stale device: Win10-LabPC1 (b71d72ef-f33e-41c2)
🗑️ Deleting stale device: Class-Macbook02 (a91209de-e22e-4c0a)
⚠️ Notes
Devices deleted via this script are permanently removed from Intune.

Always test with a read-only query before running this in production.

You can modify the script to export a CSV report before deletion.

