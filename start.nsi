# set the name of the installer
!include LogicLib.nsh

!include "keypage.nsh" 
Outfile "hello world.exe"
Page custom LicencePage_CreateFunction ; <<< This is your newly created Page
 
# create a default section.
!include "MUI.nsh"
 

 
Page Custom MyCustomPage MyCustomLeave
 
Function MyCustomPage
  # If you need to skip the page depending on a condition, call Abort.
    MessageBox MB_OK "Product Key was $varLicencePage.TextBox1.value "

FunctionEnd
 
Function MyCustomLeave
  # Form validation here. Call Abort to go back to the page.
  # Use !insertmacro MUI_INSTALLOPTIONS_READ $Var "InstallOptionsFile.ini" ...
  # to get values.
FunctionEnd
 
Section Dummy
SectionEnd