################################################
# Script to install winget.                    #
# Microsoft build package manager              #
# 2021-08-28 v1.0.11692                        #
################################################

# Configuration
$winget_version = "v1.0.11692";
$winget_msix = "https://github.com/microsoft/winget-cli/releases/download/v1.0.11692/Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle";

# --------------- Script --------------------
# AppX is needed for the msixbundle installer.
Import-Module Appx -UseWindowsPowerShell;

$winget_file = Join-Path $env:TEMP "winget.$winget_version.msixbundle";
if(-not(Test-Path -Path $winget_file -PathType Leaf)) {
  Invoke-WebRequest -Uri $winget_msix -OutFile $winget_file;
}

Add-AppPackage -Path $winget_file ;
