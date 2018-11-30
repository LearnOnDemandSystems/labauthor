# Remove Azure Recovery Services Vault
This script should be applied to any lab that utilizes Recovery Services Vaults and should be ran as a Life Cycle Action during the **Tearing Down** stage. It is designed to remove components of a recovery services vault, followed by the vault itself, then finally the resource group.

Without the addition of this script vaults have a hard lock that cannot be removed by traditional means and therefore prevent teardown of both the vault and the resource group. This will result in these items continuing to live on your subscription and increase billing even after the lab has been ended.

## Modifications
This script should be deployed as is with the following exceptions:

- Line 2: This line is defined as an array. If you have only 1 resource group, simply replace the ### with the number for your resource group. If you have more than 1 resource group then it is recommended to add all of them to the array in the event users created the Vault in an unexpected resource group.
- Additional Containers: As-is, this script tears down AzureVM containers and Windows MARS containers (Azure Backup Agent). Your lab may be using different container types (such as AzureSQL) and therefore you should update the script to remove these as well.
  - Any additional components should be added to the nested foreach loop (Lines 8-34)
