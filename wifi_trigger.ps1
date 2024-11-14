$command = "<Your PowerShell Command>"
$encodedCommand = [Convert]::ToBase64String([Text.Encoding]::Unicode.GetBytes($command))
powershell.exe -windowstyle hidden -encodedcommand $encodedCommand
