# Restrict resources to constrained VM scale sets 

This policy shows how to limit a lab deployment to only the resources necessary for a virtual machine scale set.

The policy limits the creation of scale sets to one per resource group by restricting the virtual machine scale set 
computer name prefix to a single value. Additionally, it restricts the size of the VMs in a scale set to a 
single SKU. 

The Microsoft.Network resource is necessary for the virtual machines and the load balancer 
configuration. The Micrsoft.Insights resource is necessary for monitoring, alerting, and scaling functionality
that is required for the scale sets to work properly.

