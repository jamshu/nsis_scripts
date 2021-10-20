;--------------------------------------------
; Script generated with Install Designer
; Copyright (c) 2019 - 2021 unSigned, s. r. o.
; http://www.install-designer.com
;--------------------------------------------

; Install Designer - NSIS Project (v1.0.1.8) is running in Trial mode. This mode will end in 30 days, then you will have to purchase license.key! 
; Variables (Page & Controls) 

!include MUI2.nsh

Var varLicencePage.LicencePage
Var varLicencePage.Label2
Var varLicencePage.TextBox1

; Event handlers 

; Page creator function
Function LicencePage_CreateFunction
    ; Fonts

    ; LicencePage (Page)
    nsDialogs::Create 1018
    Pop $varLicencePage.LicencePage
    ${If} $varLicencePage.LicencePage == error
        Abort
    ${EndIf}

   

    !insertmacro MUI_HEADER_TEXT "Al Khidma Systems" "Licence"
    SetCtlColors $varLicencePage.LicencePage 0x000000 0xF0F0F0

    ; Label2 (Label)
    ${NSD_CreateLabel} 153 125 100 23  "Enter Product Key"
    Pop $varLicencePage.Label2
    EnableWindow $varLicencePage.Label2 1
    ShowWindow $varLicencePage.Label2 ${SW_SHOW}
    SetCtlColors $varLicencePage.Label2 0x000000 0xF0F0F0

    ; TextBox1 (Text)
    ${NSD_CreateText} 83 81 312 20  ""
    Pop $varLicencePage.TextBox1
    EnableWindow $varLicencePage.TextBox1 1
    ShowWindow $varLicencePage.TextBox1 ${SW_SHOW}
    ${NSD_Edit_SetReadOnly} $varLicencePage.TextBox1 0
    SetCtlColors $varLicencePage.TextBox1 0x000000 0xFFFFFF

    nsDialogs::Show
FunctionEnd
