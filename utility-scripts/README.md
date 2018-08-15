# Learn on Demand Systems Lab Authoring Utility Scripts

This folder contains utility scripts that may help you while you are building labs,
whether they include Cloud Slice, Activity Based Assessments, or other resources.
Please feel free to contribute scripts into this folder if you feel they would be
useful to others who are authoring labs.

:memo: **NOTE: These scripts are not supported.**

If you have questions about these scripts, post your question on the Issues tab, or
visit the [Slack workspace][slack-workspace] and discuss the script there.

[slack-workspace]: https://join.slack.com/t/labauthor/shared_invite/enQtMzg4NDU4MjEzNzYzLTE3YjE3Nzk2NDljMDU3M2Y1MzIzMjUzODA3ZjI5ODRmZTVhOWUxMjllNTU1MGFiOGQ1NjljNDI3YWEwZDAxY2Q

The following utility scripts are currently available:

|Name|Description|
|--|--|
|[Test-ActivityScript](#test-activityscript)|Facilitates testing activity automation scripts outside of Lab on Demand.|

#### [Test-ActivityScript](https://www.powershellgallery.com/packages/Test-ActivityScript/1.0/DisplayScript)

To install and try this script, perform the following tasks:

1. Invoke the following command in an elevated PowerShell session: `Install-Script -Name Test-ActivityScript`. If you are prompted to allow PowerShell to extend your PATH environment variable, answer `Yes`.

1. Once it is installed, you can test activity scripts by invoking a command such as this example:

    ```PowerShell
    Test-ActivityScript -TenantId $tenant -SubscriptionId $sub -Credential $creds -ScriptBlock {
        $vmName = 'Server1'
        $nsgName = 'NSG1'
        $port = 443
        # Use Azure PowerShell to verify server Server1 has a network security group named NSG1 with port 443 allowed
    }
    ```
    
    You can put whatever activity script you want to test inside of the script block.
    
    :bulb: Don't forget to set the variables used to log on to your subscription!

    :warning: Replacement tokens are not supported by this command, so you'll need to replace them manually with actual values during your testing.

1. To learn more about the command, invoke `Get-Help Test-ActivityScript -Full` in PowerShell.

