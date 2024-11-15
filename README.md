# BadUsbStuff

## Wifi Folder

This folder contains a DigiSpark (ATTiny85) payload that automatically runs a PowerShell script to extract Wi-Fi profiles.


### Versions

- ExtractorToUSB.ps1 saves the output on another USB drive 
- ExtractorToC2.ps1 saves the output on a remote C2 via HTTP POST 


### Behaviour

- Opens PowerShell in a hidden window
- Executes a Base64-encoded command
- Extracts Wi-Fi profiles along with passwords
- Saves the extracted info


This tool can be useful for penetration testing or red team operations where retrieving network credentials is necessary.

