# Block Resources by Type, Name, and SKU (Full Lockdown)

The purpose of this policy is to prevent users from creating ANYTHING outside of the components you have specified. This is meant to be a sample for you to copy/paste/modify in order to tailor to your desired use case.

This example permits users to create only the following:
  - Virtual Machines (Size A1 Only)
  - Networks
  - Storage accounts
  - Azure Managed SQL Servers/Databases.

## Lines of Note

### Line 3
The key to this script is the "not" statement defined on line 3. While you could add a "not" to each individual component, this simplifies the process and encapsulates the entire policy in it. This means users **can** create only things which are defined within the policy.

This is contrary to standard policy behavior which defines items that users **cannot** create, but the recommended format for locking down user access within lab environments.

### Line 4
An "anyOf" encapsulates the entire policy, establishing that if the resource the user is attempting to create is not any of these items they will be denied.

### Lines 5-25
Here we are nesting an "allOf" within the anyOf. This allows us to define multiple components that must be present simultaneously in order to succeed - in this case, virtual machines but only if are also an A1 size and with a specific resource name.

Within this segment at lines 13-15 we are using an "in" statement to establish an array of options. In this case there is only one, but you may want to allow multiple different VM sizes in your lab.

### Lines 26-33
Here we are allowing users to create *any* resources that are part of a few different overarching categories, as opposed to the previous section where we applied restrictions within an overarching category.
