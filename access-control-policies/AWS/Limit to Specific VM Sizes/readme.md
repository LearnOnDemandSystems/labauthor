# Limit to Specific VM Sizes

This policy allows you to define one or more approved virtual machine sizes. Users will be unable to create any VMs outside of the defined sizes.

## Lines of Note

### Lines 4-8

The policy begins by allowing all EC2 actions with no limitations.

### Lines 9-20

In this section of the policy we add further restrictions to the EC2 actions by denying any commands to run instances that are not one of the sizes listed between lines 15 and 17.