!include "MUI.nsh"
 
OutFile "myCustomPage.exe"
 
Page Custom MyCustomPage MyCustomLeave
 
Function MyCustomPage
  # If you need to skip the page depending on a condition, call Abort.
  ReserveFile "InstallOptionsFile.ini"
  !insertmacro MUI_INSTALLOPTIONS_EXTRACT "InstallOptionsFile.ini"
  !insertmacro MUI_INSTALLOPTIONS_DISPLAY "InstallOptionsFile.ini"
FunctionEnd
 
Function MyCustomLeave
  # Form validation here. Call Abort to go back to the page.
  # Use !insertmacro MUI_INSTALLOPTIONS_READ $Var "InstallOptionsFile.ini" ...
  # to get values.
FunctionEnd
 
Section Dummy
SectionEnd