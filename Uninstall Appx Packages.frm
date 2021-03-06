': This form was generated by
': InForm - GUI library for QB64 - v1.3
': Fellippe Heitor, 2016-2020 - fellippe@qb64.org - @fellippeheitor
': https://github.com/FellippeHeitor/InForm
'-----------------------------------------------------------
Sub __UI_LoadForm

    Dim __UI_NewID As Long, __UI_RegisterResult As Long

    __UI_NewID = __UI_NewControl(__UI_Type_Form, "UninstallAppxPackages", 300, 300, 0, 0, 0)
    __UI_RegisterResult = 0
    SetCaption __UI_NewID, "Uninstall Appx Packages"
    Text(__UI_NewID) = "psc.ico"
    Control(__UI_NewID).Font = SetFont("segoeui.ttf", 12)
    Control(__UI_NewID).CenteredWindow = True

    __UI_NewID = __UI_NewControl(__UI_Type_ListBox, "ListBox1", 283, 249, 8, 41, 0)
    __UI_RegisterResult = 0
    Control(__UI_NewID).HasBorder = True
    Control(__UI_NewID).CanHaveFocus = True
    Control(__UI_NewID).BorderSize = 1

    __UI_NewID = __UI_NewControl(__UI_Type_Button, "UninstallBT", 80, 23, 211, 13, 0)
    __UI_RegisterResult = 0
    SetCaption __UI_NewID, "Uninstall"
    Control(__UI_NewID).CanHaveFocus = True

END SUB

SUB __UI_AssignIDs
    UninstallAppxPackages = __UI_GetID("UninstallAppxPackages")
    ListBox1 = __UI_GetID("ListBox1")
    UninstallBT = __UI_GetID("UninstallBT")
END SUB
