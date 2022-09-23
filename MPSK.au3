#include <Array.au3>
#include <TrayConstants.au3>

;-- shortcut keys --
HotKeySet("!q","MediaPrev")
HotKeySet("!w","pause")
HotKeySet("!e","MediaNext")
HotKeySet("!m","Mute")
HotKeySet("!h","help")
HotKeySet("!x","terminate")
HotKeySet("!1","skipSpotifyAds")

; -- Help items --
Global $aHelpMsg[]=["Help-> Alt+[h]","previous -> Alt+[q]","Pause -> Alt+[w]","Next -> Alt+[e]","Mute -> Alt+[m]","Exit -> Alt+[x]"]
Global $sHelpText="Need help? press Alt + h"

help()

; -- Application functions --

Func help()
    _ArrayDisplay($aHelpMsg,"Help - MPSK","",64,"","[[-] shortcut keys [-]]")
EndFunc

Func MediaPrev()
    Send("{MEDIA_PREV}")
    TrayTip("The previous music was played ⏪", $sHelpText ,1)
EndFunc

Func MediaNext()
    Send("{MEDIA_NEXT}")
    TrayTip("The next music was played ⏩", $sHelpText ,1)
EndFunc

Func Mute()
    Send("{VOLUME_MUTE}")
    TrayTip("mute/unmut 🔇", $sHelpText ,1)
EndFunc

Func pause()
    Send("{MEDIA_PLAY_PAUSE}")
    TrayTip("Play/Pause ⏯", $sHelpText ,1)
EndFunc

Func skipSpotifyAds()
    If ProcessExists("spotify.exe") Then
        ProcessClose("spotify.exe")
    EndIf
    Run(@AppDataDir& "\Spotify\Spotify.exe","", @SW_MINIMIZE)
    Local $hWnd = WinWaitActive("Spotify Free")
    WinSetState("Spotify Free", "", @SW_MINIMIZE)
    Sleep(1000)
    pause()
    TrayTip("skip spotify ads ⏯", $sHelpText ,1)
EndFunc

Func terminate()
    TrayTip("Goodbye 👋", "author: www.alimilai.ir" ,1)
    Sleep(1500)
    Exit
EndFunc

While 1
    Sleep(100)
WEnd
