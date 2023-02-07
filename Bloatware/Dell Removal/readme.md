# Dell Software Removal Script

This PowerShell script is designed to remove all Dell software installed on a local machine, with the exception of Dell SupportAssist, which can only be reinstalled by an administrator user. Non-admin users will not be able to install Dell SupportAssist on the machine.

## Requirements

-   Windows operating system
-   PowerShell installed

## Usage

1.  Download the script file.
2.  Right-click the script file and select "Run with PowerShell".
3.  The script will remove all Dell software except for Dell SupportAssist.
4.  If the current user is not an administrator, Dell SupportAssist will be uninstalled as well.

## Note

Please note that this script is provided as is, without any warranties or guarantees. Use it at your own risk and make sure to backup your data before running the script.
