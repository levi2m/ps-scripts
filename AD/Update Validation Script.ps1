# Step 1: Search for the SCCM server and look for the most recent updates released to Windows Server 2012 R2, 2016, and 2019
$SCCMServer = "sccm_server_name" # Replace with the name of your SCCM server
$Updates = Get-CMSoftwareUpdate -SiteCode "ABC" -Server $SCCMServer -Product "Windows Server 2012 R2","Windows Server 2016","Windows Server 2019" | Sort-Object -Property ReleasedDate -Descending | Select-Object -First 1

# Step 2: Ask for credentials to connect to every server on the server list inside the AD DC
$Cred = Get-Credential

# Step 3: Validate the last update installed on every server that connects
$Results = foreach ($Update in $Updates) {
    $ServerList = Get-ADComputer -Filter {OperatingSystem -like "Windows Server*"} | Select-Object -ExpandProperty Name
    foreach ($Server in $ServerList) {
        try {
            $Session = New-PSSession -ComputerName $Server -Credential $Cred
            $InstalledUpdates = Invoke-Command -Session $Session -ScriptBlock {
                Get-Hotfix | Where-Object {$_.InstalledOn -ge $using:Update.ReleasedDate}
            }
            $InstalledUpdate = $InstalledUpdates | Sort-Object -Property InstalledOn -Descending | Select-Object -First 1
            [PSCustomObject]@{
                ServerName = $Server
                LastUpdateInstalled = $InstalledUpdate.InstalledOn
                UpdatePackageName = $InstalledUpdate.HotFixID
            }
        } catch {
            Write-Warning "Failed to connect to $Server: $_"
        } finally {
            Remove-PSSession -Session $Session -ErrorAction SilentlyContinue
        }
    }
}

# Step 4: Create a text file, formatted as a table, with all the info above
$Results | Format-Table -AutoSize | Out-File -FilePath "C:\UpdateResults.txt"
