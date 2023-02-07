$installedJava = Get-ChildItem -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall" |
                 Get-ItemProperty | 
                 Where-Object { $_.DisplayName -like "Java*" } |
                 Sort-Object -Property InstalledOn -Descending

$lastJava = $installedJava[0]

ForEach ($java in $installedJava) {
    If ($java.DisplayName -ne $lastJava.DisplayName) {
        $uninstallString = $java.UninstallString
        If ($uninstallString) {
            Start-Process $uninstallString '/quiet' -Wait
        }
    }
}
