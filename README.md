Auto-startup fork for Antizapret by Flowseal 


What does this fork do:

1. Automatically runs winws.exe, which used to overcome DPI censorship, at system startup

2. Hides active window of winws.exe from taskbar and all parent's bash windows (you still can kill process by task manager)

3.Easily integrate itself to the system

No more annoying shortcut in taskbar!


How to use:

1. Download the repository

2. Open RunInstaller.bat

3. Wait for a message «Done! Task scheduled.»

4. Open run_hidden.vbs wait a little bit and close it

4. Reboot your PC

5. All done! Check for a winws.exe process in task manager. If it executes — enjoy the censorship free net

------------------------------------------------------------------------------------------------

How it works?

1. Original DPI overcome functional is created by Flowseal:
https://github.com/Flowseal/zapret-discord-youtube

2. RunInstaller.bat executes Installer.ps1 script

3. Installer.ps1 restarts PowerShell as admin then create a task in TaskSheduller, which will run AutoHide.ps1 at system startup

4. AutoHide.ps1 will hide all process of winws.exe

Troubleshooting:

1. Ensure that you have admin permission 

2. If winws.exe is in task manager, but you still has promblems with access to YouTube and Discord, than:

-open run_hidden.vbs by notepad and modify line #8, just change number after ALT. Possible values (2-5)

Example:

Before
batPath = scriptDir & "\general (ALT3).bat" ' Path to .bat
After
batPath = scriptDir & "\general (ALT2).bat" ' Path to .bat

In case of any other problem, please send issue



