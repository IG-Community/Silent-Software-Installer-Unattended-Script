# Loading the required DLLs
Add-Type -Name Window -Namespace Console -MemberDefinition '
[DllImport("Kernel32.dll")]
public static extern IntPtr GetConsoleWindow();

[DllImport("user32.dll")]
public static extern bool ShowWindow(IntPtr hWnd, Int32 nCmdShow);'

# Hide the console
[Console.Window]::ShowWindow([Console.Window]::GetConsoleWindow(), 0)

# Initialization of the Windows Forms
Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Application]::EnableVisualStyles()

function New-Button {
    param (
        [string]$text,
        [int]$x,
        [int]$y,
        [int]$width,
        [int]$height,
        [string]$name
    )

    $button = New-Object System.Windows.Forms.Button
    $button.Text = $text
    $button.Width = $width
    $button.Height = $height
    $button.Location = New-Object System.Drawing.Point($x, $y)
    $button.Font = New-Object System.Drawing.Font('Microsoft Sans Serif', 11, [System.Drawing.FontStyle]::Bold)
    $button.BackColor = [System.Drawing.ColorTranslator]::FromHtml("#eff4ff")
    $button.Name = $name

    return $button
}

# Function for creating labels
function New-Label {
    param (
        [int]$x,
        [int]$y,
        [int]$width,
        [string]$name
    )

    $label = New-Object System.Windows.Forms.Label
    $label.AutoSize = $true
    $label.Width = $width
    $label.Height = 10
    $label.Location = New-Object System.Drawing.Point($x, $y)
    $label.Font = New-Object System.Drawing.Font('Microsoft Sans Serif', 15, [System.Drawing.FontStyle]::Bold)
    $label.ForeColor = [System.Drawing.Color]::Black
    $label.BackColor = [System.Drawing.Color]::Transparent
    $label.Name = $name

    return $label
}

# Create the main window
$SilentInstaller = New-Object System.Windows.Forms.Form
$SilentInstaller.ClientSize = New-Object System.Drawing.Point(920, 440)
$SilentInstaller.Text = "Silent Software Installer"
$SilentInstaller.TopMost = $false

$base64Icon = @"
"BASE64-DATA-FOR-YOUR-ICO-FILE-HERE"
"@
$iconBytes = [System.Convert]::FromBase64String($base64Icon)
$memoryStreamIcon = [System.IO.MemoryStream]::new($iconBytes)
$icon = [System.Drawing.Icon]::new($memoryStreamIcon)
$SilentInstaller.Icon = $icon

$base64Image = @"
"BASE64-DATA-FOR-YOUR-BACKGROUND-IMAGE-HERE"
"@
$memoryStreamImage = [System.IO.MemoryStream]::new([System.Convert]::FromBase64String($base64Image))
$backgroundImage = [System.Drawing.Image]::FromStream($memoryStreamImage)
$SilentInstaller.BackgroundImage = $backgroundImage
$SilentInstaller.BackColor = [System.Drawing.ColorTranslator]::FromHtml("#eff4ff")
$SilentInstaller.FormBorderStyle = [System.Windows.Forms.FormBorderStyle]::FixedSingle
$SilentInstaller.MaximizeBox = $false
$SilentInstaller.MinimizeBox = $false

# Create buttons and labels with the created functions
$Button1 = New-Button -text "Completely without Java" -x 10 -y 140 -width 240 -height 40 -name "Button1"
$Button2 = New-Button -text "Completely without Java and Tb" -x 10 -y 190 -width 240 -height 40 -name "Button2"
$Button3 = New-Button -text "Complete installation" -x 10 -y 240 -width 240 -height 40 -name "Button3"
$Button4 = New-Button -text "Completely without Thunderbird" -x 10 -y 290 -width 240 -height 40 -name "Button4"
$Button5 = New-Button -text "Readme" -x 10 -y 385 -width 240 -height 40 -name "Button5"

$LabelFirefox = New-Label -x 640 -y 166 -width 200 -name "LabelFirefox"
$LabelChrome = New-Label -x 640 -y 206 -width 200 -name "LabelChrome"
$LabelThunderbird = New-Label -x 640 -y 246 -width 200 -name "LabelThunderbird"
$LabelVLC = New-Label -x 640 -y 286 -width 200 -name "LabelVLC"
$LabelAdobe = New-Label -x 640 -y 326 -width 200 -name "LabelAdobe"
$LabelJava = New-Label -x 640 -y 366 -width 200 -name "LabelJava"
$LabelStatus = New-Label -x 580 -y 45 -width 25 -name "Label8"
$LabelStatus.Text = "Initialization.."
$LabelStatus.Font = New-Object System.Drawing.Font('Microsoft Sans Serif', 26)
$LabelStatus.ForeColor = [System.Drawing.ColorTranslator]::FromHtml("Blue")

# Adding the controls to the main window
$SilentInstaller.controls.AddRange(@($Button1,$Button2,$Button3,$Button4,$Button5,$LabelFirefox,$LabelChrome,$LabelThunderbird,$LabelVLC,$LabelAdobe,$LabelJava,$LabelStatus))

