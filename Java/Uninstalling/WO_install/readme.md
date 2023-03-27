
# JRE Installer and Remover

This PowerShell script verifies if the JRE is installed on the local machine and displays a message indicating if it is present or not. If the JRE is installed, it checks the version and displays it. It then checks for any JRE versions older than 8.0.3610.9 and removes them.

## Usage

1.  Open PowerShell as an administrator.
2.  Navigate to the directory where the script is located.
3.  Run the script using the command `.\jre-remover.ps1`.

## Exit Codes

-   `0`: The script completed successfully.
-   `1`: The script encountered an error while removing an old JRE version.

## Dependencies

-   The script uses the `Get-ItemProperty` cmdlet to check for the presence of the JRE and to get the JRE version.
-   The script uses the `Get-ChildItem` cmdlet to get a list of JRE versions installed on the local machine.
-   The script uses the `Start-Process` cmdlet to remove old JRE versions.
