; Установщик Выживание в лесу для Windows (Inno Setup 6), ставится в профиль пользователя.
#define BuildNo GetEnv("BUILD_NO")
#if BuildNo == ""
  #define BuildNo "0"
#endif

[Setup]
AppId={{7D813F57-23C8-4BD3-94A0-8D3A1B827D82}
AppName=Выживание в лесу
AppVersion=1.0.{#BuildNo}
AppPublisher=Winter Hub
DefaultDirName={localappdata}\Programs\Forest Survival
DefaultGroupName=Выживание в лесу
DisableProgramGroupPage=yes
PrivilegesRequired=lowest
OutputDir=..\dist
OutputBaseFilename=Forest-Survival-Setup
Compression=lzma2
SolidCompression=yes
SetupIconFile=..\windows\runner\resources\app_icon.ico
UninstallDisplayIcon={app}\forest_survival.exe
CloseApplications=force
RestartApplications=no
WizardStyle=modern
ArchitecturesAllowed=x64compatible
ArchitecturesInstallIn64BitMode=x64compatible

[Languages]
Name: "ru"; MessagesFile: "compiler:Languages\Russian.isl"
Name: "en"; MessagesFile: "compiler:Default.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"

[Files]
Source: "..\build\windows\x64\runner\Release\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs

[Icons]
Name: "{group}\Выживание в лесу"; Filename: "{app}\forest_survival.exe"
Name: "{group}\{cm:UninstallProgram,Выживание в лесу}"; Filename: "{uninstallexe}"
Name: "{userdesktop}\Выживание в лесу"; Filename: "{app}\forest_survival.exe"; Tasks: desktopicon

[Run]
Filename: "{app}\forest_survival.exe"; Description: "{cm:LaunchProgram,Выживание в лесу}"; Flags: nowait postinstall skipifsilent
Filename: "{app}\forest_survival.exe"; Flags: nowait; Check: WizardSilent
