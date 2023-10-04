Add-Type -Name Window -Namespace Console -MemberDefinition '
[DllImport("Kernel32.dll")]
public static extern IntPtr GetConsoleWindow();

[DllImport("user32.dll")]
public static extern bool ShowWindow(IntPtr hWnd, Int32 nCmdShow);'

[Console.Window]::ShowWindow([Console.Window]::GetConsoleWindow(), 0)
<# 
.NAME
    SilentInstaller
#>
Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Application]::EnableVisualStyles()

$SilentInstaller                 = New-Object system.Windows.Forms.Form
$SilentInstaller.ClientSize      = New-Object System.Drawing.Point(920,440)
$SilentInstaller.text            = "Silent Software Installer"
$SilentInstaller.TopMost         = $false
$SilentInstaller.icon            = "Data\install.ico"
$SilentInstallerImage            = [system.drawing.image]::FromFile("Data\Background.bmp")
$SilentInstaller.BackgroundImage = $SilentInstallerImage
$SilentInstaller.BackColor       = [System.Drawing.ColorTranslator]::FromHtml("#eff4ff")
$SilentInstaller.FormBorderStyle = [System.Windows.Forms.FormBorderStyle]::FixedSingle
$SilentInstaller.MaximizeBox     = $false
$SilentInstaller.MinimizeBox     = $false

$Button1                         = New-Object system.Windows.Forms.Button
$Button1.text                    = "Vollständig ohne Java"
$Button1.width                   = 250
$Button1.height                  = 40
$Button1.location                = New-Object System.Drawing.Point(20,140)
$Button1.Font                    = New-Object System.Drawing.Font('Britannic',11,[System.Drawing.FontStyle]([System.Drawing.FontStyle]::Bold))
$Button1.BackColor               = [System.Drawing.ColorTranslator]::FromHtml("#eff4ff")

$Button2                         = New-Object system.Windows.Forms.Button
$Button2.text                    = "ohne Java und Thunderbird"
$Button2.width                   = 250
$Button2.height                  = 40
$Button2.location                = New-Object System.Drawing.Point(20,200)
$Button2.Font                    = New-Object System.Drawing.Font('Britannic',11,[System.Drawing.FontStyle]([System.Drawing.FontStyle]::Bold))
$Button2.BackColor               = [System.Drawing.ColorTranslator]::FromHtml("#eff4ff")

$Button3                         = New-Object system.Windows.Forms.Button
$Button3.text                    = "Vollständige Installation"
$Button3.width                   = 250
$Button3.height                  = 40
$Button3.location                = New-Object System.Drawing.Point(20,260)
$Button3.Font                    = New-Object System.Drawing.Font('Britannic',11,[System.Drawing.FontStyle]([System.Drawing.FontStyle]::Bold))
$Button3.BackColor               = [System.Drawing.ColorTranslator]::FromHtml("#eff4ff")

$Button4                         = New-Object system.Windows.Forms.Button
$Button4.text                    = "Vollständig ohne Thunderbird"
$Button4.width                   = 250
$Button4.height                  = 40
$Button4.location                = New-Object System.Drawing.Point(20,320)
$Button4.Font                    = New-Object System.Drawing.Font('Britannic',11,[System.Drawing.FontStyle]([System.Drawing.FontStyle]::Bold))
$Button4.BackColor               = [System.Drawing.ColorTranslator]::FromHtml("#eff4ff")

$Button5                         = New-Object system.Windows.Forms.Button
$Button5.text                    = "Readme"
$Button5.width                   = 250
$Button5.height                  = 40
$Button5.location                = New-Object System.Drawing.Point(20,380)
$Button5.Font                    = New-Object System.Drawing.Font('Britannic',11,[System.Drawing.FontStyle]([System.Drawing.FontStyle]::Bold))
$Button5.BackColor               = [System.Drawing.ColorTranslator]::FromHtml("#eff4ff")

$LabelFirefox                    = New-Object system.Windows.Forms.Label
$LabelFirefox.text               = ""
$LabelFirefox.AutoSize           = $true
$LabelFirefox.width              = 200
$LabelFirefox.height             = 20
$LabelFirefox.location           = New-Object System.Drawing.Point(640,180)
$LabelFirefox.Font               = New-Object System.Drawing.Font('Microsoft Sans Serif',15,[System.Drawing.FontStyle]([System.Drawing.FontStyle]::Bold))
$LabelFirefox.ForeColor          = [System.Drawing.ColorTranslator]::FromHtml("")
$LabelFirefox.BackColor          = [System.Drawing.Color]::Transparent

