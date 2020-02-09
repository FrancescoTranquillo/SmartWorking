#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; 1) creazione nome file: finestra per nome della ditta
<^space::

InputBox, Ditta, Genera richiesta di intervento V 0.1, Inserisci il nome della ditta (in maiuscolo). Il file "lettera 2" deve essere aperto., , 340, 180
if ErrorLevel{
    Exit
}   
    
else

; 1.2) creazione nome file
    FormatTime,CurrentDateTime,,yyyyMMdd_HHmm
    NomeFile := CurrentDateTime . Ditta
    ; MsgBox, nome del file: "%NomeFile%" ; Controllo sul nome

; 2) copio tutto da lettera2 (deve essere aperto)
    myinputfile =C:\Users\Fra\Downloads\sw\lettera2.rtf
    sleep, 100
    active1 := ComObjActive("Word.Application")
    ;WinWaitActive, lettera2.rtf - Microsoft Word
    ;active1.ActiveDocument.Range.FormattedText.Copy
    ComObjGet(myinputfile).Range.FormattedText.Copy
    ;active1.ActiveDocument.close(0)
    active1.quit()


; a new carta intestata (deve essere chiuso)
    outputfile = C:\Users\Fra\Downloads\sw\carta intestata.docx
    ;WinWaitActive, new carta intestata.docx - Microsoft Word
    ;active2 := ComObjActive("Word.Application")
    ;active2.ActiveDocument.Range.FormattedText.Paste
    ComObjGet(outputfile).Range.FormattedText.Paste
    ;Sleep, 500
    Run, %outputfile%
    Sleep, 500

; 3) esporta new carta intestata in pdf
    oWord := ComObjActive("Word.Application")
    oWord.ActiveDocument.SaveAs2("C:\Users\Fra\Downloads\sw\" . NomeFile . ".pdf", 17)
    file := "C:\Users\Fra\Downloads\sw\" . NomeFile . ".pdf"
    Run, %file%

Return