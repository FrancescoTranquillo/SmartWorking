
<^space::  ; Win+Spacebar
gui, add, button, x5 y5 h20 w100 gsub1, PENTAX
gui, add, button, x5 y30 h20 w100 gsub2, OLYMPUS
gui, add, button, x5 y60 h20 w100 gexit, Exit Script
gui, show, w100 
return

sub1:
 {
   Run notepad
   winWaitActive Untitled - Notepad
   Send Buongiorno, abbiamo bisogno di inviare 1 valigia alla ditta Pentax, in via Dione Cassio 15 (Milano). `n Grazie. `n Cordiali saluti. 
   
 }
return

sub2:
 {
   Run, notepad
   winWaitActive Untitled - Notepad
   Send Buongiorno, abbiamo bisogno di inviare 1 valigia alla ditta Olympus, in Via Amedeo Modigliani 45, Segrate MI.`nGrazie. `nCordiali saluti.

 }
return

guiclose:
exit:
 {
   exitapp
 }
return
