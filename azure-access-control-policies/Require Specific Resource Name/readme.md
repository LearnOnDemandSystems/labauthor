# Require Specific Resource Name
This policy allows you to define one or more approved names for resources. In this particular sample, users will be unable to create any VMs without a certain naming convention.

## Using Pattern Matching
When using the **like** and **notLike** conditions, you provide a wildcard `*` in the value. The value shouldn't have more than one wildcard `*`.

When using the **match** and **notMatch** conditions, provide `#` to match a digit, `?` for a letter, `.` to match all characters, and any other character to match that actual character. **match** and **notMatch** are case-sensitive. Case-insensitive alternatives are available in **matchInsensitively** and **notMatchInsensitively**.

Reference: [https://docs.microsoft.com/en-us/azure/governance/policy/concepts/definition-structure#conditions](https://docs.microsoft.com/en-us/azure/governance/policy/concepts/definition-structure#conditions)
