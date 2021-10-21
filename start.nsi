# set the name of the installer
Outfile "out.exe"
!include LogicLib.nsh
!include "MUI2.nsh"

!include FileFunc.nsh
!insertmacro GetTime
!include nsDialogs.nsh
!include LogicLib.nsh

Name nsDialogs
OutFile nsDialogs.exe
XPStyle on

Var Dialog
Var Label
Var Text

Page custom nsDialogsPage nsDialogsPageLeave


Function nsDialogsPage

	nsDialogs::Create 1018
	Pop $Dialog

	${If} $Dialog == error
		Abort
	${EndIf}


    ${GetTime} "" "L" $0 $1 $2 $3 $4 $5 $6
	; $0="01"      day
	; $1="04"      month
	; $2="2005"    year
	; $3="Friday"  day of week name
	; $4="16"      hour
	; $5="05"      minute
	; $6="50"      seconds
   
    
    Call GenerateKey
    


	${NSD_CreateLabel} 0 0 100% 12u "Hello, welcome to Al Khidma Systems"
	Pop $Label

	${NSD_CreateText} 0 13u 100% -13u "$2$1$0$4$5$6"
	Pop $Text
	${NSD_OnChange} $Text nsDialogsPageTextChange
    
	nsDialogs::Show

FunctionEnd

Function nsDialogsPageLeave

	${NSD_GetText} $Text $0
    
	
    ${If} $0 != $7
        MessageBox MB_OK "wrong Password"
        
		Abort
	${EndIf}
FunctionEnd



 
Function GenerateKey
  StrCpy $7 "84312344"
  StrCpy $7 "$7$5$6"
  StrCpy $7 "$767"
  StrCpy $7 "$7$5"
FunctionEnd

Function nsDialogsPageTextChange

	Pop $1 # $1 == $ Text

	${NSD_GetText} $Text $0

	${If} $0 == "hello"

		MessageBox MB_OK "right back at ya!"

	${EndIf}

FunctionEnd





 
# create a default section.

 
Section Dummy
SectionEnd