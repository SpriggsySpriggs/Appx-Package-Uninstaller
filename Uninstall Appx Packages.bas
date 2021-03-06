'$Console
'_Console On
$If 32BIT Then
    $ERROR Requires 64 Bit to run this code
$End If
': This program uses
': InForm - GUI library for QB64 - Beta version 8
': Fellippe Heitor, 2016-2018 - fellippe@qb64.org - @fellippeheitor
': https://github.com/FellippeHeitor/InForm
'-----------------------------------------------------------

': Controls' IDs: ------------------------------------------------------------------
Dim Shared UninstallAppxPackages As Long
Dim Shared ListBox1 As Long
Dim Shared UninstallBT As Long
Dim Shared appid%

Declare Dynamic Library "Shell32"
    Sub ShellExecute Alias "ShellExecuteA" (ByVal hwnd As _Offset, lpOperation As String, lpFile As String, lpParameters As String, lpDirectory As String, Byval nShowCmd As Integer)
End Declare

'$INCLUDE:'InForm\InForm.ui'
'$INCLUDE:'InForm\xp.uitheme'
'$INCLUDE:'Uninstall Appx Packages.frm'

': Event procedures: ---------------------------------------------------------------
Sub __UI_BeforeInit

End Sub

Sub __UI_OnLoad
    Dim As String cmd
    cmd = ">nul 2>&1 " + Chr$(34) + "%SYSTEMROOT%\system32\cacls.exe" + Chr$(34) + " " + Chr$(34) + "%SYSTEMROOT%\system32\config\system" + Chr$(34)
    errorlevel = _ShellHide(cmd)
    If errorlevel <> 0 Then
        ShellExecute 0, "runas" + Chr$(0), Command$(0) + Chr$(0), "", "", 5
        System
    End If
    UpdateList
End Sub

Sub __UI_BeforeUpdateDisplay
    'This event occurs at approximately 30 frames per second.
    'You can change the update frequency by calling SetFrameRate DesiredRate%

End Sub

Sub __UI_BeforeUnload
    'If you set __UI_UnloadSignal = False here you can
    'cancel the user's request to close.

End Sub

Sub __UI_Click (id As Long)
    Select Case id
        Case UninstallBT
            appName$ = GetItem$(ListBox1, appid%)
            If appName$ <> "" Then
                Dim As Long exit_code
                Dim As String stdout, stderr
                exit_code = pipecom("PowerShell Get-AppxPackage -AllUsers " + appName$ + " ^| Remove-AppxPackage", stdout, stderr)
                If exit_code = 0 Then
                    Answer = MessageBox("The appx package was uninstalled successfully", "Success", MsgBox_OkOnly)
                Else
                    Answer = MessageBox(stderr, "Error", MsgBox_OkOnly + MsgBox_Exclamation)
                End If
            End If
            UpdateList
        Case ListBox1

    End Select
End Sub

Sub __UI_MouseEnter (id As Long)
    Select Case id
        Case Form1

        Case ListBox1

    End Select
End Sub

Sub __UI_MouseLeave (id As Long)
    Select Case id
        Case Form1

        Case ListBox1

    End Select
End Sub

Sub __UI_FocusIn (id As Long)
    Select Case id
        Case ListBox1

    End Select
End Sub

Sub __UI_FocusOut (id As Long)
    'This event occurs right before a control loses focus.
    'To prevent a control from losing focus, set __UI_KeepFocus = True below.
    Select Case id
        Case ListBox1

    End Select
End Sub

Sub __UI_MouseDown (id As Long)
    Select Case id
        Case Form1

        Case ListBox1

    End Select
End Sub

Sub __UI_MouseUp (id As Long)
    Select Case id
        Case Form1

        Case ListBox1

    End Select
End Sub

Sub __UI_KeyPress (id As Long)
    'When this event is fired, __UI_KeyHit will contain the code of the key hit.
    'You can change it and even cancel it by making it = 0
    Select Case id
        Case ListBox1

    End Select
End Sub

Sub __UI_TextChanged (id As Long)
    Select Case id
    End Select
End Sub

Sub __UI_ValueChanged (id As Long)
    Select Case id
        Case ListBox1
            appid% = Control(ListBox1).Value
    End Select
End Sub

Sub __UI_FormResized

End Sub

Sub UpdateList
    ResetList ListBox1
    app$ = pipecom_lite("PowerShell $PSDefaultParameterValues['Out-File:Encoding'] = 'utf8';Get-AppxPackage ^| Select Name ^| ForEach-Object {$_.Name} ^| Sort-Object")
    Text(ListBox1) = app$
End Sub
'$INCLUDE:'pipecomqb64.bas'
