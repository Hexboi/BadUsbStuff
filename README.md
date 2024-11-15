# BadUsbStuff

## Wifi Folder

This folder contains a DigiSpark (ATTiny85) payload that automatically runs a PowerShell script to extract Wi-Fi profiles and save them to a specified USB drive upon being plugged into a Windows machine. 


The payload simulates keyboard input to:
- open PowerShell in a hidden window
- execute a Base64-encoded command
- extracting Wi-Fi profiles along with passwords
- save the extracted info to a file named test.txt on the USB drive 


This tool can be useful for penetration testing or red team operations where retrieving network credentials is necessary.

