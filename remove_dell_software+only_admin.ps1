$installedDellSoftware = Get-ChildItem -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall" |
                 Get-ItemProperty | 
                 Where-Object { $_.Publisher -eq "Dell Inc." -and $_.DisplayName -ne "Dell SupportAssist" }

ForEach ($software in $installedDellSoftware) {
    $uninstallString = $software.UninstallString
    If ($uninstallString) {
        Start-Process $uninstallString '/quiet' -Wait
    }
}

$registryKey = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{A93727D9-B68B-49A6-927A-AD5F5A6030DC}"
$dellSupportAssist = Get-ItemProperty -Path $registryKey

If ($dellSupportAssist) {
    $currentUser = [System.Security.Principal.WindowsIdentity]::GetCurrent().Name
    $adminUser = New-Object System.Security.Principal.WindowsPrincipal([System.Security.Principal.WindowsIdentity]::GetCurrent())
    $isAdmin = $adminUser.IsInRole([System.Security.Principal.WindowsBuiltInRole]::Administrator)

    If ($isAdmin -eq $false) {
        $uninstallString = $dellSupportAssist.UninstallString
        If ($uninstallString) {
            Start-Process $uninstallString '/quiet' -Wait
        }
    }
}
