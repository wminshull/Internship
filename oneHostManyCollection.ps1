#many collections one host
$collections = "Adobe Acrobat DC", "Imprivata - Prod"
$hostname = "BUFCLN2TEMD078A"

function Add-Host{
    foreach ($collection in $collections){
        Write-Host “Adding $hostname to $collection” -ForegroundColor Green
        Get-CMCollection -Name $collection | Add-CMDeviceCollectionDirectMembershipRule -ResourceId (Get-CMDevice -Name $hostname).ResourceID
        Invoke-CMCollectionUpdate -Name $collection
        Write-Host "done."
    }
}

Add-Host
Write-Host "Done adding to collections. Updating membership now."
Invoke-CMClientAction -DeviceName $hostname -ActionType ClientNotificationRequestMachinePolicyNow
Invoke-CMClientAction -DeviceName $hostname -ActionType ClientNotificationRequestSWInvNow
Write-Host "done."