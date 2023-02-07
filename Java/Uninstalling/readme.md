# Java Uninstallation Script

## Description

This script is designed to uninstall all Java runtime environments on a local machine except for the most recently installed Java runtime environment. The script performs the following tasks:

1.  Retrieves the list of all installed Java runtime environments in the registry.
2.  Filters the list based on display name.
3.  Sorts the list in descending order of the installation date.
4.  Sets the first item in the sorted list to the $lastJava variable.
5.  Uninstalls each Java runtime environment except for the $lastJava using the quiet switch /quiet to run the uninstall process without user interaction.

## Requirements

-   Windows operating system
-   PowerShell installed

## Usage

1.  Download the script file.
2.  Right-click the script file and select "Run with PowerShell".
3.  The script will uninstall all Java runtime environments except for the most recently installed Java runtime environment.

## Note

Please note that this script is provided as is, without any warranties or guarantees. Use it at your own risk and make sure to backup your data before running the script.
