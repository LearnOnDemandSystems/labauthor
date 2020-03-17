# Allow Resources by Type (Partial Lockdown)
This policy is designed to deploy an initial framework policy that can be expanded upon with other policies. It is recommended to be used in conjunction with other policies when the potential for high cost resources is present. For example while this policy limits users to only creating a few types of resources, it also opens users up to creating VMs (EC2 Instances) of any size. It would be recommended to utilize a [VM Size restriction policy](../Limit%20to%20Specific%20VM%20Sizes) as well to prevent high cost SKUs from being utilized.

**NOTE:** For a more complex, but more robust, policy you should use something like [Allow Resources by Type **_and_** SKU](../Allow%20Resources%20by%20Type%20and%20SKU%20(Full%20Lockdown)).

## Lines of Note

### Lines 6-10

Here we are defining an array of resource types and using a wildcard (*) to establish that users can perform any action relating to a resource that type.