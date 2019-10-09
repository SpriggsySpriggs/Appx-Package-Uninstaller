': This program uses
': InForm - GUI library for QB64 - Beta version 8
': Fellippe Heitor, 2016-2018 - fellippe@qb64.org - @fellippeheitor
': https://github.com/FellippeHeitor/InForm
'-----------------------------------------------------------

': Controls' IDs: ------------------------------------------------------------------
DIM SHARED UninstallAppxPackages AS LONG
DIM SHARED ListBox1 AS LONG
DIM SHARED UninstallBT AS LONG
DIM SHARED appid%

'$INCLUDE:'InForm\InForm.ui'
'$INCLUDE:'InForm\xp.uitheme'
'$INCLUDE:'test delete app.frm'

': Event procedures: ---------------------------------------------------------------
SUB __UI_BeforeInit
    OPEN "appslist.ps1" FOR OUTPUT AS #1
    PRINT #1, "$PSDefaultParameterValues['Out-File:Encoding'] = 'utf8'"
    PRINT #1, "Get-AppxPackage | Select Name | Sort-Object > " + CHR$(34) + _STARTDIR$ + "\apps.txt" + CHR$(34)
    CLOSE #1
    SHELL _HIDE "Powershell.exe -executionpolicy remotesigned -File  " + CHR$(34) + _STARTDIR$ + "\appslist.ps1" + CHR$(34)
    SHELL _HIDE _DONTWAIT "attrib +h " + CHR$(34) + _STARTDIR$ + "\appslist.ps1" + CHR$(34)
END SUB

SUB __UI_OnLoad
    OPEN "apps.txt" FOR BINARY AS #1
    LINE INPUT #1, app$: LINE INPUT #1, app$: LINE INPUT #1, app$
    DO
        LINE INPUT #1, app$
        IF app$ <> "" THEN
            AddItem ListBox1, app$
        END IF
    LOOP UNTIL EOF(1)
END SUB

SUB __UI_BeforeUpdateDisplay
    'This event occurs at approximately 30 frames per second.
    'You can change the update frequency by calling SetFrameRate DesiredRate%

END SUB

SUB __UI_BeforeUnload
    'If you set __UI_UnloadSignal = False here you can
    'cancel the user's request to close.

END SUB

SUB __UI_Click (id AS LONG)
    SELECT CASE id
        CASE UninstallBT
            appName$ = GetItem$(ListBox1, appid%)
            IF appName$ <> "" THEN
                SHELL _HIDE "PowerShell -NoProfile -ExecutionPolicy Bypass -Command " + CHR$(34) + "& {Start-Process PowerShell -ArgumentList 'Get-AppxPackage " + appName$ + " | Remove-AppxPackage'}" + CHR$(34)
                RemoveItem ListBox1, appid%
            END IF
        CASE ListBox1

    END SELECT
END SUB

SUB __UI_MouseEnter (id AS LONG)
    SELECT CASE id
        CASE Form1

        CASE ListBox1

    END SELECT
END SUB

SUB __UI_MouseLeave (id AS LONG)
    SELECT CASE id
        CASE Form1

        CASE ListBox1

    END SELECT
END SUB

SUB __UI_FocusIn (id AS LONG)
    SELECT CASE id
        CASE ListBox1

    END SELECT
END SUB

SUB __UI_FocusOut (id AS LONG)
    'This event occurs right before a control loses focus.
    'To prevent a control from losing focus, set __UI_KeepFocus = True below.
    SELECT CASE id
        CASE ListBox1

    END SELECT
END SUB

SUB __UI_MouseDown (id AS LONG)
    SELECT CASE id
        CASE Form1

        CASE ListBox1

    END SELECT
END SUB

SUB __UI_MouseUp (id AS LONG)
    SELECT CASE id
        CASE Form1

        CASE ListBox1

    END SELECT
END SUB

SUB __UI_KeyPress (id AS LONG)
    'When this event is fired, __UI_KeyHit will contain the code of the key hit.
    'You can change it and even cancel it by making it = 0
    SELECT CASE id
        CASE ListBox1

    END SELECT
END SUB

SUB __UI_TextChanged (id AS LONG)
    SELECT CASE id
    END SELECT
END SUB

SUB __UI_ValueChanged (id AS LONG)
    SELECT CASE id
        CASE ListBox1
            appid% = Control(ListBox1).Value
    END SELECT
END SUB

SUB __UI_FormResized

END SUB

