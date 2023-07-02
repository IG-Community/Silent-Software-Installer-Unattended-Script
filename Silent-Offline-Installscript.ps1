$host.ui.RawUI.WindowTitle = "Unattended Software Deployment"
[Console]::WindowWidth=102;
[Console]::Windowheight=30;
[Console]::setBufferSize(102,30) #width,height
$Display = {
Write-Host "                 ____ ___              __    __                     .___         .___
                |    |   \____ _____ _/  |__/  |_  ____   ____    __| _/____   __| _/
                |    |   /    \\__  \\   __\   __\/ __ \ /    \  / __ |/ __ \ / __ | 
                |    |  /   |  \/ __ \|  |  |  | \  ___/|   |  \/ /_/ \  ___// /_/ | 
                |______/|___|  (____  /__|  |__|  \___  >___|  /\____ |\___  >____ | 
                             \/     \/                \/     \/      \/    \/     \/ " -ForegroundColor Cyan
Write-Host "                      ________                .__                                    
                      \______ \   ____ ______ |  |   ____ ___.__. ___________        
                       |    |  \_/ __ \\____ \|  |  /  _ <   |  |/ __ \_  __ \       
                       |    |   \  ___/|  |_> >  |_(  <_> )___  \  ___/|  | \/       
                      /_______  /\___  >   __/|____/\____// ____|\___  >__|          
                              \/     \/|__|               \/         \/                      v4.0.0" -ForegroundColor Red
}

$Firefox = {
  Write-Host "  ║  " -ForegroundColor Yellow -NoNewline
  Write-Host "Installiere Software: " -ForegroundColor Red -NoNewline
  Write-Host "Mozilla Firefox...                 " -ForegroundColor Yellow -NoNewline
  
  if (Get-ItemProperty HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\* | Where-Object { $_.DisplayName -match "Firefox" }) {
      Write-Host "| Software ist bereits Installiert  " -ForegroundColor Green -NoNewline
      Write-Host "║" -ForegroundColor Yellow
  }
  else {
      if (Test-Path .\Setups\Firefox*.exe -PathType Leaf) {
          Start-Process -Wait -FilePath .\Setups\Firefox*.exe -Argument "-ms -ma" -PassThru | Out-Null
          Write-Host "| Erfolgreich!                      " -ForegroundColor Green -NoNewline
          Write-Host "║" -ForegroundColor Yellow
      }
      else {
          Write-Host "| FEHLER - Datei nicht gefunden.    " -ForegroundColor Red -NoNewline
          Write-Host "║" -ForegroundColor Yellow
      }
  }
  Start-Sleep 1
}

$Chrome = {
  Write-Host "  ║  " -ForegroundColor Yellow -NoNewline
  Write-Host "Installiere Software: " -ForegroundColor Red -NoNewline
  Write-Host "Google Chrome...                   " -ForegroundColor Yellow -NoNewline
  $chromePath = Get-ItemProperty 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\chrome.exe' -ErrorAction SilentlyContinue | Select-Object -ExpandProperty '(Default)'

  if ($chromePath -ne $null) {
      Write-Host "| Software ist bereits Installiert  " -ForegroundColor Green -NoNewline
      Write-Host "║" -ForegroundColor Yellow
  }
  else {
      if (Test-Path .\Setups\chrome*.exe -PathType Leaf) {
          Start-Process -Wait -FilePath .\Setups\chrome*.exe -Argument "/silent /install" -PassThru | Out-Null
          Write-Host "| Erfolgreich!                      " -ForegroundColor Green -NoNewline
          Write-Host "║" -ForegroundColor Yellow
      }
      else {
          Write-Host "| FEHLER - Datei nicht gefunden.    " -ForegroundColor Red -NoNewline
          Write-Host "║" -ForegroundColor Yellow
      }
  }
  Start-Sleep 1
}

$Thunderbird = {
  Write-Host "  ║  " -ForegroundColor Yellow -NoNewline
  Write-Host "Installiere Software: " -ForegroundColor Red -NoNewline
  Write-Host "Mozilla Thunderbird...             " -ForegroundColor Yellow -NoNewline
  
  if (Get-ItemProperty HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\* | Where-Object { $_.DisplayName -match "Thunderbird" }) {
      Write-Host "| Software ist bereits Installiert  " -ForegroundColor Green -NoNewline
      Write-Host "║" -ForegroundColor Yellow
  }
  else {
      if (Test-Path .\Setups\thunderbird*.exe -PathType Leaf) {
          Start-Process -Wait -FilePath .\Setups\thunderbird*.exe -Argument "/S /quiet" -PassThru | Out-Null
          Write-Host "| Erfolgreich!                      " -ForegroundColor Green -NoNewline
          Write-Host "║" -ForegroundColor Yellow
      }
      else {
          Write-Host "| FEHLER - Datei nicht gefunden.    " -ForegroundColor Red -NoNewline
          Write-Host "║" -ForegroundColor Yellow
      }
  }
  Start-Sleep 1
}

$VLC = {
  Write-Host "  ║  " -ForegroundColor Yellow -NoNewline
  Write-Host "Installiere Software: " -ForegroundColor Red -NoNewline
  Write-Host "VLC Media Player...                " -ForegroundColor Yellow -NoNewline
  
  if (Get-ItemProperty HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\* | Where-Object { $_.DisplayName -match "VLC" }) {
      Write-Host "| Software ist bereits Installiert  " -ForegroundColor Green -NoNewline
      Write-Host "║" -ForegroundColor Yellow
  }
  else {
      if (Test-Path .\Setups\vlc*.exe -PathType Leaf) {
          Start-Process -Wait -FilePath .\Setups\vlc*.exe -Argument "/S /L=1031" -PassThru | Out-Null
          Write-Host "| Erfolgreich!                      " -ForegroundColor Green -NoNewline
          Write-Host "║" -ForegroundColor Yellow
      }
      else {
          Write-Host "| FEHLER - Datei nicht gefunden.    " -ForegroundColor Red -NoNewline
          Write-Host "║" -ForegroundColor Yellow
      }
  }
  Start-Sleep 1
}

$AdobeReaderDC = {
  Write-Host "  ║  " -ForegroundColor Yellow -NoNewline
  Write-Host "Installiere Software: " -ForegroundColor Red -NoNewline
  Write-Host "Adobe Acrobat Reader DC...         " -ForegroundColor Yellow -NoNewline

  if(Get-ItemProperty HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\* | Where-Object { $_.DisplayName -Match "Adobe" }) {
      Write-Host "| Software ist bereits Installiert  " -ForegroundColor Green -NoNewline
      Write-Host "║" -ForegroundColor Yellow
  }
  else {
      if (Test-Path .\Setups\AcroRdrDC*.exe -PathType Leaf) {
          Start-Process -Wait -FilePath .\Setups\AcroRdrDC*.exe -Argument "/sAll /rs /msi EULA_ACCEPT=YES" -PassThru | Out-Null
          Write-Host "| Erfolgreich!                      " -ForegroundColor Green -NoNewline
          Write-Host "║" -ForegroundColor Yellow
      }
      else {
          Write-Host "| FEHLER - Datei nicht gefunden.    " -ForegroundColor Red -NoNewline
          Write-Host "║" -ForegroundColor Yellow
      }
  }
  Start-Sleep 1
}

$Java = {
  Write-Host "  ║  " -ForegroundColor Yellow -NoNewline
  Write-Host "Installiere Software: " -ForegroundColor Red -NoNewline
  Write-Host "Oracle Java Runtime Environment... " -ForegroundColor Yellow -NoNewline

  if(Get-ItemProperty HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\* | Where-Object { $_.DisplayName -Match "Java" }) {
    Write-Host "| Software ist bereits Installiert  " -NoNewline -ForegroundColor Green
    Write-Host "║" -ForegroundColor Yellow
  }
  else {
      if(Test-Path .\Setups\jre*.exe -PathType Leaf) {
        Start-Process -Wait -FilePath .\Setups\jre*.exe -Argument "/s" -PassThru | Out-Null
        Write-Host "| Erfolgreich!                      " -ForegroundColor Green -NoNewline
        Write-Host "║" -ForegroundColor Yellow
     }
     else {
          Write-Host "| FEHLER - Datei nicht gefunden.    " -ForegroundColor Red -NoNewline
          Write-Host "║" -ForegroundColor Yellow
        }
    }
    Start-Sleep 1
  }

$End = {
  Write-Host "  ║                                                                                               ║" -ForegroundColor Yellow
  Write-Host "  ╠═══════════════════════════════════════════════════════════════════════════════════════════════╣" -ForegroundColor Yellow
  Write-Host "  ║                           " -NoNewline -ForegroundColor Yellow
  Write-Host "Der Installationsprozess war Erfolgreich!" -NoNewline -ForegroundColor Green
  Write-Host "                           ║" -ForegroundColor Yellow
  Write-Host "  ╚═══════════════════════════════════════════════════════════════════════════════════════════════╝" -ForegroundColor Yellow
  Start-Sleep 5
  }

function menu {

  Invoke-Command -ScriptBlock $Display
  Write-Host " ═════════════╦═══════════════════════════════════════════════════════════════════════╦═════════════" -ForegroundColor Yellow
  Write-Host "              ╠═════════════════════════════" -NoNewline -ForegroundColor Yellow
  Write-Host "  Menüliste  " -ForegroundColor Cyan -NoNewline
  Write-Host "═════════════════════════════╣              " -ForegroundColor Yellow
  Write-Host "              ║                                                                       ║" -ForegroundColor Yellow
  Write-Host "              ║" -ForegroundColor Yellow -NoNewLine
  Write-Host "    1: Unbeaufsichtigte Installation ohne Java                         " -ForegroundColor Cyan -NoNewLine
  Write-Host "║" -ForegroundColor Yellow
  Write-Host "              ║                                                                       ║" -ForegroundColor Yellow
  Write-Host "              ║" -ForegroundColor Yellow -NoNewLine
  Write-Host "    2: Unbeaufsichtigte Installation ohne Java und Thunderbird         " -ForegroundColor Cyan -NoNewLine
  Write-Host "║" -ForegroundColor Yellow
  Write-Host "              ║                                                                       ║" -ForegroundColor Yellow
  Write-Host "              ║" -ForegroundColor Yellow -NoNewLine
  Write-Host "    3: Unbeaufsichtigte Installation mit Java                          " -ForegroundColor Cyan -NoNewLine
  Write-Host "║" -ForegroundColor Yellow
  Write-Host "              ║                                                                       ║" -ForegroundColor Yellow
  Write-Host "              ║" -ForegroundColor Yellow -NoNewLine
  Write-Host "    4: Unbeaufsichtigte Installation mit Java aber ohne Thunderbird    " -ForegroundColor Cyan -NoNewLine
  Write-Host "║" -ForegroundColor Yellow
  Write-Host "              ║                                                                       ║" -ForegroundColor Yellow
  Write-Host "              ╠═══════════════════════════════════════════════════════════════════════╣" -ForegroundColor Yellow
  Write-Host "              ║                                                                       ║" -ForegroundColor Yellow
  Write-Host "              ║" -ForegroundColor Yellow -NoNewLine
  Write-Host "    0: Beenden                                            5: Readme    " -ForegroundColor Magenta -NoNewLine
  Write-Host "║" -ForegroundColor Yellow
  Write-Host "              ║                                                                       ║" -ForegroundColor Yellow
  Write-Host "              ╚═══════════════════════════════════════════════════════════════════════╝" -ForegroundColor Yellow
  Write-Host
  $actions = "0"
  while ($actions -notin "0..5") {
  $actions = Read-Host -Prompt '                  Was möchten Sie installieren? ( 1 | 2 | 3 | 4 )'
  
      if ($actions -in 0..5) {
          if ($actions -eq 0) {
              exit
            }

          if ($actions -eq 1) {
            $host.ui.RawUI.WindowTitle = "Unattended Software Deployment without Java"
            Clear-Host
            Invoke-Command -ScriptBlock $Display
            Write-Host "══╦═══════════════════════════════════════════════════════════════════════════════════════════════╦══" -ForegroundColor Yellow
            Write-Host "  ║                                                                                               ║" -ForegroundColor Yellow
            Invoke-Command -ScriptBlock $Firefox
            Invoke-Command -ScriptBlock $Chrome
            Invoke-Command -ScriptBlock $Thunderbird
            Invoke-Command -ScriptBlock $VLC
            Invoke-Command -ScriptBlock $AdobeReaderDC
            Invoke-Command -ScriptBlock $End
            exit
            }

          if ($actions -eq 2) {
            $host.ui.RawUI.WindowTitle = "Unattended Software Deployment without Java and Thunderbird"
            Clear-Host
            Invoke-Command -ScriptBlock $Display
            Write-Host "══╦═══════════════════════════════════════════════════════════════════════════════════════════════╦══" -ForegroundColor Yellow
            Write-Host "  ║                                                                                               ║" -ForegroundColor Yellow
            Invoke-Command -ScriptBlock $Firefox
            Invoke-Command -ScriptBlock $Chrome
            Invoke-Command -ScriptBlock $VLC
            Invoke-Command -ScriptBlock $AdobeReaderDC
            Invoke-Command -ScriptBlock $End
            exit
            }

          if ($actions -eq 3) {
            $host.ui.RawUI.WindowTitle = "Unattended Software Deployment with Java"
            Clear-Host
            Invoke-Command -ScriptBlock $Display
            Write-Host "══╦═══════════════════════════════════════════════════════════════════════════════════════════════╦══" -ForegroundColor Yellow
            Write-Host "  ║                                                                                               ║" -ForegroundColor Yellow
            Invoke-Command -ScriptBlock $Firefox
            Invoke-Command -ScriptBlock $Chrome
            Invoke-Command -ScriptBlock $Thunderbird
            Invoke-Command -ScriptBlock $VLC
            Invoke-Command -ScriptBlock $AdobeReaderDC
            Invoke-Command -ScriptBlock $Java
            Invoke-Command -ScriptBlock $End
            exit
            }

          if ($actions -eq 4) {
            $host.ui.RawUI.WindowTitle = "Unattended Software Deployment with Java but without Thunderbird"
            Clear-Host
            Invoke-Command -ScriptBlock $Display
            Write-Host "══╦═══════════════════════════════════════════════════════════════════════════════════════════════╦══" -ForegroundColor Yellow
            Write-Host "  ║                                                                                               ║" -ForegroundColor Yellow
            Invoke-Command -ScriptBlock $Firefox
            Invoke-Command -ScriptBlock $Chrome
            Invoke-Command -ScriptBlock $VLC
            Invoke-Command -ScriptBlock $AdobeReaderDC
            Invoke-Command -ScriptBlock $Java
            Invoke-Command -ScriptBlock $End
            exit
            }

          if ($actions -eq 5) {
            Start-Process "https://github.com/TrelLyX/Silent-Offline-Install-Script#readme"
            menu
            }
            exit
            menu
        }
        else {
            menu
        }
    }
}
menu
