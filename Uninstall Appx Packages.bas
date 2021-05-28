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

'$INCLUDE:'InForm\InForm.ui'
'$INCLUDE:'InForm\xp.uitheme'
'$INCLUDE:'Uninstall Appx Packages.frm'

': Event procedures: ---------------------------------------------------------------
Sub __UI_BeforeInit

End Sub

Sub __UI_OnLoad
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
                Shell _Hide "PowerShell -NoProfile -ExecutionPolicy Bypass -Command " + Chr$(34) + "& {Start-Process PowerShell -ArgumentList 'Get-AppxPackage " + appName$ + " | Remove-AppxPackage'}" + Chr$(34)
                RemoveItem ListBox1, appid%
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
    app$ = pipecom_lite("PowerShell $PSDefaultParameterValues['Out-File:Encoding'] = 'utf8';Get-AppxPackage ^| Select Name ^| Sort-Object ^| ForEach-Object {$_.Name}")
    Text(ListBox1) = app$
End Sub
'$INCLUDE:'pipecomqb64.bas'
