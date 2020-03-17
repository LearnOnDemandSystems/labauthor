# Limit to Specific VM Sizes

This policy allows you to define one or more approved virtual machine sizes. Users will be unable to create any VMs outside of the defined sizes.

## Lines of Note

### Lines 3-17

Of the most importance in a policy of this type is that it is contained within an "allOf" to ensure that all criteria is evaluated.

### Lines 8-16

In this section of the policy we are limiting the user to create virtual machines only of sizes listed between lines 12 and 14.