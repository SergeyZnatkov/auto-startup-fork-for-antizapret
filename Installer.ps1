# Auto restart as admin
if (-NOT ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    $ScriptPath = $MyInvocation.MyCommand.Path
    Start-Process powershell.exe -Verb RunAs -ArgumentList "-NoProfile -ExecutionPolicy Bypass -File `"$ScriptPath`""
    exit
}

try {
    Import-Module ScheduledTasks -ErrorAction Stop

    # Task variables
    $TaskName = "HideWinWS"
    $ScriptPath = Join-Path -Path $PSScriptRoot -ChildPath "AutoHide.ps1"
    $User = "$env:USERDOMAIN\$env:USERNAME"

    # Trigger creating
    $Trigger = New-ScheduledTaskTrigger -AtLogOn

    # Action creating
    $Action = New-ScheduledTaskAction -Execute "powershell.exe" `
        -Argument "-NoProfile -WindowStyle Hidden -ExecutionPolicy Bypass -File `"$ScriptPath`""

    # Task settings
    $Settings = New-ScheduledTaskSettingsSet `
        -AllowStartIfOnBatteries `
        -DontStopIfGoingOnBatteries `
        -StartWhenAvailable `
        -RestartInterval (New-TimeSpan -Minutes 1) `
        -RestartCount 3

    # Task registration
    Register-ScheduledTask `
        -TaskName $TaskName `
        -Trigger $Trigger `
        -Action $Action `
        -Settings $Settings `
        -User $User `
        -RunLevel Highest `
        -Force -ErrorAction Stop

    # Result message
    Write-Host "Done! Task scheduled." -ForegroundColor Green
    Start-Sleep -Seconds 5
}
catch {
    Write-Host "Error: $($_.Exception.Message)" -ForegroundColor Red
    Read-Host -Prompt "Press Enter to exit..."
}
finally {
    exit
}
