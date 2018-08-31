# Full Lockdown Policy Sample

The purpose of this policy is to prevent users from creating ANYTHING outside of the components you have specified. This example permits users to only create Virtual Machine that are size A1, networks, storage accounts, and Azure Managed SQL Servers/Databases.

## Lines of Note

### Line 3
The key to this script is the "not" statement defined on line 3. While you could add a "not" to each individual component, this simplifies the process and encapsulates the entire policy in it. This means users **cannot** create anything that isn't defined within the policy.

This is contrary to standard policy which is defining items that users cannt create.

### Line 4
An "anyOf" encapsulates the entire policy establishing that if the resource the user is attempting to create is not any of these items they will be denied.

### Lines 5-18
Here we are nesting an "allOf" within the anyOf. This allows use to define multiple components that must be present simultaneously in order to succeed - in this case, virtual machines but only if are also an A1 size.

Within this segment at lines 13-15 we are using an "in" statement to establish that an array of options. In this case there is only one, but you may want to allow multiple different VM sizes in your lab.

### Lines 19-26
Here we are allowing users to create any resources that are part of a few different overarching categories, as opposed to the previous categories where we applied restrictions within that category.
