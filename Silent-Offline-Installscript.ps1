$host.ui.RawUI.WindowTitle = "Silent Software Installer"
$line = "****************************************************************************************************************"
$Display1 ="
  _________.__.__                 __    ________   _____  _____.__  .__               
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
         \/     \/            \/               \/     \/         |__|               
"

Write-Host "$line" -ForegroundColor Gray
Write-Host "$Display1" -ForegroundColor Blue
Write-Host "$line" -ForegroundColor Gray
sleep 2

Write-Host "
*****************************************************
*                                                   *
*              Software installation !              *
*                                                   *
*****************************************************
" -ForegroundColor Cyan

    Write-Host "Installing Mozilla Firefox...            " -ForegroundColor Red -nonewline
    Start-Process -Wait -FilePath .\Setups\Firefox*.exe -Argument "-ms -ma" -PassThru | Out-Null
    Write-Host "| Completed!" -ForegroundColor Green

    Write-Host "Installing Google Chrome...              " -ForegroundColor Red -nonewline
    Start-Process -Wait -FilePath .\Setups\Chrome*.exe -Argument "/silent /install" -PassThru | Out-Null
    Write-Host "| Completed!" -ForegroundColor Green 

    Write-Host "Installing Mozilla Thunderbird...        " -ForegroundColor Red -nonewline
    Start-Process -Wait -FilePath .\Setups\Thunderbird*.exe -Argument "/S /quiet" -PassThru | Out-Null
    Write-Host "| Completed!" -ForegroundColor Green
     
    Write-Host "Installing VLC Media Player...           " -ForegroundColor Red -nonewline
    Start-Process -Wait -FilePath .\Setups\vlc*.exe -Argument "/S /L=1031" -PassThru | Out-Null
    Write-Host "| Completed!" -ForegroundColor Green

    Write-Host "Installing Adobe Acrobat Reader DC...    " -ForegroundColor Red -nonewline
    Start-Process -Wait -FilePath .\Setups\AcroRdrDC*.exe -Argument "/sAll /rs /msi EULA_ACCEPT=YES" -PassThru | Out-Null
    Write-Host "| Completed!" -ForegroundColor Green
sleep 2

Write-Host "
*****************************************************
*                                                   *
*    The installation process has been completed    *
*                                                   *
*****************************************************
" -ForegroundColor Green

sleep 2