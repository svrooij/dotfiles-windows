################################################
# Script to install needed powershell modules  #
#                                              #
# 2021-08-28                                   #
################################################

Set-PSRepository -Name 'PSGallery' -InstallationPolicy Trusted

Install-Module "AzureADPreview" -Scope CurrentUser;
Install-Module "ExchangeOnlineManagement" -Scope CurrentUser;
Install-Module "MicrosoftTeams" -Scope CurrentUser;

# # Install-Module "posh-git" -Scope CurrentUser;
# # Install-Module "oh-my-posh" -Scope CurrentUser;
# Install-Module -Name PSReadLine -AllowPrerelease -Scope CurrentUser -Force -SkipPublisherCheck

Set-PSRepository -Name 'PSGallery' -InstallationPolicy Untrusted