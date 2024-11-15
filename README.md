# BadUsbStuff

## Wifi Folder

This folder contains a DigiSpark (ATTiny85) payload that automatically runs a PowerShell script to extract Wi-Fi profiles.


There are 2 versions:
- ExtractorToUSB.ps1 saves the output on another USB drive 
- ExtractorToC2.ps1 saves the output on a remote C2 via HTTP POST 


The payload simulates keyboard input to:
- open PowerShell in a hidden window
- execute a Base64-encoded command
- extract Wi-Fi profiles along with passwords
- save the extracted info


This tool can be useful for penetration testing or red team operations where retrieving network credentials is necessary.

