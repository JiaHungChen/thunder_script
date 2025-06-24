#Persistent ;
SetTimer, CheckGameEnd, 10000 ; # 10秒檢查一次遊戲是否已經結束

return

CheckGameEnd:
    IfWinNotExist, 雷電模擬器
    {
        return ;
    }
    IfWinNotActive, 雷電模擬器
    {
        WinActivate, 雷電模擬器 ;
        Sleep, 1000 ;
    }
    ;
    MouseClick, left, 1007, 570 ; # 按任意畫面繼續
    Sleep, 3000 ; 等3秒
    PixelSearch, Px, Py, 1442, 948, 1464, 955, 0xFFFFFF, 3, Fast RGB
    if !ErrorLevel ; # 遊戲已經結束
    {
        MouseClick, left, 1464, 955 ; # 返回大廳
        Sleep, 10000 ; 返回大廳等10秒
        MouseClick, left, 1675, 842 ; # 開始配對
        Sleep, 30000 ; 配對30秒都別動
    }
return