# Configuration of the individual buttons
$Button1.Add_Click({
  labelclear
  Firefox
  Chrome
  Thunderbird
  VLC
  AdobeReaderDC
  $LabelJava.Text        = "Skipped"
  $LabelJava.ForeColor = [System.Drawing.ColorTranslator]::FromHtml("#a31f1f")
  $LabelStatus.Text      = "Completed"
})

$Button2.Add_Click({
  labelclear
  Firefox
  Chrome
  $LabelThunderbird.Text        = "Skipped"
  $LabelThunderbird.ForeColor = [System.Drawing.ColorTranslator]::FromHtml("#a31f1f")
  VLC
  AdobeReaderDC
  $LabelJava.Text        = "Skipped"
  $LabelJava.ForeColor = [System.Drawing.ColorTranslator]::FromHtml("#a31f1f")
  $LabelStatus.Text      = "Completed"
})

$Button3.Add_Click({
  labelclear
  Firefox
  Chrome
  Thunderbird
  VLC
  AdobeReaderDC
  Java
  $LabelStatus.Text      = "Completed"
})

$Button4.Add_Click({
  labelclear
  Firefox
  Chrome
  $LabelThunderbird.Text        = "Skipped"
  $LabelThunderbird.ForeColor = [System.Drawing.ColorTranslator]::FromHtml("#a31f1f")
  VLC
  AdobeReaderDC
  Java
  $LabelStatus.Text      = "Completed"
})

$Button5.Add_Click({
  Start-Process "https://github.com/IG-Community/Silent-Software-Installer-Unattended-Script"
})

#Preparations of the Indiviual Installation Files
function Firefox {  
  $checkCommand = Get-ItemProperty HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\* | Where-Object { $_.DisplayName -match "Firefox" }
  $installCommand = ".\Files\Firefox*.exe"
  $installArguments = "-ms -ma"
  Install-Software $installCommand $installArguments "LabelFirefox" $checkCommand
}

function Chrome {
  $checkCommand =  Get-ItemProperty 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\chrome.exe' -ErrorAction SilentlyContinue | Select-Object -ExpandProperty '(Default)'
  $installCommand = ".\Files\chrome*.exe"
  $installArguments = "/silent /install"
  Install-Software $installCommand $installArguments "LabelChrome" $checkCommand
}

function Thunderbird {
  $checkCommand = Get-ItemProperty HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\* | Where-Object { $_.DisplayName -match "Thunderbird" }
  $installCommand = ".\Files\Thunderbird*.exe"
  $installArguments = "/S /quiet"
  Install-Software $installCommand $installArguments "LabelThunderbird" $checkCommand
}

function VLC {
  $checkCommand = Get-ItemProperty HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\* | Where-Object { $_.DisplayName -match "VLC" }
  $installCommand = ".\Files\vlc*.exe"
  $installArguments = "/S /L=1031"
  Install-Software $installCommand $installArguments "LabelVLC" $checkCommand

}

function AdobeReaderDC {
  $checkCommand = Get-ItemProperty HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\* | Where-Object { $_.DisplayName -Match "Adobe" }
  $installCommand = ".\Files\AcroRdrDC*.exe"
  $installArguments = "/sAll /rs /msi EULA_ACCEPT=YES"
  Install-Software $installCommand $installArguments "LabelAdobe" $checkCommand
}

function Java {
  $checkCommand = Get-ItemProperty HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\* | Where-Object { $_.DisplayName -Match "Java" }
  $installCommand = ".\Files\jre*.exe"
  $installArguments = "/s"
  Install-Software $installCommand $installArguments "LabelJava" $checkCommand
}

function labelclear {
  $LabelStatus.Text      = "In progress.."
  $LabelFirefox.Text     = ""
  $LabelChrome.Text      = ""
  $LabelThunderbird.Text = ""
  $LabelVLC.Text         = ""
  $LabelAdobe.Text       = ""
  $LabelJava.Text        = ""
}

#Performing the installation
function Install-Software {
  param (
      [string]$installCommand,
      [string]$installArguments,
      [string]$labelVariable,
      [object]$checkCommand
  )

  $label = $SilentInstaller.Controls.Find($labelVariable, $true)[0]
  $label.Text = "Check installation..."
  $label.ForeColor = [System.Drawing.ColorTranslator]::FromHtml("#a31f1f")

  if ($checkCommand) {
      $label.Text = "Is already installed"
      $label.ForeColor = [System.Drawing.ColorTranslator]::FromHtml("#00A100")
  } elseif (Test-Path $installCommand -PathType Leaf) {
      $label.Text = "Installing..."
      $label.ForeColor = [System.Drawing.ColorTranslator]::FromHtml("#a31f1f")
      Start-Process -Wait -FilePath $installCommand -ArgumentList $installArguments -PassThru | Out-Null
      $label.Text = "Installed"
      $label.ForeColor = [System.Drawing.ColorTranslator]::FromHtml
  }
  else {
      $label.Text = "Installation file missing"
      $label.ForeColor = [System.Drawing.ColorTranslator]::FromHtml("#a31f1f")
  }
}

# Display of the main window
[void]$SilentInstaller.ShowDialog()
$memoryStreamImage.Dispose()
$memoryStreamIcon.Dispose()