$LabelChrome                     = New-Object system.Windows.Forms.Label
$LabelChrome.text                = ""
$LabelChrome.AutoSize            = $true
$LabelChrome.width               = 200
$LabelChrome.height              = 10
$LabelChrome.location            = New-Object System.Drawing.Point(640,220)
$LabelChrome.Font                = New-Object System.Drawing.Font('Microsoft Sans Serif',15,[System.Drawing.FontStyle]([System.Drawing.FontStyle]::Bold))
$LabelChrome.ForeColor           = [System.Drawing.ColorTranslator]::FromHtml("")
$LabelChrome.BackColor           = [System.Drawing.Color]::Transparent

$LabelThunderbird                = New-Object system.Windows.Forms.Label
$LabelThunderbird.text           = ""
$LabelThunderbird.AutoSize       = $true
$LabelThunderbird.width          = 200
$LabelThunderbird.height         = 10
$LabelThunderbird.location       = New-Object System.Drawing.Point(640,260)
$LabelThunderbird.Font           = New-Object System.Drawing.Font('Microsoft Sans Serif',15,[System.Drawing.FontStyle]([System.Drawing.FontStyle]::Bold))
$LabelThunderbird.ForeColor      = [System.Drawing.ColorTranslator]::FromHtml("")
$LabelThunderbird.BackColor      = [System.Drawing.Color]::Transparent

$LabelVLC                        = New-Object system.Windows.Forms.Label
$LabelVLC.text                   = ""
$LabelVLC.AutoSize               = $true
$LabelVLC.width                  = 200
$LabelVLC.height                 = 10
$LabelVLC.location               = New-Object System.Drawing.Point(640,300)
$LabelVLC.Font                   = New-Object System.Drawing.Font('Microsoft Sans Serif',15,[System.Drawing.FontStyle]([System.Drawing.FontStyle]::Bold))
$LabelVLC.ForeColor              = [System.Drawing.ColorTranslator]::FromHtml("")
$LabelVLC.BackColor              = [System.Drawing.Color]::Transparent

$LabelAdobe                      = New-Object system.Windows.Forms.Label
$LabelAdobe.text                 = ""
$LabelAdobe.AutoSize             = $true
$LabelAdobe.width                = 200
$LabelAdobe.height               = 10
$LabelAdobe.location             = New-Object System.Drawing.Point(640,340)
$LabelAdobe.Font                 = New-Object System.Drawing.Font('Microsoft Sans Serif',15,[System.Drawing.FontStyle]([System.Drawing.FontStyle]::Bold))
$LabelAdobe.ForeColor            = [System.Drawing.ColorTranslator]::FromHtml("")
$LabelAdobe.BackColor            = [System.Drawing.Color]::Transparent

$LabelJava                       = New-Object system.Windows.Forms.Label
$LabelJava.text                  = ""
$LabelJava.AutoSize              = $true
$LabelJava.width                 = 200
$LabelJava.height                = 10
$LabelJava.location              = New-Object System.Drawing.Point(640,380)
$LabelJava.Font                  = New-Object System.Drawing.Font('Microsoft Sans Serif',15,[System.Drawing.FontStyle]([System.Drawing.FontStyle]::Bold))
$LabelJava.ForeColor             = [System.Drawing.ColorTranslator]::FromHtml("")
$LabelJava.BackColor             = [System.Drawing.Color]::Transparent

$Label8                          = New-Object system.Windows.Forms.Label
$Label8.text                     = "Initialisierung"
$Label8.AutoSize                 = $true
$Label8.width                    = 25
$Label8.height                   = 10
$Label8.location                 = New-Object System.Drawing.Point(580,45)
$Label8.Font                     = New-Object System.Drawing.Font('Microsoft Sans Serif',28)
$Label8.ForeColor                = [System.Drawing.ColorTranslator]::FromHtml("White")
$Label8.BackColor                = [System.Drawing.Color]::Transparent

$SilentInstaller.controls.AddRange(@($Button1,$Button2,$Button3,$Button4,$Button5,$Panel1,$LabelFirefox,$LabelChrome,$LabelThunderbird,$LabelVLC,$LabelAdobe,$LabelJava,$Label8))

