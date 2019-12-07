#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

<^space::  ; Win+Spacebar
gui, add, button, x5 y5 h20 w100 gsub1, Data e Ora
gui, show, w100 
return

sub1:
 {
       FormatTime,CurrentDateTime,,yyyyMMdd_HHmm
        Clipboard:=CurrentDateTime
 }
return


Return