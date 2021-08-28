################################################
# Script to install winget pacakges.           #
#                                              #
# 2021-08-28                                   #
################################################

# Package file location
$package_file = Join-Path $PSScriptRoot "winget-packages.json";

if (Test-Path -Path $package_file -PathType Leaf) {
  Write-Output "Installing all packages in $package_file";
  Invoke-Expression "winget import -i $package_file";
} else {
  Write-Output "Package file doesn't exists."
  # # Dependencies
  # Invoke-Expression 'winget install Git.Git';
  # Invoke-Expression 'winget install Microsoft.dotnet';
  # Invoke-Expression 'winget install OpenJS.NodeJS';
  # Invoke-Expression 'winget install GnuPG.Gpg4win';

  # # Development
  # Invoke-Expression 'winget install Microsoft.AzureCLI';
  # Invoke-Expression 'winget install Microsoft.AzureStorageEmulator';
  # Invoke-Expression 'winget install Microsoft.AzureStorageExplorer';
  # Invoke-Expression 'winget install Microsoft.VisualStudioCode';
  # Invoke-Expression 'winget install Microsoft.VisualStudio.2019.Professional';

  # Invoke-Expression 'winget install Docker.DockerDesktop';

  # # Desktop
  # Invoke-Expression 'winget install AgileBits.1Password';
  # Invoke-Expression 'winget install Microsoft.Teams';
  # Invoke-Expression 'winget install Google.Chrome';

  # Invoke-Expression 'winget install Discord.Discord';
  # Invoke-Expression 'winget install ';
  # Invoke-Expression 'winget install ';
  # Invoke-Expression 'winget install ';
}
