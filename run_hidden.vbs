Set objShell = CreateObject("WScript.Shell")
scriptPath = WScript.ScriptFullName 
regKey = "HKCU\Software\Microsoft\Windows\CurrentVersion\Run\" 

' Finding dir name
Set fso = CreateObject("Scripting.FileSystemObject")
scriptDir = fso.GetParentFolderName(scriptPath)
batPath = scriptDir & "\general (ALT3).bat" ' Path to .bat

' Checking regedit note
On Error Resume Next
existingEntry = objShell.RegRead(regKey & "AntizapretScript")
On Error GoTo 0

If IsEmpty(existingEntry) Then
    objShell.RegWrite regKey & "AntizapretScript", Chr(34) & scriptPath & Chr(34), "REG_SZ"
End If

'.bat startup
objShell.Run Chr(34) & batPath & Chr(34), 0, True