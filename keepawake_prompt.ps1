Clear-Host
Write-Host "keepawake_prompt.ps1 running...`nPlease enter the time you would like this script to end."
while (1) {
    $EndHour = [int]$(Read-Host -Prompt "`nPlease enter the hour only. Military time (0-23)")
    if (($EndHour -ge 0) -and ($EndHour -lt 24)) {break}
    Clear-Host
    Write-Host "Invalid Number. Please enter number between 0 and 23. If the hour is a PM number simply add 12 to it. Example: 5:30 PM becomes 17:30 military time." 
}
while (1) {
    $EndMinute = [int]$(Read-Host -Prompt "`nPlease enter the minutes. Hour: $EndHour Minutes")
    if (($EndMinute -ge 0) -and ($EndMinute -lt 60)) {break}
    Clear-Host
    Write-Host "Invalid Number. Please enter number between 0 and 59 for the minutes." 
}
$TimeEnd = Get-Date -Hour $EndHour -Minute $EndMinute -Second 00 # Enter the time you want the script to end here. Hours are from 0-24. 17:30 = 5:30pm.
$WShell = New-Object -com "Wscript.Shell"
while ($(Get-Date) -lt $TimeEnd)
{
  Clear-Host
  Write-Host "keepalive_prompt.ps1 running until => $TimeEnd`n"
  Write-Host “$($TimeEnd.Subtract($(Get-Date)).ToString(“hh' hours 'mm' minutes 'ss")) seconds remaining.”
  $WShell.sendkeys("{SCROLLLOCK}")
  Start-Sleep -Milliseconds 100
  $WShell.sendkeys("{SCROLLLOCK}")
  Start-Sleep -Seconds 60
}
Clear-Host
Write-Host "$TimeEnd has passed. keepawake_prompt.ps1 exiting...`n"
