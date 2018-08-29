# Azure AD Life Cycle Action Loop

This script is designed to provide a loop to be added at the beginning of any Life Cycle Actions relating to AzureAD or AzureRM permissions affecting lab user accounts at the beginning of a lab. Users are not visible to Azure Powershell immediately upon launch, so without this loop user related life cycle actions will result in failure.

## Modifications

This script should be deployed as is with the following exceptions:

- Line 2: This line defines the LOD provisioned resource group, this will need to be modified to replace the ### with the number associated with your lab.

  - Alternatively, this may need to be removed entirely dependent upon if your commands require the resource group name.

- Line 3: If you are defining a custom role (or even a built-in role) that has already been created on the subscription, replace "My Custom Role" with the role that belongs here.
  
  - Alternatively, if you are not performing a role assignment this variable may be removed entirely or replaced.
  
- Line 21: This line should be replaced with the command(s) you are attempting to run.