#region Logic 

$Button1.Add_Click({InstallVersion1})
$Button2.Add_Click({InstallVersion2})
$Button3.Add_Click({InstallVersion3})
$Button4.Add_Click({InstallVersion4})
$Button5.Add_Click({Readme})

$Firefox = {  
    if (Get-ItemProperty HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\* | Where-Object { $_.DisplayName -match "Firefox" }) {
        $LabelFirefox.Text = "Ist bereits Installiert"
        $LabelFirefox.ForeColor = [System.Drawing.ColorTranslator]::FromHtml("#00A100")
      }
      else {
          if (Test-Path .\Files\Firefox*.exe -PathType Leaf) {
              $LabelFirefox.Text = "Installiere..."
              $LabelFirefox.ForeColor = [System.Drawing.ColorTranslator]::FromHtml("#a31f1f")
              Start-Process -Wait -FilePath .\Files\Firefox*.exe -Argument "-ms -ma" -PassThru | Out-Null
              $LabelFirefox.Text = "Installiert"
              $LabelFirefox.ForeColor = [System.Drawing.ColorTranslator]::FromHtml("#00A100")
          }
          else {
              $LabelFirefox.Text = "FEHLER"
              $LabelFirefox.ForeColor = [System.Drawing.ColorTranslator]::FromHtml("#a31f1f")
          }
      }
    }

$Chrome = {
  $chromePath = Get-ItemProperty 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\chrome.exe' -ErrorAction SilentlyContinue | Select-Object -ExpandProperty '(Default)'
    if ($chromePath -ne $null) {
    $LabelChrome.Text = "Ist bereits Installiert"
    $LabelChrome.ForeColor = [System.Drawing.ColorTranslator]::FromHtml("#00A100")
}
else {
    if (Test-Path .\Files\chrome*.exe -PathType Leaf) {
        $LabelChrome.Text = "Installiere..."
        $LabelChrome.ForeColor = [System.Drawing.ColorTranslator]::FromHtml("#a31f1f")
        Start-Process -Wait -FilePath .\Files\chrome*.exe -Argument "/silent /install" -PassThru | Out-Null
        $LabelChrome.Text = "Installiert"
        $LabelChrome.ForeColor = [System.Drawing.ColorTranslator]::FromHtml("#00A100")
    }
    else {
        $LabelChrome.Text = "FEHLER"
        $LabelChrome.ForeColor = [System.Drawing.ColorTranslator]::FromHtml("#a31f1f")
    }
}
}

$Thunderbird = {
    if (Get-ItemProperty HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\* | Where-Object { $_.DisplayName -match "Thunderbird" }) {
        $LabelThunderbird.Text = "Ist bereits Installiert"
        $LabelThunderbird.ForeColor = [System.Drawing.ColorTranslator]::FromHtml("#00A100")
  }
  else {
      if (Test-Path .\Files\thunderbird*.exe -PathType Leaf) {
        $LabelThunderbird.Text = "Installiere..."
        $LabelThunderbird.ForeColor = [System.Drawing.ColorTranslator]::FromHtml("#a31f1f")
        Start-Process -Wait -FilePath .\Files\thunderbird*.exe -Argument "/S /quiet" -PassThru | Out-Null
        $LabelThunderbird.Text = "Installiert"
        $LabelThunderbird.ForeColor = [System.Drawing.ColorTranslator]::FromHtml("#00A100")
      }
      else {
        $LabelThunderbird.Text = "FEHLER"
        $LabelThunderbird.ForeColor = [System.Drawing.ColorTranslator]::FromHtml("#a31f1f")
      }
  }
}

$VLC = {
  if (Get-ItemProperty HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\* | Where-Object { $_.DisplayName -match "VLC" }) {
    $LabelVLC.Text = "Ist bereits Installiert"
    $LabelVLC.ForeColor = [System.Drawing.ColorTranslator]::FromHtml("#00A100")
  }
  else {
      if (Test-Path .\Files\vlc*.exe -PathType Leaf) {
        $LabelVLC.Text = "Installiere..."
        $LabelVLC.ForeColor = [System.Drawing.ColorTranslator]::FromHtml("#a31f1f")
        Start-Process -Wait -FilePath .\Files\vlc*.exe -Argument "/S /L=1031" -PassThru | Out-Null
        $LabelVLC.Text = "Installiert"
        $LabelVLC.ForeColor = [System.Drawing.ColorTranslator]::FromHtml("#00A100")
      }
      else {
        $LabelVLC.Text = "FEHLER"
        $LabelVLC.ForeColor = [System.Drawing.ColorTranslator]::FromHtml("#a31f1f")
      }
  }
}

