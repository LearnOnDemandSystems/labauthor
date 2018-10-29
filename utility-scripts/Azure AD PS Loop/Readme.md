# Azure AD Life Cycle Action Loop

This script is designed to provide a loop to be added at the beginning of any Life Cycle Actions relating to AzureAD or AzureRM permissions affecting lab user accounts at the beginning of a lab. Users are not visible to Azure Powershell immediately upon launch, so without this loop user related life cycle actions may result in failure.

## Modifications

This script should be deployed as is with the following exception:

- Line 19: This line should be replaced with the command(s) you are attempting to run.
