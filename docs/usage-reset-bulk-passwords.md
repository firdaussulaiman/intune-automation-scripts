
# Reset-Bulk-Passwords.ps1

This PowerShell script resets passwords for a list of Azure AD users using Microsoft Graph API.

It is ideal for bulk password resets in education or enterprise environments.

---

## 🧾 Input Format

Prepare a CSV file like this:

```csv
UserPrincipalName
john.doe@domain.com
jane.lee@domain.com
🛠 Usage Example
powershell
Copy
Edit
.\Reset-Bulk-Passwords.ps1 -CSVPath ".\users.csv"
⚙️ What It Does
Connects to Microsoft Graph API using App Registration credentials.

Iterates through a list of users and resets their password.

Forces password change on next login.

Logs output to the console.

🔐 Requirements
App registration with the following permissions:

User.ReadWrite.All

Token authentication script (GraphAPI-Auth-Helper.ps1)

CSV file with user UPNs

📌 Notes
Default password is hardcoded as P@ssword2025! (can be randomized or pulled from a secure source).

You can combine this with Microsoft Secure Score by logging actions.

✅ Example Output
pgsql
Copy
Edit
✅ Password reset for john.doe@domain.com
✅ Password reset for jane.lee@domain.com
sql
Copy
Edit

5. Scroll down and **commit** with a message like:
