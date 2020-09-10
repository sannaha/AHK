drawWindow()

drawWindow(){
    Gui, Destroy
    Gui, +AlwaysOnTop +Owner +E0x08000000 ; +E0x08000000 点击不激活
    Gui, Add, Button, W60 H30 X10 Y10, 暂停
    Gui, Add, Button, W60 H30 X10 Y50, 重启
    Gui, Add, Button, W60 H30 X10 Y90, 退出
    Gui, Add, Button, W80 H30 X80 Y10, 输入密码
    Gui, Add, Button, W80 H30 X80 Y50, 每日收菜
    Gui, Add, Button, W80 H30 X80 Y90, 领取任务
    Gui, Add, Button, W80 H30 X170 Y10, 1-7固源岩
    Gui, Add, Button, W80 H30 X170 Y50, 3-1酮凝集组
    Gui, Add, Button, W80 H30 X170 Y90, 3-2轻锰矿
    Gui, Add, Button, W80 H30 X260 Y10, 4-4扭转醇
    Gui, Add, Button, W80 H30 X260 Y50, 7-15全新装置
    Gui, Add, Button, W80 H30 X260 Y90, 7-17研磨石
    Gui, Show , W350, ArknightsHelper 
    ; Gui, Show ,W500, ArknightsHelper 
}
return

Button暂停:
    Pause
return

Button重启:
    Reload
return

Button退出:
GuiClose:
ExitApp

; 输入密码
Button输入密码:
    IfWinExist 明日方舟 - MuMu模拟器
    {
        WinActivate
        Sleep 100
        SendInput yourpassword
    }
return

; 访问基建+清理基建和订单
Button每日收菜:
    IfWinExist 明日方舟 - MuMu模拟器
    {
        WinActivate
        Sleep 300
        visitBase()
        backHome()
        cleanBase()
    }
return

; 领取任务
Button领取任务:
    IfWinExist 明日方舟 - MuMu模拟器
    {
        WinActivate
        Sleep 300
        recieveTask()
    }
return

Button1-7固源岩:
    IfWinExist 明日方舟 - MuMu模拟器
    {
        WinActivate
        Sleep 300
        startAct(75500,88)
    }
return

Button3-1酮凝集组:
    IfWinExist 明日方舟 - MuMu模拟器
    {
        WinActivate
        Sleep 300
        startAct(110000,7)
    }
return

Button3-2轻锰矿:
    IfWinExist 明日方舟 - MuMu模拟器
    {
        WinActivate
        Sleep 300
        startAct(10500,7)
    }
return

Button4-4扭转醇:
    IfWinExist 明日方舟 - MuMu模拟器
    {
        WinActivate
        Sleep 300
        startAct(140000,6)
    }
return

Button7-15全新装置:
    IfWinExist 明日方舟 - MuMu模拟器
    {
        WinActivate
        Sleep 300
        startAct(140000,6)
    }
return

Button7-17研磨石:
    IfWinExist 明日方舟 - MuMu模拟器
    {
        WinActivate
        Sleep 300
        startAct(220000,6)
    }
return

visitBase(){
    IfWinExist 明日方舟 - MuMu模拟器
    {
        WinActivate
        Send {F}
        Sleep 1800
        Send {L}
        Sleep 2400
        Send {V}
        Sleep 4800
        loop 10
        {
            Send {B}
            Sleep 4800
        }
    }
}

; 清理基建和订单
cleanBase(){
    IfWinExist 明日方舟 - MuMu模拟器
    {
        WinActivate
        Send {B}
        Sleep 3800
        Send {N}
        Sleep 1000
        Send {R}
        Sleep 1500
        Send {R}
        Sleep 1500
        Send {R}
        Sleep 1500
        Send {R}
        Sleep 1500
    }
}

; 返回首页
backHome(){
    IfWinExist 明日方舟 - MuMu模拟器
    {
        WinActivate
        Send {H}
        Sleep 1200
        Send {L}
        Sleep 2800
    }
}

; 领取任务
recieveTask(){
    IfWinExist 明日方舟 - MuMu模拟器
    {
        WinActivate
        Send {T}
        Sleep 1200
        loop 28
        {
            Send {C}
            Sleep 1200
        }
        Send {W}
        loop 10
        {
            Send {C}
            Sleep 1200
        }
    }
}

; 开始行动
startAct(lasting, times){
    Send {B}
    Sleep 1800
    Send {S}
    Sleep % lasting
    loop % times-1
    {
        IfWinExist 明日方舟 - MuMu模拟器
        {
            WinActivate
            Sleep 300
            Send {S}
            Sleep 3800
            Send {B}
            Sleep 1800
            Send {S}
            Sleep % lasting
        }
    }
}