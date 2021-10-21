# set the name of the installer
Outfile "hello world.exe"
!include LogicLib.nsh
!include "MUI2.nsh"
!include FileFunc.nsh
!insertmacro GetTime
!include nsDialogs.nsh
!include LogicLib.nsh

Name nsDialogs
OutFile "akskeygen.exe"
XPStyle on

Var Dialog
Var Label
Var Text
Page custom custompage 


Function custompage 
    !insertmacro MUI_HEADER_TEXT "AKS" "Tool" 

    nsDialogs::Create 1018
    Pop $0

    ${NSD_CreateLabel} 0 2u 100u 14u "First Key"
    Pop $Label
    ${NSD_CreateText} 150u 0 50u 12u "10"
    Pop $1
    ${NSD_SetTextLimit} $1 2

    ${NSD_CreateLabel} 0 19u 100u 14u "SecondKey "
    Pop $R0
    ${NSD_CreateText} 150u 17u 50u 12u "20"
    Pop $2
    ${NSD_SetTextLimit} $2 2
     
    



    ${NSD_CreateLabel} 0 28u 100u 14u "Serial Key"
    Pop $R0
    ${NSD_CreateText}  150 50u 60% -50u "Serial"
    Pop $3
    
   ${NSD_CreateFirstRadioButton} 0 62u 100u 14u "Generate"
    Pop $4
    ${NSD_OnClick} $4 nsDialogsPageTextChange


    nsDialogs::Show
FunctionEnd







Function nsDialogsPageTextChange

	Pop $4 # $1 == $ Text
    ${NSD_GetChecked} $4 $0
   
    ${If} $0 == "1"

		${NSD_GetText} $2 $6
        ${NSD_GetText} $1 $5
        Call GenerateKey
   
   
        ${NSD_SetText} $3 $7

	${EndIf}
   
	   
		



FunctionEnd


 
Function GenerateKey
  StrCpy $7 "84312344"
  StrCpy $7 "$7$5$6"
  StrCpy $7 "$767"
  StrCpy $7 "$7$5"
FunctionEnd






Section Dummy
SectionEnd