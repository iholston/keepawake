$TimeEnd = Get-Date -Hour 17 -Minute 30 -Second 00 # Enter the time you want the script to end here. Hours are from 0-23. 17:30 = 5:30pm.
$WShell = New-Object -com "Wscript.Shell"
while ($(Get-Date) -lt $TimeEnd)
{
  Clear-Host
  Write-Host "keepawake_time.ps1 running until => $TimeEnd`n"
  Write-Host “$($TimeEnd.Subtract($(Get-Date)).ToString(“hh' hours 'mm' minutes 'ss")) seconds remaining.”
  $WShell.sendkeys("{SCROLLLOCK}")
  Start-Sleep -Milliseconds 100
  $WShell.sendkeys("{SCROLLLOCK}")
  Start-Sleep -Seconds 60
}
Clear-Host
Write-Host "$TimeEnd has passed. keepawake_time.ps1 exiting...`n"
