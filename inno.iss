; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define MyAppName "Estacao"
#define MyAppVersion "1.5"
#define MyAppPublisher "Gustavo Lima"
#define MyAppExeName "Desktop.exe"
#define MyAppAssocName MyAppName + " bar"
#define MyAppAssocExt ".myp"
#define MyAppAssocKey StringChange(MyAppAssocName, " ", "") + MyAppAssocExt

[Setup]
; NOTE: The value of AppId uniquely identifies this application. Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{99134D49-72DC-4BF9-AED0-CFD3DF70A63B}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
;AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
DefaultDirName={autopf}\{#MyAppName}
ChangesAssociations=yes
DisableProgramGroupPage=yes
; Uncomment the following line to run in non administrative install mode (install for current user only.)
;PrivilegesRequired=lowest
OutputDir=C:\Users\gugag\OneDrive\�rea de Trabalho
OutputBaseFilename=EstacaoInstalador
SetupIconFile=C:\Users\gugag\OneDrive\�rea de Trabalho\Estacao\logoEstacao.ico
Compression=lzma
SolidCompression=yes
WizardStyle=modern

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked

[Files]
Source: "C:\Users\gugag\OneDrive\�rea de Trabalho\Estacao\Desktop\Desktop\bin\Debug\{#MyAppExeName}"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\gugag\OneDrive\�rea de Trabalho\Estacao\Desktop\Desktop\bin\Debug\banco.bat"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\gugag\OneDrive\�rea de Trabalho\Estacao\Desktop\Desktop\bin\Debug\Desktop.exe.config"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\gugag\OneDrive\�rea de Trabalho\Estacao\Desktop\Desktop\bin\Debug\Desktop.pdb"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\gugag\OneDrive\�rea de Trabalho\Estacao\Desktop\Desktop\bin\Debug\EntityFramework.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\gugag\OneDrive\�rea de Trabalho\Estacao\Desktop\Desktop\bin\Debug\EntityFramework.SqlServer.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\gugag\OneDrive\�rea de Trabalho\Estacao\Desktop\Desktop\bin\Debug\EntityFramework.SqlServer.xml"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\gugag\OneDrive\�rea de Trabalho\Estacao\Desktop\Desktop\bin\Debug\EntityFramework.xml"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\gugag\OneDrive\�rea de Trabalho\Estacao\Desktop\Desktop\bin\Debug\execucao.log"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\gugag\OneDrive\�rea de Trabalho\Estacao\Desktop\Desktop\bin\Debug\script.sql"; DestDir: "{app}"; Flags: ignoreversion
; NOTE: Don't use "Flags: ignoreversion" on any shared system files

[Registry]
Root: HKA; Subkey: "Software\Classes\{#MyAppAssocExt}\OpenWithProgids"; ValueType: string; ValueName: "{#MyAppAssocKey}"; ValueData: ""; Flags: uninsdeletevalue
Root: HKA; Subkey: "Software\Classes\{#MyAppAssocKey}"; ValueType: string; ValueName: ""; ValueData: "{#MyAppAssocName}"; Flags: uninsdeletekey
Root: HKA; Subkey: "Software\Classes\{#MyAppAssocKey}\DefaultIcon"; ValueType: string; ValueName: ""; ValueData: "{app}\{#MyAppExeName},0"
Root: HKA; Subkey: "Software\Classes\{#MyAppAssocKey}\shell\open\command"; ValueType: string; ValueName: ""; ValueData: """{app}\{#MyAppExeName}"" ""%1"""
Root: HKA; Subkey: "Software\Classes\Applications\{#MyAppExeName}\SupportedTypes"; ValueType: string; ValueName: ".myp"; ValueData: ""

[Icons]
Name: "{autoprograms}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"
Name: "{autodesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon

[Run]
Filename: "{app}\{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Flags: nowait postinstall skipifsilent
Filename: "{app}\banco.bat"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Flags: nowait postinstall skipifsilent