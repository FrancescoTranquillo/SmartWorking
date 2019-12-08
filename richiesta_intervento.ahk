#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; 1) creazione nome file: finestra per nome della ditta
<^space::

InputBox, Ditta, Genera richiesta di intervento V 0.1, Inserisci il nome della ditta (in maiuscolo)., , 340, 180
if ErrorLevel{
    Exit
}   
    
else
; 1.2) creazione nome file
    FormatTime,CurrentDateTime,,yyyyMMdd_HHmm
    NomeFile := CurrentDateTime . Ditta
    ; MsgBox, nome del file: "%NomeFile%" ; Controllo sul nome

; 2) copio tutto da lettera2 
    myinputfile =C:\Users\franc\Documents\lettera2.docx
    ComObjGet(myinputfile).Range.FormattedText.Copy

; a new carta intestata
    outputfile = C:\Users\franc\Documents\new carta intestata.docx
    ComObjGet(outputfile).Range.FormattedText.Paste

; 3) esporta new carta intestata in pdf
    oWord := ComObjActive("Word.Application")
    oWord.ActiveDocument.SaveAs2("C:\Users\franc\Documents\" . NomeFile . ".pdf", 17)
    file := "C:\Users\franc\Documents\" . NomeFile . ".pdf"
    Run, %file%

; 4) invia file creato per email



Return