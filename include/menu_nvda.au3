#INCLUDE "KEYINPUT.AU3"
#include-once
#include "NVDAControllerClient.au3"
Func reader_create_menu($description,$options, $announcePos="1", $indicator="OF")
	If $description = "" Then Return 0
	If $options = "" Then Return 0
	$selection = 1
	$items = StringSplit($options, ",")
	If @error Then Return 0
	$menu_length = $items[0]
speaking($description)
	While 1
		$active_window = WinGetProcess("")
		If $active_window = @AutoItPID Then
		Else
			Sleep(10)
			ContinueLoop 
		EndIf
		$menu_key = ""
		$capt = check_key("26", 2)
		If $capt = 1 Then
			$menu_key = "up arrow"
		EndIf
		$capt = check_key("28", 3)
		If $capt = 1 Then
			$menu_key = "down arrow"
		EndIf
		$capt = check_key("0D", 5)
		If $capt = 1 Then
			$menu_key = "enter"
		EndIf
		If $menu_key = "" Then
			Sleep(10)
			ContinueLoop 
		EndIf
		If $menu_key = "enter" Then
			$selected = $device.opensound ("sounds/soundsdata.dat/selected.ogg", true)
			$selected.play()
			If $selection > 0 Then
				$menu = ""
				Return $selection
			EndIf
		EndIf
		If $menu_key = "up arrow" Then
			$selection = $selection - 1
			If $selection < 1 Then
				$selection = $menu_length
				$top = $device.opensound ("sounds/soundsdata.dat/scrollTop.ogg", true)
				$top.play()
			EndIf
			$file_to_open = $items[$selection]
			$scroll = $device.opensound ("sounds/soundsdata.dat/bound.ogg", true)
			$scroll.play()
if $announcePos = "1" then
speaking($file_to_open &", " &$selection &$indicator &" " &$menu_length)
else
speaking($file_to_open)
EndIf
		EndIf
		If $menu_key = "down arrow" Then
			$selection = $selection + 1
			$limit = $menu_length + 1
			If $selection = $limit Then
				$selection = 1
				$top = $device.opensound ("sounds/soundsdata.dat/scrollTop.ogg", true)
				$top.play()
			EndIf
			$file_to_open = $items[$selection]
$bound = $device.opensound ("sounds/soundsdata.dat/bound.ogg", true)
$bound.play()
if $announcePos = "1" then
speaking($file_to_open &", " &$selection &"of " &$menu_length)
Else
speaking($file_to_open)
EndIf
		EndIf
		Sleep(10)
	WEnd
EndFunc