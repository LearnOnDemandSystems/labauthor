# What Are Access Control Policies?
Access Control Policy is a Lab on Demand (LOD) platform term. More natively, these have different names depending on the cloud provider you are authoring for as seen in the below table:

|Cloud Platform|Policy Type|
|--|--|
|Microsoft Azure|[Azure Policies](https://docs.microsoft.com/en-us/azure/governance/policy/overview)|
|Amazon Web Services|[IAM Managed Identity-Based Policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies.html#policies_id-based)|

# Why Do I Need an Access Control Policy?
The primary purposes of Access Control Policies are:
  - To prevent malicious users from abusing a lab for personal gain.
  - To prevent additional charges from incurring by blocking users from creating items of a higher cost SKU than needed.
  - To help users stay within the goals of a lab by blocking them from unneeded resources.
  
# Frequently Asked Questions:

## Will an Access Control Policy block my lab resource templates from deploying?
This depends on a couple of variables such as what your policy is blocking and your options selected on your lab profile in LOD. Below are the 2 different deployment scenarios and how they interact with your policy:
  
  - **Deployment Method 1: Resources deploy before the user is in the lab.**
    - This is the default and most common deployment method. 
    - With these deployments Access Control Policies are not applied until after all resources are deployed, and therefore will not impact your deployment at all.
    
  - **Deployment Method 2: Resources deploy in the background while the user can interact with the lab.**
    - This deployment method is less common and is accomplished by selecting the "Deploy in Background" option on a resource template from the lab profile.
    - With these deployments the policies will be in place _while_ resources are deploying, so you will need to ensure there are exceptions within your policy for any resources the template is deploying.

## Are there more samples available somewhere?
Yes! For more samples, see the table below for each of the cloud providers:

|Cloud Platform|Sample Repository|
|--|--|
|Microsoft Azure|[Microsoft Docs](https://docs.microsoft.com/en-us/azure/governance/policy/samples/index)|
|Amazon Web Services|[AWS Docs](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_examples.html)|

## I'm creating a policy from scratch, how do I know what conditions or fields I can use?

This will vary based on the cloud platform you are working with as noted below:

### Microsoft Azure

Microsoft policies utilize a JSON definition. Very thorough documentation on this is available [here](https://docs.microsoft.com/en-us/azure/governance/policy/concepts/definition-structure).

### Amazon Web Services

Amazon supplies a full graphical user interface (GUI) called the "Visual Editor" to make policy creation simple without knowing complex code languages like JSON. Instructions for using the visual editor can be found [here](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_create.html#access_policies_create-visual-editor).

**The visual editor is great, but can I just use JSON?**

Yes you can. Amazon also supplies documentation on the overall policy structure available [here](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies.html#access_policies-json) and deeper information about specific policy elements [here](https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_elements.html).
