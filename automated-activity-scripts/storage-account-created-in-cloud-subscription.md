# Storage Account Created in Cloud Subscription

### Description
The Automated Activity below will check if the student has created a storage account in the cloud subscription. Scoring needs to be enabled in the lab profile.

### New Automated Activity 

|Field|Value|
|---|---|
|Name|Storage Account Created|
|Instructions|Click the button below|
|Scored|Yes|
|Displays Scripts as a Task List|Yes|
|On-Demand Evaluation|N/A|
|Allow Retries|Yes|
|Required for submission|Yes|
|Block Page navigation|Yes|
|Correct answer feedback|Leave blank|
|Incorrect answer feedback|Leave blank|

### Script 

|Field|Value| 
|---|--|
|Text|Storage Account Created|
|Score Value|Enter a score value for this activity|
|Target|Cloud Subscription|

Script:

```
param($LabInstanceId) 
$result = $false
$resourceGroupName = "CSSTlod${LabInstanceId}"
$storAccount = Get-AzureRmStorageAccount -ResourceGroupName $resourceGroupName -Name "sa${LabInstanceId}" -ErrorAction Ignore    
if ($storAccount -eq $null){
    "The Storage Account has not been created"    
} else {
    $result = $true
    "You successfully created the storage account."
}
$result
```
