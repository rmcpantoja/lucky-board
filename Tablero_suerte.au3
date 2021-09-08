;include files
#INCLUDE "include\AUDIO.AU3"
#include <GUIConstantsEx.au3>
#INCLUDE "INCLUDE\menu.au3"
#include "include\reader.au3"
#include "include\soundlib.au3"
;tablero de la suerte:
GLOBAL $VERSION = "0.1"
global $voicegame="V2"
$maingui = guicreate("tablero de la suerte VERSIÓN " &$VERSION)
GuiSetState(@sw_SHOW)
$menumusic = $device.opensound ("sounds\menumusic.wav", 0)
$logo = $device.opensound ("sounds\music3.wav", true)
$applause = $device.opensound ("sounds\applause.ogg", true)
menu()
func menu()
if $menumusic.playing=1 then
$menumusic.stop
$menumusic.reset
else
$menumusic.play
sleep(100)
$menumusic.repeating=1
$menumusic.volume = 0.40
endIf
sleep(200)
$menuprincipal = create_audio_menu("sounds/voices/default/game/mainmenu.wav", "sounds/voices/default/game/menuselection1.wav,sounds/voices/default/game/menuselection2.wav,sounds/voices/default/game/menu3.wav,sounds/voices/default/game/menu4.wav,sounds/voices/default/game/menu5.wav")
SoundFade($menumusic)
select
case $menuprincipal = "1"
Main()
case $menuprincipal = "2"
Main()
case $menuprincipal = "3"
options()
case $menuprincipal = "4"
ShellExecute("http://mateocedillo.260mb.net/")
case $menuprincipal = "5"
exit
EndSelect
EndFunc
func main()
if $menumusic.playing == "1" then
$menumusic.stop
endif
speak("Bienbenidos sean todos al tablero de la suerte.", 3)
sleep(2000)
$logo.play
sleep(4000)
$applause.play
sleep(8000)
EndFunc