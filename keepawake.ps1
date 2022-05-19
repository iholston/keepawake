Write-Host "keepawake.ps1 running..."
$WShell = New-Object -com "Wscript.Shell"
while (1)
{
  $WShell.sendkeys("{SCROLLLOCK}")
  Start-Sleep -Milliseconds 100
  $WShell.sendkeys("{SCROLLLOCK}")
  Start-Sleep -Seconds 60
}
