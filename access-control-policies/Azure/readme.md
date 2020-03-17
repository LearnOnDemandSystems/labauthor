# Azure Access Control Policy Samples
Samples available here are designed by and for Lab on Demand Lab Authors. Within each folder is a sample policy, as well as a description of key components within that policy.

## Azure Policy Best Practices:

### Use a "Whitelist" policy model
By default the Microsoft Azure platform utilzes a blacklist model to permissions. "Owner" and "Contributor" are among the most common roles on resource groups and these allow the user to do almost anything. Utilzing Azure Policy, you can limit the capabilities witihin entire resource groups (regardless of the user's role). Azure policy supports many different "effects" which vary widely and include allow, disable, audit, deny, and others.

When designing policies for use within lab environments, the policy should be encased in a "not" statement and the "effect" should always be **Deny**. An example of this practice can be seen in the [Block Resources by Type and SKU](./Block%20Resources%20by%20Type%20and%20SKU%20(Full%20Lockdown)) sample on lines 3 and 14.

### Allow only the virtual machines required by the lab - or none at all

Virtual machines (VMs) are the most abused resource by those with malicious intent (such as bitcoin miners). This means ANY allowance of VMs results in a more vulnerable lab. This vulnerbility can be minimized using methods that limit the number of virtual machines available to the user. The most common methods are by **SKU**, by **Region**, and by **Name**. Each of these items provides its own level of security as outlined below, with the combination of all 3 ensuring the highest level of security.

- **SKU**: Limiting VMs by SKU restricts the size of VMs that users may create. This will help in limiting the cost per VM, but also by meaning the most VMs that could ever be created match that of the quota level for the SKU(s) allowed.

- **Region**: Quota levels for SKUs are per-region. Limiting even by SKU for VMs that have a high per region quota can result in hundreds of VMs across numerous regions if a malicious user accesses the lab. Limiting by region restricts this to a single region so that at worst only a single region's quota limit is hit.

- **Name**: In Azure, VMs must have a unique name within their resource group. By requiring specific name(s) it limits the user to exactly that many virtual machines within the resource group. This is the most secure option - and even without the other options outlined extremely limits the potential for abuse.

Examples of this practice can be seen in the [Limit VM by Name, Size, and Location](./Limit%20VM%20by%20Name%2C%20Size%2C%20and%20Location) and [Block All VMs](./Block%20All%20VMs) samples.