$AdobeReaderDC = {
  if(Get-ItemProperty HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\* | Where-Object { $_.DisplayName -Match "Adobe" }) {
    $LabelAdobe.Text = "Ist bereits Installiert"
    $LabelAdobe.ForeColor = [System.Drawing.ColorTranslator]::FromHtml("#00A100")
  }
  else {
      if (Test-Path .\Files\AcroRdrDC*.exe -PathType Leaf) {
        $LabelAdobe.Text = "Installiere..."
        $LabelAdobe.ForeColor = [System.Drawing.ColorTranslator]::FromHtml("#a31f1f")
        Start-Process -Wait -FilePath .\Files\AcroRdrDC*.exe -Argument "/sAll /rs /msi EULA_ACCEPT=YES" -PassThru | Out-Null
        $LabelAdobe.Text = "Installiert"
        $LabelAdobe.ForeColor = [System.Drawing.ColorTranslator]::FromHtml("#00A100")
      }
      else {
        $LabelAdobe.Text = "FEHLER"
        $LabelAdobe.ForeColor = [System.Drawing.ColorTranslator]::FromHtml("#a31f1f")
      }
  }
}

$Java = {
  if(Get-ItemProperty HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\* | Where-Object { $_.DisplayName -Match "Java" }) {
    $LabelJava.Text = "Ist bereits Installiert"
    $LabelJava.ForeColor = [System.Drawing.ColorTranslator]::FromHtml("#00A100")
  }
  else {
      if(Test-Path .\Files\jre*.exe -PathType Leaf) {
        $LabelJava.Text = "Installiere..."
        $LabelJava.ForeColor = [System.Drawing.ColorTranslator]::FromHtml("#a31f1f")
        Start-Process -Wait -FilePath .\Files\jre*.exe -Argument "/s" -PassThru | Out-Null
        $LabelJava.Text = "Installiert"
        $LabelJava.ForeColor = [System.Drawing.ColorTranslator]::FromHtml("#00A100")
     }
     else {
        $LabelJava.Text = "FEHLER"
        $LabelJava.ForeColor = [System.Drawing.ColorTranslator]::FromHtml("#a31f1f")
        }
    }
}

function InstallVersion1{
            $Label8.text                     = "Installiere..."  
            & $Firefox
            & $Chrome
            & $Thunderbird
            & $VLC
            & $AdobeReaderDC
            $LabelJava.Text = "Übersprungen"
            $LabelJava.ForeColor = [System.Drawing.ColorTranslator]::FromHtml("#a31f1f")
            $Label8.text                     = "Abgeschlossen"
}
function InstallVersion2{
            $Label8.text                     = "Installiere..."
            & $Firefox
            & $Chrome
            $LabelThunderbird.Text = "Übersprungen"
            $LabelThunderbird.ForeColor = [System.Drawing.ColorTranslator]::FromHtml("#a31f1f")
            & $VLC
            & $AdobeReaderDC
            $LabelJava.Text = "Übersprungen"
            $LabelJava.ForeColor = [System.Drawing.ColorTranslator]::FromHtml("#a31f1f")
            $Label8.text                     = "Abgeschlossen"
}

function InstallVersion3{
            $Label8.text                     = "Installiere..."
            & $Firefox
            & $Chrome
            & $Thunderbird
            & $VLC
            & $AdobeReaderDC
            & $Java
            $Label8.text                     = "Abgeschlossen"
}

function InstallVersion4{
            $Label8.text                     = "Installiere..."
            & $Firefox
            & $Chrome
            $LabelThunderbird.Text = "Übersprungen"
            $LabelThunderbird.ForeColor = [System.Drawing.ColorTranslator]::FromHtml("#a31f1f")
            & $VLC
            & $AdobeReaderDC
            & $Java
            $Label8.text                     = "Abgeschlossen"
}

function Readme{
            Start-Process "https://github.com/IG-Community/Silent-Software-Installer-Unattended-Script"
}

$null = $form.Add_Shown({
  $form.Size = $form.Size
})

#endregion
[void]$SilentInstaller.ShowDialog()
