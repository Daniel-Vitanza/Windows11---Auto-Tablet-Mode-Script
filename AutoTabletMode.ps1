$ErrorActionPreference = "Stop"

#==Config==
$LastState = $null
# List of Keyboards to consider for Tablet Mode
$KeyboardA = "VID_258A&PID_001E"
$KeyboardB = "xx"

# Registry Path for the TabletMode  
$RegPath = "HKLM:\SYSTEM\CurrentControlSet\Control\PriorityControl"
$RegName = "ConvertibleSlateMode"


#==Functions==

function Get-KeyboardState {
    $connected = Get-PnpDevice -PresentOnly |
        Where-Object {
            $_.Class -eq "Keyboard" -and
            $_.Status -eq "OK" -and (
                $_.InstanceId -like "*$KeyboardA*" -or
                $_.InstanceId -like "*$KeyboardB*"
            )
        }
    return [bool]$connected
}


function Update-TabletMode {

    $state = Get-KeyboardState
    $newValue = if ($state) { 1 } else { 0 }

    if ($newValue -ne $script:LastState) {
        Set-ItemProperty -Path $RegPath -Name $RegName -Value $newValue
        $script:LastState = $newValue
        Write-Host "Mode changé -> $newValue à $(Get-Date)"
    }
}


#==Main==
#Initial Run
Update-TabletMode
	
#Event Loop
# Connection
Register-WmiEvent -Query "SELECT * FROM Win32_DeviceChangeEvent WHERE EventType = 2" `
    -SourceIdentifier "KeyboardConnected" -Action {
        #Write-Host "Keyboard connected at $(Get-Date -Format 'HH:mm:ss')"
		Update-TabletMode
    }

# Disconnection
Register-WmiEvent -Query "SELECT * FROM Win32_DeviceChangeEvent WHERE EventType = 3" `
    -SourceIdentifier "KeyboardDisconnected" -Action {
        #Write-Host "Keyboard disconnected at $(Get-Date -Format 'HH:mm:ss')"
		Update-TabletMode
    }

# Keep script running
#Write-Host "Monitoring keyboard events. Press Ctrl+C to exit."
while ($true) { Start-Sleep -Seconds 1 }



