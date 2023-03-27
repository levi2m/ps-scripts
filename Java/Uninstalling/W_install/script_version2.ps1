# Define the exit code
$exitCode = 0

# Check if Java is installed
$javaVersions = Get-ChildItem "HKLM:\SOFTWARE\JavaSoft\Java Runtime Environment" -ErrorAction SilentlyContinue
if ($javaVersions.Count -eq 0) {
    Write-Host "Java is not installed. Installing Java 8 Update 361..."

    # Download Java 8 Update 361 installer
    $url = "https://javadl.oracle.com/webapps/download/AutoDL?BundleId=242045_3d5a2bb8f8d4428bbe94aed7ec7ae784"
    $tempFile = "$($env:TEMP)\jre-8u361-windows-x64.exe"
    Invoke-WebRequest $url -OutFile $tempFile

    # Install Java 8 Update 361 silently
    Start-Process -FilePath $tempFile -ArgumentList "/s", "/L", "$($env:TEMP)\jre-8u361-install.log" -Wait

    # Verify installation
    $javaVersions = Get-ChildItem "HKLM:\SOFTWARE\JavaSoft\Java Runtime Environment" -ErrorAction SilentlyContinue
    if ($javaVersions.Count -eq 0) {
        Write-Host "Java installation failed. Check $($env:TEMP)\jre-8u361-install.log for more information."
        $exitCode = 1
    }
}

# Get the newest Java version
$newestVersion = $javaVersions | Sort-Object { [Version]($_.PSChildName) } | Select-Object -Last 1

# Uninstall older Java versions
foreach ($version in $javaVersions) {
    if ($version.PSChildName -ne $newestVersion.PSChildName) {
        Write-Host "Uninstalling $($version.PSChildName)..."
        & "${Env:ProgramFiles(x86)}\Common Files\Oracle\Java\javapath\java_uninstall.exe" /s "/INSTALLDIR=`"$($version.GetValue('JavaHome'))`"" /L `"$($Env:TEMP)\uninstall.log`""
    }
}

# Verify installation of the newest Java version
$javaVersion = (Get-ItemProperty "HKLM:\SOFTWARE\JavaSoft\Java Runtime Environment\$($newestVersion.PSChildName)" -ErrorAction SilentlyContinue).Version
if ($javaVersion -ne $newestVersion.PSChildName) {
    Write-Host "Java installation failed. Installed version is $($javaVersion)."
    $exitCode = 1
}

# Return the exit code
Write-Host "Script completed with exit code $($exitCode)."
exit $exitCode
