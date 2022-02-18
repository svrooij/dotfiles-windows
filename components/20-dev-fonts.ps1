
function Install-Font {
  param(
    [Parameter(Mandatory=$true)] [Uri]$Release,
    [Parameter(Mandatory=$true)] [String]$Name,
    [Parameter(Mandatory=$false)] [String]$FileFilter = "*.ttf"
  )
  # Download the file to temp
  $tempFile = $env:TEMP + "\$Name.zip";
  if(-not(Test-Path -Path $tempFile -PathType Leaf)) {
    Invoke-WebRequest -Uri $Release -OutFile $tempFile;
  }

  # Extract files to temp
  $tempFolder = $env:TEMP + "\$Name\"
  Expand-Archive $tempFile -DestinationPath $tempFolder -Force;
  Remove-Item $tempFile;

  # Copy files to Fonts folder
  $fontFiles = $tempFolder + $FileFilter;
  $fontsFolder = $env:LOCALAPPDATA + "\Microsoft\Windows\Fonts"
  Copy-Item -Path $fontFiles -Destination $fontsFolder;
  Remove-Item $tempFolder -Recurse -Force;
}

function Register-Fonts {
  param(
    [Parameter(Mandatory=$false)] [string]$Folder = $env:LOCALAPPDATA + "\Microsoft\Windows\Fonts",
    [Parameter(Mandatory=$false)] [bool]$CurrentUser = $true
  )

  $registeryLocation = "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts"

  Get-ChildItem -Path $Folder -Filter "*.ttf" -File |
  ForEach-Object {
    #Write-Output "Registring $_"
    $fontname = $_.Name.Replace(".ttf", "").Replace("-", " ").Replace("Light", " Light");
    Write-Output "Registring $fontname";
    $registerCommand = 'reg add "' + $registeryLocation + '" /v "' + $fontname + ' (TrueType)" /t REG_SZ /d ' + $_ +' /f';
    # Write-Output $registerCommand;
    Invoke-Expression $registerCommand;
  };
}

# Install-Font -Release "https://github.com/microsoft/cascadia-code/releases/download/v2111.01/CascadiaCode-2111.01.zip" -Name "CascadiaCode-2111.01" -FileFilter "otf\static\*.otf";
Install-Font -Release "https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/CascadiaCode.zip" -Name "CascadiaCode-NF-2.1.0"
# Install-Font -Release "https://github.com/adam7/delugia-code/releases/download/v2111.01/delugia-powerline.zip" -Name "delugia-powerline-v2111.01"
Install-Font -Release "https://github.com/adam7/delugia-code/releases/download/v2111.01/delugia-mono-complete.zip" -Name "delugia-mono-v2111.01" -FileFilter "delugia-mono-complete\*.ttf"
Register-Fonts