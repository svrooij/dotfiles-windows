################################################
# Copy files from home to ~                    #
#                                              #
# 2022-02-18                                   #
################################################

$homeFolder = Join-Path (get-item $PSScriptRoot).Parent "home";
$homeFolder += "\*";
Write-Host "Copying files from $homeFolder to $env:HOMEPATH";
Copy-Item -Path $homeFolder -Destination $env:HOMEPATH -Recurse