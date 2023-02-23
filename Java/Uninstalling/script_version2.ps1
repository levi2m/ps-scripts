# Get a list of installed Java versions
$javaVersions = Get-ChildItem "HKLM:\SOFTWARE\JavaSoft\Java Runtime Environment" | Where-Object {$_.PSChildName -match '^[0-9]+\.[0-9]+'}

# Find the newest version of Java
$newestVersion = $javaVersions | Sort-Object { [Version]($_.PSChildName) } | Select-Object -Last 1

# Uninstall all Java versions except for the newest version
foreach ($version in $javaVersions) {
  if ($version.PSChildName -ne $newestVersion.PSChildName) {
    Write-Host "Uninstalling $($version.PSChildName)..."
    & "${Env:ProgramFiles(x86)}\Common Files\Oracle\Java\javapath\java_uninstall.exe" /s "/INSTALLDIR=`"$($version.GetValue('JavaHome'))`"" /L `"$($Env:TEMP)\uninstall.log`""
  }
}
