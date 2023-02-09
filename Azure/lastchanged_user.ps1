# Prompt user for account name
Write-Host "Enter the account name to search for:"
$accountName = Read-Host

# Connect to AzureAD
Write-Host "Connecting to AzureAD..."
Connect-AzureAD

# Search in AzureAD
Write-Host "Searching in AzureAD..."
$azureADResults = Get-AzureADUser -Filter "userPrincipalName eq '$accountName'" | Select-Object DisplayName, UserPrincipalName, LastPasswordChangeTimestamp, LastDirSyncTime

# Connect to AzureAD for AD DC
Write-Host "Connecting to AD DC..."
$cred = Get-Credential
Connect-AzureAD -Credential $cred

# Search in AD DC
Write-Host "Searching in AD DC..."
$adDCResults = Get-ADUser -Filter "UserPrincipalName -eq '$accountName'" -Server "AzureAD" | Select-Object Name, UserPrincipalName, LastPasswordSet, LastLogonDate

# Merge and filter the results
$results = $azureADResults + $adDCResults | Sort-Object -Property LastPasswordSet, LastPasswordChangeTimestamp, LastDirSyncTime, LastLogonDate | Select-Object -Last 1

# Filter results to only show changes in the last 30 days
$filteredResults = $results | Where-Object { $_.LastPasswordSet -ge (Get-Date).AddDays(-30) -or $_.LastPasswordChangeTimestamp -ge (Get-Date).AddDays(-30) -or $_.LastDirSyncTime -ge (Get-Date).AddDays(-30) -or $_.LastLogonDate -ge (Get-Date).AddDays(-30) }

# Display results
Write-Host "Results:"
$filteredResults | Format-Table
