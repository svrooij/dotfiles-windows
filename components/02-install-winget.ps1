################################################
# Script to install winget.                    #
# Microsoft build package manager              #
# 2022-02-18 v1.1.12653                        #
################################################

# Configuration
$winget_version = "v1.1.12653";
$winget_msix = "https://github.com/microsoft/winget-cli/releases/download/v1.1.12653/Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle";

# --------------- Script --------------------
# AppX is needed for the msixbundle installer.
Import-Module Appx -UseWindowsPowerShell;

$winget_file = Join-Path $env:TEMP "winget.$winget_version.msixbundle";
if(-not(Test-Path -Path $winget_file -PathType Leaf)) {
  Invoke-WebRequest -Uri $winget_msix -OutFile $winget_file;
}

Add-AppPackage -Path $winget_file ;
