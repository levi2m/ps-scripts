# Define the log name, log file path, and timeout (in seconds)
$logName = "Winlogon"
$logFilePath = "C:\WinlogonErrors.log"
$timeout = 30

# Start a timer
$stopwatch = [System.Diagnostics.Stopwatch]::StartNew()

# Get the events from the log
$events = Get-EventLog -LogName $logName -EntryType Error

# Loop through each event
foreach ($event in $events) {
  # Check if the timer has reached the timeout
  if ($stopwatch.Elapsed.TotalSeconds -gt $timeout) {
    # Write a message to the log file indicating that the script has timed out
    $logMessage = "Script timed out after $timeout seconds"
    Add-Content -Path $logFilePath -Value $logMessage
    # Exit the script
    break
  }

  # Check if the event contains the word "error"
  if ($event.Message -match "error") {
    # Write the event to the log file
    $logMessage = "Event ID: $($event.InstanceId)"
    Add-Content -Path $logFilePath -Value $logMessage
    $logMessage = "Time: $($event.TimeGenerated)"
    Add-Content -Path $logFilePath -Value $logMessage
    $logMessage = "Message: $($event.Message)"
    Add-Content -Path $logFilePath -Value $logMessage
  }
}
