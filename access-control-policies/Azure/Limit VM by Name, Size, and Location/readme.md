# Restrict Resources to VMs by Name, Size, and Location

This policy provides an example of how to restrict resources to only those required to deploy 
virtual machines with specific names (VM-1 and VM-2) and sizes (DS1_v2, B1s, and B1sm) to a single location (EastUS).

In addition to these restrictions, the policy allows for the creation of ***only*** the following resources related to virtual machine provisioning and creation:

- Microsoft.Network/
- Microsoft.Compute/disks
- Microsoft.Compute/virtualMachines/extensions (necessary if you need to deploy DSC resources)
- Microsoft.Storage/storageAccounts
