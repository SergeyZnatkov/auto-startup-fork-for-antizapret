$processName = "winws"
$timeout = 45    # Waiting for a process, max-time
$interval = 5    # Checking interval
$timer = 0

# Waiting for a process
do {
    $process = Get-Process -Name $processName -ErrorAction SilentlyContinue
    if ($process) {
        Write-Host "Процесс найден!"
        break
    }
    Start-Sleep -Seconds $interval
    $timer += $interval
} while ($timer -lt $timeout)

if (-not $process) {
    Write-Host "Process did not run for $timeout seconds."
    exit
}

# Hidding windows
$process.MainWindowHandle | ForEach-Object {
    Add-Type -TypeDefinition @"
    using System; 
    using System.Runtime.InteropServices; 
    public class Win32 { 
        [DllImport("user32.dll")] 
        public static extern bool ShowWindow(IntPtr hWnd, int nCmdShow); 
    } 
"@
    [Win32]::ShowWindow($_, 0)
}