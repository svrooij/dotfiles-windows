# Script by CloudAppie to toggle vscode to demo mode
# source https://www.cloudappie.nl/using-streamdeck-toggle-ecodepresenting/
#
# Add BarRaider - Streamdeck advanced loader https://github.com/BarRaider/streamdeck-advancedlauncher
#
# Application C:\Program Files\PowerShell\7\pwsh.exe
# Start in: C:\Program Files\PowerShell\7
# Argument (change script location) -File "c:\users\me\dotfiles-windows\scripts\vscode-demo-mode.ps1"

$settingsPath = "$env:APPDATA\Code\User\settings.json";
$colorSetting = 'workbench.colorTheme';
$fontSetting = 'editor.fontSize';

$data = Get-Content -Raw -Path $settingsPath -ErrorAction silentlycontinue | ConvertFrom-Json

if($data){
    if($data.$colorSetting) {
        $data.PSObject.Properties.Remove($colorSetting)
    }
    else {
        $data | Add-Member -Name $colorSetting -Value "Default Light+" -MemberType NoteProperty
    }
    if($data.$fontSetting) {
        $data.PSObject.Properties.Remove($fontSetting)
    }
    else {
        $data | Add-Member -Name $fontSetting -Value "25" -MemberType NoteProperty
    }
}

$data | ConvertTo-Json | Out-File $settingsPath -Encoding utf8