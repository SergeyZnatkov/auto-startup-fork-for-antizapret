Start-Sleep -Seconds 5
(Get-Process -Name "winws").MainWindowHandle | ForEach-Object { 
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