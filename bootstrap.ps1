

# Executing all scripts in components folder (alphabetical order).

Get-ChildItem -Path "components" -Filter "*.ps1" |
ForEach-Object {
  Write-Output "Starting $_";
  try {
    Invoke-Expression -Command "$_";
  }
  finally {
    
  }
  
};

