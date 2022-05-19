Clear-Host
Write-Host "keepalive.ps1 running..."
Write-Host "Please enter the time you would like this script to end."
while (1) {
    $EndHour = Read-Host -Prompt "`nPlease enter the hour only. Military style (0-23)"
    $EndHour = [int]$EndHour
    if (($EndHour -lt 0) -or ($EndHour -gt 23)) {
        Clear-Host
        Write-Host "Invalid Number."
        Write-Host "Please enter number between 0 and 23. If the hour is a PM number simply add 12 to it. Example 5:30 PM becomes 17:30 military time"
        continue
    }
    break
}
while (1) {
    $EndMinute = Read-Host -Prompt "`nPlease enter the minutes. Hour: $EndHour Minutes"
    $EndMinute = [int]$EndMinute
    if (($EndMinute -lt 0) -or ($EndMinute -gt 59)) {
        Clear-Host
        Write-Host "Invalid Number."
        Write-Host "Please enter number between 0 and 59 for the minutes."
        continue
    }
    break
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
Write-Host "$TimeEnd has passed. keepalive_time.ps1 exiting...`n"
