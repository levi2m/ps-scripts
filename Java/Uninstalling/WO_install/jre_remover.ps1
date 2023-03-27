# Check if JRE is installed
if (Get-ItemProperty HKLM:\Software\JavaSoft\Java Runtime Environment\ -ErrorAction SilentlyContinue) {
    $installed = $true
} else {
    $installed = $false
}

# Display status
if ($installed) {
    Write-Output "JRE is installed."
} else {
    Write-Output "JRE is not present."
}

# Check JRE version
if ($installed) {
    $version = Get-ItemProperty HKLM:\Software\JavaSoft\Java Runtime Environment\ -Name "Java Version" | Select-Object -ExpandProperty "Java Version"
    Write-Output "JRE version: $version"
}

# Remove old JRE versions
if ($installed) {
    $versions = Get-ChildItem "C:\Program Files\Java\" -Directory | Select-Object -ExpandProperty "Name"
    $oldVersions = $versions | Where-Object { $_ -lt "1.8.0_361" }
    if ($oldVersions) {
        foreach ($oldVersion in $oldVersions) {
            $result = Start-Process "C:\Program Files\Java\$oldVersion\bin\java.exe" -ArgumentList "/s REMOVEOUTOFDATEJRES=1" -Wait -NoNewWindow
            if ($result.ExitCode -eq 0) {
                Write-Output "Successfully removed old JRE version: $oldVersion"
            } else {
                Write-Output "Failed to remove old JRE version: $oldVersion"
                exit 1
            }
        }
    } else {
        Write-Output "No old JRE versions found."
    }
}

# Exit code
exit 0
