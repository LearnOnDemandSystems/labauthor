# What Are Azure Access Control Policies?
Azure Access Control Policy is a Lab on Demand (LOD) platform term. More natively, these are simply "Azure Policies". An access control policy is used to limit the resources that users can provision on the cloud platform. 

For more information, see [Microsoft's Official Documentation](https://docs.microsoft.com/en-us/azure/governance/policy/overview).

# Why Do I Need an Access Control Policy?
The primary purposes of Access Control Policies are:
  - To help users stay within the goals of a lab by blocking them from unneeded resources.
  - To prevent additional charges from incurring by blocking users from creating items of a higher cost SKU than needed.
  - To prevent malicious users from abusing a lab for personal gain.
  
# Frequently Asked Questions:

## Will an Access Control Policy block my lab resource templates from deploying?
This depends on a couple of variables such as what your policy is blocking and your options selected on your lab profile in LOD. Below are the 2 different deployment scenarios and how they interact with your policy:
  
  - **Deployment Method 1: Resources deploy before the user is in the lab.**
    - This is the default and most common deployment method. 
    - With these deployments Access Control Policies are not applied until after all resources are deployed, and therefore will not impact your deployment at all.
    
  - **Deployment Method 2: Resources deploy in the background while the user can interact with the lab.**
    - This deployment method is less common and is accomplished by selecting the "Deploy in Background" option on a resource template from the lab profile.
    - With these deployments the policies will be in place _while_ resources are deploying, so you will need to ensure there are exceptions within your policy for any resources the template is deploying.
    - If you are comfortable with having no policy while templates are deploying and would like them to deploy _after_ all resource deployments are complete, you will need to select the "Deploy After Background Deployments" option.

## Are there more samples available somewhere?
Yes! For more samples, see [Microsoft's Sample Repository](https://docs.microsoft.com/en-us/azure/governance/policy/samples/index).

## I'm creating a policy from scratch, how do I know what conditions or fields I can use?
Microsoft supplies very thorough documentation on this available [here](https://docs.microsoft.com/en-us/azure/governance/policy/concepts/definition-structure).
