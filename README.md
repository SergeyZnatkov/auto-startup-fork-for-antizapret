<<<<<<< Updated upstream
Auto-startup fork for Antizapret by Flowseal 

BUILD DOES NOT WORK!!!
=======
Auto-startup fork for Antizapret 
>>>>>>> Stashed changes

What does this fork do:

1. Automatically runs winws.exe, which used to overcome DPI censorship, at system startup

2. Hides the active window of winws.exe from the taskbar and all parent's bash windows (you  can still kill process by task manager)

3. Easily integrate itself into the system

No more annoying shortcuts in the taskbar!

------------------------------------------------------------------------------------------------

How to use:

1. Download the repository

2. Open RunInstaller.bat

3. Wait for a message: «Done! Task scheduled.»

4. Open run_hidden.vbs, wait a little bit, and close it

5. Reboot your PC

6. All done! Check for a winws.exe process in task manager. If it executes — enjoy the censorship-free net

------------------------------------------------------------------------------------------------

How it works:

1. Original DPI overcome functional is created by Flowseal:

https://github.com/Flowseal/zapret-discord-youtube

2. RunInstaller.bat executes the Installer.ps1 script

3. Installer.ps1 restarts PowerShell as admin, then creates a task in TaskSheduller, which will run AutoHide.ps1 at system startup

4. AutoHide.ps1 will hide all process of winws.exe

------------------------------------------------------------------------------------------------

Troubleshooting:

1. Ensure that you have admin permission 

2. Antivirus programs can detect this application as a hacker tool because it changes regedit.msc and TaskSheduller notes. Try to add folder to antivirus exception  

3. If winws.exe is in task manager, but you still have troubles with access to YouTube and Discord, then open run_hidden.vbs by notepad and modify line #8. Possible values list:

— general.bat

— general (ALT).bat

— general (ALT2).bat

— general (ALT3).bat

— general (ALT4).bat

— general (ALT5).bat

— general (FAKE TLS MOD ALT).bat

— general (FAKE TLS MOD AUTO).bat

— general (FAKE TLS MOD).bat— general (МГТС).bat

— general (МГТС).bat

Example:

Before
batPath = scriptDir & "\general (ALT3).bat" ' Path to .bat

After
batPath = scriptDir & "\general (ALT2).bat" ' Path to .bat

In case of any other problem, please send the issue



