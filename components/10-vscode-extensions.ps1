################################################
# Script to install desired VSCode extensions. #
#                                              #
# 2022-02-18                                   #
################################################

$currentLocation = Get-Location;

try {
  $extensionsFile = $PSScriptRoot + "\10-vscode-extensions.txt";
  Write-Host $extensionsFile
  $extensions = [System.IO.File]::ReadLines($extensionsFile)

  # Change to code folder, in case path isn't loaded correctly
  $codeFolder = $env:LOCALAPPDATA + "\Programs\Microsoft VS Code\";
  Set-Location -LiteralPath $codeFolder;

  foreach($line in $extensions) {
    if($line.StartsWith("#") -or [string]::IsNullOrWhiteSpace($line)) {
      continue;
    }
    Write-Host "Installing VSCode extension $line";
    $installCommand = "code --install-extension $line";
    Invoke-Expression $installCommand;
  }
}
finally {
  # Revert to old location, no changes to path please :P
  Set-Location $currentLocation;
}

