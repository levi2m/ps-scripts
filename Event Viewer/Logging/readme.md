# Winlogon Error Event Logging Script

This script retrieves all error events from the "Winlogon" log in the Windows Event Viewer and writes the events that contain the word "error" to a log file located at `C:\WinlogonErrors.log`. The script will exit after 30 seconds, regardless of whether all events have been processed.

## Requirements

-   Windows operating system with PowerShell installed
-   Access to the Windows Event Viewer

## Usage

1.  Open a PowerShell window with administrative privileges
2.  Copy the script into the PowerShell window
3.  Press `Enter` to run the script

## Output

The script will output the following information for each event that contains the word "error":

-   Event ID
-   Time generated
-   Message

The output will be written to the log file located at `C:\WinlogonErrors.log`. If the script times out after 30 seconds, a message indicating that the script has timed out will be written to the log file.

## Limitations

-   The script only retrieves events from the "Winlogon" log in the Windows Event Viewer. If you want to retrieve events from a different log, you will need to modify the script.
-   The script only writes events that contain the word "error" to the log file. If you want to write events that meet different criteria, you will need to modify the script.
-   The log file is stored on the local machine at `C:\WinlogonErrors.log`. If you want to store the log file in a different location, you will need to modify the script.
