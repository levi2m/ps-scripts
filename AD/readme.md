
# 📝 Script Description

This PowerShell script performs the following tasks:

1.  🔍 Searches for the SCCM server and looks for the most recent updates released to Windows Server 2012 R2, 2016, and 2019.
2.  🔑 Asks for credentials to connect to every server on the server list inside the AD DC.
3.  🔍 Validates the last update installed on every server that connects.
4.  📄 Creates a text file, formatted as a table, with all the information gathered, including the server name, date of last update, and name of the update package.

## 🚀 How to Use

1.  Modify the `$SCCMServer` variable with the name of your SCCM server.
2.  Replace "ABC" in the `Get-CMSoftwareUpdate` cmdlet with your SCCM site code.
3.  Change the file path in the `Out-File` cmdlet to a path that's appropriate for your environment.
4.  Run the script on the AD DC server.

## 🛠️ Requirements

-   Active Directory PowerShell module installed
-   SCCM PowerShell module installed

## 📝 Notes

-   This script was designed to work with Windows Server 2012 R2, 2016, and 2019, but can be modified to work with other versions of Windows Server.
-   The script may take some time to run, depending on the number of servers and the amount of data being gathered.
-   The script may produce errors if it's unable to connect to a server or if the required PowerShell modules are not installed on the AD DC server.

Feel free to modify and use this script in your environment as needed!
