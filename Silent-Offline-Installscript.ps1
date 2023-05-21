$host.ui.RawUI.WindowTitle = "Silent software installer | Unattended Script"
[Console]::WindowWidth=101;
[Console]::Windowheight=27;
[Console]::setBufferSize(101,27) #width,height
$Display = {
Write-Host "====================================================================================================" -ForegroundColor White
Write-Host "  _________.__.__                 __    ________   _____  _____.__  .__               
 /   _____/|__|  |   ____   _____/  |_  \_____  \_/ ____\/ ____\  | |__| ____   ____  
 \_____  \ |  |  | _/ __ \ /    \   __\  /   |   \   __\\   __\|  | |  |/    \_/ __ \ 
 /        \|  |  |_\  ___/|   |  \  |   /    |    \  |   |  |  |  |_|  |   |  \  ___/ 
/_______  /|__|____/\___  >___|  /__|   \_______  /__|   |__|  |____/__|___|  /\___  >
        \/              \/     \/               \/                          \/     \/ 
.___                 __         .__  .__                      .__        __           
|   | ____   _______/  |______  |  | |  |   ______ ___________|__|______/  |_         
|   |/    \ /  ___/\   __\__  \ |  | |  |  /  ___// ___\_  __ \  \____ \   __\        
|   |   |  \\___ \  |  |  / __ \|  |_|  |__\___ \\  \___|  | \/  |  |_> >  |          
|___|___|  /____  > |__| (____  /____/____/____  >\___  >__|  |__|   __/|__|          
         \/     \/            \/               \/     \/         |__|                        v3.5.0" -ForegroundColor Red
Write-Host "====================================================================================================
"  
}

$Firefox = {
  Write-Host "  Installing software: " -ForegroundColor Red -NoNewline
  Write-Host "Mozilla Firefox...                 " -ForegroundColor Yellow -NoNewline
  
  if (Get-ItemProperty HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\* | Where-Object { $_.DisplayName -match "Firefox" }) {
      Write-Host "| Software is already installed" -ForegroundColor Green
  }  
  else {
      if (Test-Path .\Setups\Firefox*.exe -PathType Leaf) {
          Start-Process -Wait -FilePath .\Setups\Firefox*.exe -Argument "-ms -ma" -PassThru | Out-Null
          Write-Host "| Completed!" -ForegroundColor Green
      }
      else {
          Write-Host "| ERROR - Installation file not found" -ForegroundColor Red            
      }
  }    
}
  
$Chrome = {
  Write-Host "  Installing software: " -ForegroundColor Red -NoNewline
  $chromePath = Get-ItemProperty 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\chrome.exe' -ErrorAction SilentlyContinue | Select-Object -ExpandProperty '(Default)'

  if ($chromePath -ne $null) {
      Write-Host "| Software is already installed" -ForegroundColor Green
  }  
  else {
      if (Test-Path .\Setups\chrome*.exe -PathType Leaf) {
          Start-Process -Wait -FilePath .\Setups\chrome*.exe -Argument "/silent /install" -PassThru | Out-Null
          Write-Host "| Completed!" -ForegroundColor Green
      }
      else {
          Write-Host "| ERROR - Installation file not found" -ForegroundColor Red            
      }
  }    
}
  
$Thunderbird = {
  Write-Host "  Installing software: " -ForegroundColor Red -NoNewline
  Write-Host "Mozilla Thunderbird...             " -ForegroundColor Yellow -NoNewline
  
  if (Get-ItemProperty HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\* | Where-Object { $_.DisplayName -match "Thunderbird" }) {
      Write-Host "| Software is already installed" -ForegroundColor Green
  }  
  else {
      if (Test-Path .\Setups\thunderbird*.exe -PathType Leaf) {
          Start-Process -Wait -FilePath .\Setups\thunderbird*.exe -Argument "/S /quiet" -PassThru | Out-Null
          Write-Host "| Completed!" -ForegroundColor Green
      }
      else {
          Write-Host "| ERROR - Installation file not found" -ForegroundColor Red            
      }
  }    
}
  
$VLC = {
  Write-Host "  Installing software: " -ForegroundColor Red -NoNewline
  Write-Host "VLC Media Player...                " -ForegroundColor Yellow -NoNewline
  
  if (Get-ItemProperty HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\* | Where-Object { $_.DisplayName -match "VLC" }) {
      Write-Host "| Software is already installed" -ForegroundColor Green
  }  
  else {
      if (Test-Path .\Setups\vlc*.exe -PathType Leaf) {
          Start-Process -Wait -FilePath .\Setups\vlc*.exe -Argument "/S /L=1031" -PassThru | Out-Null
          Write-Host "| Completed!" -ForegroundColor Green
      }
      else {
          Write-Host "| ERROR - Installation file not found" -ForegroundColor Red            
      }
  }    
}
  
$AdobeReaderDC = {
  Write-Host "  Installing software: " -ForegroundColor Red -NoNewline
  Write-Host "Adobe Acrobat Reader DC...         " -ForegroundColor Yellow -NoNewline
  
  if (Get-ItemProperty HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\* | Where-Object { $_.DisplayName -match "Adobe Acrobat" }) {
      Write-Host "| Software is already installed" -ForegroundColor Green
  }  
  else {
      if (Test-Path .\Setups\AcroRdrDC*.exe -PathType Leaf) {
          Start-Process -Wait -FilePath .\Setups\AcroRdrDC*.exe -Argument "/sAll /rs /msi EULA_ACCEPT=YES" -PassThru | Out-Null
          Write-Host "| Completed!" -ForegroundColor Green
      }
      else {
          Write-Host "| ERROR - Installation file not found" -ForegroundColor Red            
      }
  }    
}

$Java = {
  Write-Host "  Installing software: " -ForegroundColor Red -nonewline
  Write-Host "Oracle Java Runtime Environment... " -ForegroundColor Yellow -nonewline
  if(Get-ItemProperty HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\* | Where-Object { $_.DisplayName -Match "Java" }) {
    Write-Host "| software is already installed" -ForegroundColor Green
  }  
  else {
      if(Test-Path .\Setups\jre*.exe -PathType Leaf) {
        Start-Process -Wait -FilePath .\Setups\jre*.exe -Argument "/s" -PassThru | Out-Null
        Write-Host "| Completed!" -ForegroundColor Green
     }
     else {
      Write-Host "| ERROR - installation file not found" -ForegroundColor Red            
        }
    } 
  }  

$End = {
  Write-Host "
 ##################################################################################################
 ########################## The installation process has been completed! ##########################
 ##################################################################################################" -ForegroundColor Green
  }  


function menu {
  Clear-Host
  Invoke-Command -ScriptBlock $Display
  Write-Host " ###################### Unattended menu ######################" -ForegroundColor Yellow
  Write-Host " #                                                           #" -ForegroundColor Yellow
  Write-Host " #" -ForegroundColor Yellow -NoNewLine
  Write-Host "  1: Unattended Install without Java                       " -ForegroundColor Cyan -NoNewLine
  Write-Host "#" -ForegroundColor Yellow
  Write-Host " #                                                           #" -ForegroundColor Yellow
  Write-Host " #" -ForegroundColor Yellow -NoNewLine
  Write-Host "  2: Unattended Install without Java and Thunderbird       " -ForegroundColor Cyan -NoNewLine
  Write-Host "#" -ForegroundColor Yellow
  Write-Host " #                                                           #" -ForegroundColor Yellow
  Write-Host " #" -ForegroundColor Yellow -NoNewLine
  Write-Host "  3: Unattended Install with Java                          " -ForegroundColor Cyan -NoNewLine
  Write-Host "#" -ForegroundColor Yellow
  Write-Host " #                                                           #" -ForegroundColor Yellow
  Write-Host " #" -ForegroundColor Yellow -NoNewLine
  Write-Host "  4: Unattended Install with Java but without Thunderbird  " -ForegroundColor Cyan -NoNewLine
  Write-Host "#" -ForegroundColor Yellow
  Write-Host " #                                                           #" -ForegroundColor Yellow
  Write-Host " #############################################################" -ForegroundColor Yellow
  Write-Host " #                                                           #" -ForegroundColor Yellow  
  Write-Host " #" -ForegroundColor Yellow -NoNewLine        
  Write-Host "  0: Quit                                       5: Readme  " -ForegroundColor Magenta -NoNewLine
  Write-Host "#" -ForegroundColor Yellow
  Write-Host " #                                                           #" -ForegroundColor Yellow
  Write-Host " #############################################################" -ForegroundColor Yellow
  Write-Host
  $actions = "0"
  while ($actions -notin "0..5") {
  $actions = Read-Host -Prompt '    What you want to do?'
      if ($actions -in 0..5) {
          if ($actions -eq 0) {
              exit
          }
          if ($actions -eq 1) {
            $host.ui.RawUI.WindowTitle = "Silent software installation without Java | Unattended Script"
            Clear-Host 
            Invoke-Command -ScriptBlock $Display
            Start-Sleep 1
            Invoke-Command -ScriptBlock $Firefox
            Start-Sleep 1
            Invoke-Command -ScriptBlock $Chrome
            Start-Sleep 1
            Invoke-Command -ScriptBlock $Thunderbird
            Start-Sleep 1
            Invoke-Command -ScriptBlock $VLC
            Start-Sleep 1
            Invoke-Command -ScriptBlock $AdobeReaderDC
            Start-Sleep 1
            Invoke-Command -ScriptBlock $End
            Start-Sleep 3
            exit
          }

          if ($actions -eq 2) {
            $host.ui.RawUI.WindowTitle = "Silent software installation without Java and Thunderbird | Unattended Script"
            Clear-Host 
            Invoke-Command -ScriptBlock $Display
            Start-Sleep 1
            Invoke-Command -ScriptBlock $Firefox
            Start-Sleep 1
            Invoke-Command -ScriptBlock $Chrome
            Start-Sleep 1
            Invoke-Command -ScriptBlock $VLC
            Start-Sleep 1
            Invoke-Command -ScriptBlock $AdobeReaderDC
            Start-Sleep 1
            Invoke-Command -ScriptBlock $End
            Start-Sleep 3
            exit
            }

          if ($actions -eq 3) {
            $host.ui.RawUI.WindowTitle = "Silent software installation with Java | Unattended Script"
            Clear-Host 
            Invoke-Command -ScriptBlock $Display
            Start-Sleep 1
            Invoke-Command -ScriptBlock $Firefox
            Start-Sleep 1
            Invoke-Command -ScriptBlock $Chrome
            Start-Sleep 1
            Invoke-Command -ScriptBlock $Thunderbird
            Start-Sleep 1            
            Invoke-Command -ScriptBlock $VLC
            Start-Sleep 1
            Invoke-Command -ScriptBlock $AdobeReaderDC            
            Start-Sleep 1
            Invoke-Command -ScriptBlock $Java
            Start-Sleep 1
            Invoke-Command -ScriptBlock $End
            Start-Sleep 3
            exit
            } 

          if ($actions -eq 4) {
            $host.ui.RawUI.WindowTitle = "Silent software installation with Java but without Thunderbird | Unattended Script"
            Clear-Host 
            Invoke-Command -ScriptBlock $Display
            Start-Sleep 1
            Invoke-Command -ScriptBlock $Firefox
            Start-Sleep 1
            Invoke-Command -ScriptBlock $Chrome
            Start-Sleep 1
            Invoke-Command -ScriptBlock $VLC
            Start-Sleep 1
            Invoke-Command -ScriptBlock $AdobeReaderDC
            Start-Sleep 1
            Invoke-Command -ScriptBlock $Java
            Start-Sleep 1
            Invoke-Command -ScriptBlock $End
            Start-Sleep 3
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
