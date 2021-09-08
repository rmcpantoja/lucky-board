#INCLUDE "KEYINPUT.AU3"
#include-once
; This file contains a function to generate a custom audio menu. It uses functions from the ; audio and key libraries, so those need to be initialized first before this function can ; be used.

Func create_audio_menu($description,$options)
If $description = "" Then return 0
If $options = "" Then return 0
$selection = 0
$items = StringSplit($options,",")
If @Error Then return 0
$menu_length = $items[0]
$menu = $device.OpenSound($description,true)
$menu.Play()
While 1
$active_window = WinGetProcess("")
If $active_window = @AutoItPid Then
Else
Sleep(10)
ContinueLoop
EndIf
$menu_key = ""
$capt = check_key("26",2)
If $capt = 1 Then
$menu_key = "up arrow"
EndIf
$capt = check_key("28",3)
If $capt = 1 Then
$menu_key = "down arrow"
EndIf
$capt = check_key("0D",5)
If $capt = 1 Then
$menu_key = "enter"
EndIf
If $menu_key = "" Then
Sleep(10)
ContinueLoop
EndIf
If $menu_key = "enter" Then
$selected = $device.opensound ("sounds/selected.wav", true)
$selected.play()
If $selection > 0 Then
$menu = ""
return $selection
EndIf
EndIf
If $menu_key = "up arrow" Then
$selection = $selection-1
If $selection < 1 Then
$selection = $menu_length
$top = $device.opensound ("sounds/scrollTop.wav", true)
$top.play()
EndIf
$file_to_open = $items[$selection]
$menu = $device.OpenSound($file_to_open,true)
$scroll = $device.opensound ("sounds/bound.wav", 0)
$scroll.play()
$menu.Play()
EndIf
If $menu_key = "down arrow" Then
$selection = $selection+1
$limit = $menu_length+1
If $selection = $limit Then
$selection = 1
$top = $device.opensound ("sounds/scrollTop.wav", true)
$top.play()
EndIf
$file_to_open = $items[$selection]
$menu = $device.OpenSound($file_to_open,true)
$scroll = $device.opensound ("sounds\bound.wav", 0)
$scroll.play()
$menu.Play()
EndIf
Sleep(10)
Wend
EndFunc