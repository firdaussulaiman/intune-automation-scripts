# Initial Setup Instructions

Before running any of the automation scripts in this repo, ensure the following setup is completed:

---

## 1. Register an Azure AD Application

1. Go to [Microsoft Entra Admin Center](https://entra.microsoft.com)
2. Navigate to **App registrations** > **New registration**
3. Name: `GraphAutomationApp`
4. Supported account types: Single tenant
5. Redirect URI: Leave blank

---

## 2. Create a Client Secret

1. Under the App you created, go to **Certificates & secrets**
2. Click **New client secret**
3. Set an expiry (e.g. 24 months)
4. Copy and store the value safely — **this is your `clientSecret`**

---

## 3. Assign Required API Permissions

Under **API permissions**, add the following delegated or application permissions:

- `Device.ReadWrite.All`
- `User.ReadWrite.All`
- `Directory.AccessAsUser.All`
- `WindowsAutopilotDevice.ReadWrite.All` (for Autopilot script)
- Click **Grant admin consent** after assigning

---

## 4. Store Credentials in Your Script

```powershell
$clientId     = "<Your-App-Client-ID>"
$tenantId     = "<Your-Tenant-ID>"
$clientSecret = "<Your-Secret-Here>"
