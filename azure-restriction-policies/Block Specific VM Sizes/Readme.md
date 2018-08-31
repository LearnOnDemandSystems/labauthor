# Block Specific VM Sizes

This policy is designed to deny users the ability to create VMs of specific sizes.

**NOTE:** While this option is valid, it is recommended to instead [Limit VMs to a specific size](https://github.com/James-Burnham/labauthor/tree/master/azure-restriction-policies/Limit%20to%20Specific%20VM%20Sizes) as it is much easier to tell a user "Create a VM of size XYZ" and if they choose a different size they'll get an error than it may be to build and maintain a list of high cost VMs you want to limit.
