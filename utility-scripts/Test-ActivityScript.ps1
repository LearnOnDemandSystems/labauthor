function Test-ActivityScript {
    <#
    .Synopsis
       Runs an activity script in a very similar manner to how they are run in Lab on Demand.
    .DESCRIPTION
       The Test-ActivityScript command runs an activity script in a very similar manner to how
       they are run in Lab on Demand.
    .EXAMPLE
       PS C:\>$tenant = '44443110-be10-4d21-81cd-516a52dfab13'

       PS C:\>$sub = 'ed2efd04-3e88-4df9-8b3c-cf816a1c2571'

       PS C:\>$creds = Get-Credential -UserName 'morgan@careerrockit.com'

       PS C:\>Test-ActivityScript -TenantId $tenant -SubscriptionId $sub -Credential $creds -ScriptBlock {
           Send-LabNotification -Message 'Inside script'
           Get-AzureRmResourceGroup
       }

       This command invokes an activity script that retrieves all resource groups from the Azure
       tenant/scription specified, using the morgan@careerrockit.com account. The activity script
       also sends a notification to the lab when run inside of Lab on Demand as an activity;
       however, when testing outside of Lab on Demand, the Send-LabNotification command will
       simply write a message to the information stream.
    .EXAMPLE
       PS C:\>$accessKey = 'AWPY2REJKOIMWQ5WZ8QA'

       PS C:\>$secretKey = 'vzjkRUVR/qXRvGOa3eU6qLbWLJ+h6Vv1PebBjvvj'

       PS C:\>Test-ActivityScript -AccessKey $accessKey -SecretKey $secretKey -ScriptBlock {
           Send-LabNotification -Message 'Inside script'
           Get-IAMUser
       }

       This command invokes an activity script that retrieves all IAM users from the AWS account
       associated with the access key and secret key specified. The activity script also sends a
       notification to the lab when run inside of Lab on Demand as an activity; however, when
       testing outside of Lab on Demand, the Send-LabNotification command will simply write a
       message to the information stream.
    .INPUTS
       None
    .OUTPUTS
       Whatever your activity script outputs.
    .NOTES
       Even if an activity script works when run this way, it may still have issues when run in
       Lab on Demand, so you must still test your activity scripts in Lab on Demand. The advantage
       to performing testing outside of Lab on Demand is that you can step through and debug your
       script, and see all output more easily. A best practice is to get the script working the
       way that you want outside of Lab on Demand, and then copy it into Lab on Demand to make
       sure it works the same way there.
    #>
    [CmdletBinding(DefaultParameterSetName='Azure')]
    [System.Diagnostics.DebuggerStepThrough()]
    param(
        # The id (guid) of your Azure tenant.
        [Parameter(Position=0, Mandatory=$true, HelpMessage='The Azure tenant id.', ParameterSetName='Azure')]
        [ValidateScript({
            [CmdletBinding()]
            [System.Diagnostics.DebuggerHidden()]
            param()
            if ($_ -eq [System.Guid]::Empty) {
                throw 'You must provide a non-empty GUID for the TenantId parameter.'
            }
            $true
        })]
        [System.Guid]
        $TenantId,

        # The id (guid) of your Azure subscription.
        [Parameter(Position=1, Mandatory=$true, HelpMessage='The Azure subscription id.', ParameterSetName='Azure')]
        [ValidateScript({
            [CmdletBinding()]
            [System.Diagnostics.DebuggerHidden()]
            param()
            if ($_ -eq [System.Guid]::Empty) {
                throw 'You must provide a non-empty GUID for the SubscriptionId parameter.'
            }
            $true
        })]
        [System.Guid]
        $SubscriptionId,

        # The credentials for an Azure account that will be used to run the script.
        [Parameter(Position=2, Mandatory=$true, HelpMessage='The user credentials used to run the script against the Azure subscription.', ParameterSetName='Azure')]
        [ValidateScript({
            [CmdletBinding()]
            [System.Diagnostics.DebuggerHidden()]
            param()
            if ($_ -eq [System.Management.Automation.PSCredential]::Empty) {
                throw 'You must provide non-empty credentials for the Credential parameter.'
            }
            $true
        })]
        [System.Management.Automation.PSCredential]
        [System.Management.Automation.Credential()]
        $Credential,

        # Indicates that the Azure account credentials identify an Azure service principal. By default Azure account credentials identify an Azure user.
        [Parameter(ParameterSetName='Azure')]
        [System.Management.Automation.SwitchParameter]
        $ServicePrincipal,

        # The access key for the AWS IAM user that will be used to run the script.
        [Parameter(Position=0, Mandatory=$true, HelpMessage='The AWS access key.', ParameterSetName='AWS')]
        [ValidateNotNullOrEmpty()]
        [System.String]
        $AccessKey,

        # The secret for the AWS IAM user that will be used to run the script.
        [Parameter(Position=1, Mandatory=$true, HelpMessage='The AWS secret key.', ParameterSetName='AWS')]
        [ValidateNotNullOrEmpty()]
        [System.String]
        $SecretKey,

        # The activity script that you want to run.
        [Parameter(Position=3, Mandatory=$true, HelpMessage='The script you want to run.', ParameterSetName='Azure')]
        [Parameter(Position=2, Mandatory=$true, HelpMessage='The script you want to run.', ParameterSetName='AWS')]
        [ValidateNotNull()]
        [System.Management.Automation.ScriptBlock]
        $ScriptBlock
    )

    try {
        $oldPSDefaultParameterValueKeys = @($PSDefaultParameterValues.Keys)
        $PSDefaultParameterValues['Write-Verbose:Verbose'] = $true
        $PSDefaultParameterValues['Write-Information:InformationAction'] = [System.Management.Automation.ActionPreference]::Continue
        $ErrorActionPreference = [System.Management.Automation.ActionPreference]::Stop
        try {
            switch ($PSCmdlet.ParameterSetName) {
                'Azure' {
                    $passThruParameters = @{
                            TenantId = $TenantId
                        Subscription = $SubscriptionId
                          Credential = $Credential
                    }
                    if ($PSCmdlet.MyInvocation.BoundParameters.ContainsKey('ServicePrincipal') -and $ServicePrincipal) {
                        $passThruParameters.Add('ServicePrincipal',$true)
                    }
                    Connect-AzureRmAccount @passThruParameters > $null
                    break
                }
                'AWS' {
                    $passThruParameters = @{
                        AccessKey = $AccessKey
                        SecretKey = $SecretKey
                    }
                    Set-AWSCredential @passThruParameters
                    break
                }
            }

            function Send-LabNotification {
                [CmdletBinding()]
                param(
                    [Parameter(Position=0, Mandatory=$true, ValueFromPipeline=$true)]
                    [ValidateNotNullOrEmpty()]
                    [Alias('Msg')]
                    [System.String]
                    $Message
                )
                Write-Information -MessageData "LAB NOTIFICATION MESSAGE: ${Message}"   
            }

            . $ScriptBlock
        } finally {
            switch ($PSCmdlet.ParameterSetName) {
                'Azure' {
                    Disconnect-AzureRmAccount -Username $Credential.UserName > $null
                }
                'AWS' {
                    Clear-AWSCredential
                }
            }
        }
    } catch {
        throw
    } finally {
        foreach ($key in @($PSDefaultParameterValues.Keys)) {
            if ($oldPSDefaultParameterValueKeys -notcontains $key) {
                $PSDefaultParameterValues.Remove($key)
            }
        }
    }
}
