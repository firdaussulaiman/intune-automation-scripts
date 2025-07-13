# Defender-Baseline-Check.ps1

This script audits the local Microsoft Defender Antivirus settings on a Windows device.

Useful for checking if Defender is properly configured as per security baselines in enterprise or education environments.

---

## ⚙️ What It Reports

- Realtime monitoring status
- MAPS (Cloud Protection) reporting level
- Sample submission consent level
- Exclusion paths
- Signature update interval

---

## 🛠 Usage Example

```powershell
.\Defender-Baseline-Check.ps1
✅ Example Output
plaintext
Copy
Edit
RealtimeMonitoring     : True
CloudProtection        : Advanced
SampleSubmission       : AlwaysPrompt
ExclusionPaths         : C:\ProgramData\SafePath
SignatureUpdateInterval: 1
🔐 Requirements
Must be run on a Windows machine

PowerShell 5.1 or later

Microsoft Defender Antivirus must be installed and active

💡 Notes
This script does not modify any settings — it is read-only.

You can extend this to export results to a CSV or HTML report.

For compliance integration, pair this script with Power Automate or Intune Proactive Remediations.
