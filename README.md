# intune-automation-scripts
cloud-device-management-automation
# Intune Automation Scripts

A collection of PowerShell scripts and Microsoft Graph API automation tools used for managing cloud-based endpoints with Microsoft Intune and Azure Active Directory.

These scripts are designed to improve efficiency, enforce security compliance, and automate common IT tasks across Windows and macOS environments — especially useful in enterprise and education settings.

---

## 📂 Included Scripts

| Script | Description |
|--------|-------------|
| **Reset-Bulk-Passwords.ps1** | Reset passwords for multiple users using Microsoft Graph API |
| **Cleanup-Old-Devices.ps1** | Remove stale devices (not checked in for 60+ days) from Intune |
| **Autopilot-Profile-Validator.ps1** | Validates and audits assigned Autopilot deployment profiles |
| **Defender-Baseline-Check.ps1** | Checks Microsoft Defender Antivirus settings via PowerShell |
| **GraphAPI-Auth-Helper.ps1** | Generic module to authenticate to Microsoft Graph API using app registration |

---

## ⚙️ Prerequisites

- PowerShell 5.1+ or PowerShell Core
- Microsoft Entra (Azure AD) App Registration:
  - Client ID
  - Tenant ID
  - Client Secret
- Permissions: `Device.ReadWrite.All`, `User.ReadWrite.All`, `Directory.AccessAsUser.All`, etc.
- Admin consent granted to your app registration

---

## 🚀 How to Use

1. Clone or download this repository:
   ```bash
   git clone https://github.com/firdaussulaiman/intune-automation-scripts.git
