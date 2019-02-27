# Block Resources by Type (Partial Lockdown)
This policy is designed to deploy an initial framework policy that can be expanded upon with other policies. It is recommended to be used in conjunction with other policies when the potential for high cost resources is present. For example while this policy limits users to only creating a few types of resources, it also opens users up to creating VMs of any size. It would be recommended to utilize a [VM Size restriction policy](../Limit%20to%20Specific%20VM%20Sizes) as well to prevent high cost SKUs from being utilized.

**NOTE:** For a more complex, but more robust, policy you should [Block Resources by Type **and** SKU](../Block%20Resources%20by%20Type%20and%20SKU%20(Full%20Lockdown)) as well.

## Lines of Note

### Line 3
The key to this script is the "not" statement defined on line 3. While you could add a "not" to each individual component, this simplifies the process and encapsulates the entire policy in it. This means users can create only things which are defined within the policy.

This is contrary to standard policy behavior which defines items that users cannot create, but the recommended format for locking down user access within lab environments.

### Lines 5-18

Here we are using an "in" statement to establish an array of options. In this case establishing all the resource "type"s that users should be allowed to create.
