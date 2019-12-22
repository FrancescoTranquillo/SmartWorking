#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

<^up::

;1) seleziona cartella con i file e file di testo con nomi da usare
FileSelectFolder, rename_these, , 3
if rename_these =
    MsgBox, You didn't select a folder.
else
    MsgBox, You selected folder "%rename_these%".

FileSelectFile, with_these, 3, , Open a file, Text Documents (*.txt; *.doc)
MsgBox, You selected file "%with_these%".

;2) leggi file e salvalo in una variabile

FileRead, new_names, %with_these%
;Gui, Add, Text,, %with_these%:
;Gui, Add, Edit,, %new_names%
;Gui, Show

;3) rinomina ogni file con il nome corrispondente
Loop, %rename_these%\*.pdf
{
 FileReadLine, newName, %with_these%, %A_Index%
 FileMove, %rename_these%\%A_LoopFileName%,%rename_these%\SDI19-%newName%.pdf ; omit .wav if uniqueNames.txt contains file extensions
}

return