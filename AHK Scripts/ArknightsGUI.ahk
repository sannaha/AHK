; 定时关机时长变量
TimeChoice := 8
drawWindow()

drawWindow(){
    Gui, Destroy
    Gui, +AlwaysOnTop +Owner +E0x08000000 ; +E0x08000000 点击不激活
    Gui, Add, Button, W60 H40 X10 Y10, 暂停
    Gui, Add, Button, W60 H40 X10 Y60, 重启
    Gui, Add, Button, W60 H40 X10 Y110, 退出
    Gui, Add, Button, W80 H40 X80 Y10, 输入密码
    Gui, Add, Button, W80 H40 X80 Y60, 每日收菜
    Gui, Add, Button, W80 H40 X80 Y110, 领取任务
    Gui, Add, Button, W80 H40 X170 Y10, 1-7固源岩
    Gui, Add, Button, W80 H40 X170 Y60, 3-1酮凝集组
    Gui, Add, Button, W80 H40 X170 Y110, 3-2轻锰矿
    Gui, Add, Button, W80 H40 X260 Y10, R8-2扭转醇
    Gui, Add, Button, W80 H40 X260 Y60, 7-15全新装置
    Gui, Add, Button, W80 H40 X260 Y110, 7-17研磨石
    Gui, Add, Button, W80 H40 X350 Y10, 活动图1
    Gui, Add, Button, W80 H40 X350 Y60, 活动图2
    Gui, Add, Button, W80 H40 X350 Y110, 活动图3
    Gui, Add, Button, W80 H40 X440 Y10, 定时关机
    Gui, Add, Button, W80 H40 X440 Y60, 取消关机
    ; 定时关机时长下拉列表，默认2小时。不同列用单竖线|分割，后跟双竖线||的列为默认列
    Gui, Add, DropDownList, vTimeChoice W78 hwndhcbx X441 Y111, 1|2||3|4|5|6|7|8
    ; 使用 PostMessage 发送消息到窗口或控件，CB_SETITEMHEIGHT 的消息号为 0x153
    ; Microsoft Windows 控件使用 CB_SETITEMHEIGHT 消息来设置列表框或组合框中选择字段的高度
    ; 设置下拉列表框的高度
    PostMessage, 0x153, -1, 31,, ahk_id %hcbx%
    ; 设置下拉列表每一项的高度
    PostMessage, 0x153, 0, 31,, ahk_id %hcbx%
    ; 窗口长度
    ;Gui, Show , W440, ArknightsHelper 
    Gui, Add, Button, W80 H140 X530 Y10, 定时睡眠
    Gui, Add, Button, W80 H140 X620 Y10, 启动MuMu
    Gui, Show ,W710, ArknightsHelper 
}
return

Button暂停:
    Pause
return

Button重启:
    Reload
return

Button退出:
ExitApp
return

GuiClose:
ExitApp
return

; 定时关机
Button定时关机:
    Gui,Submit
    time := TimeChoice*3600
    Run, %A_WinDir%\system32\shutdown.exe -s -t %time%,,Hide
    ; 运行定时关机命令后会自动关闭窗口，需要重绘GUI
    drawWindow()
return

; 取消关机
Button取消关机:
    Run %A_WinDir%\system32\shutdown.exe -a,,Hide
    ; 运行取消关机命令后不会自动关闭窗口，无需重绘GUI
return

; 定时睡眠
Button定时睡眠:
    Gui,Submit
    time := TimeChoice*3600000
    Sleep %time%
    Run, %A_WinDir%\system32\shutdown.exe -h,,Hide
    drawWindow()
    ; goHibernation()
return

; goHibernation(){
;     Run, %A_WinDir%\system32\shutdown.exe -h,,Hide
; }

; 启动MuMu
Button启动MuMu:
    Run, D:\Game\MuMu\emulator\nemu\EmulatorShell\NemuPlayer.exe
    Sleep 25000
    MouseClick, Left, 125, 165
    Sleep 15000
    IfWinExist 明日方舟 - MuMu模拟器
    {
        WinActivate
        Sleep 500
        Send {W}
        Sleep 10000
        Send {W}
        Sleep 15000
        Send {X}
        Sleep 5000
        Send {X}
        Sleep 5000
        Send {X}
        Sleep 5000
        Send {X}
        Sleep 5000
        Send {X}
        Sleep 5000
        backHome()
        Sleep 1000
        visitBase()
        backHome()
        cleanBase()
    }
return

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
        startAct(75500,22)
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

ButtonR8-2扭转醇:
    IfWinExist 明日方舟 - MuMu模拟器
    {
        WinActivate
        Sleep 300
        startAct(115000,8)
    }
return

Button7-15全新装置:
    IfWinExist 明日方舟 - MuMu模拟器
    {
        WinActivate
        Sleep 300
        startAct(142000,6)
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

Button活动图1:
    IfWinExist 明日方舟 - MuMu模拟器
    {
        WinActivate
        Sleep 300
        startAct(146000,7)
    }
return

Button活动图2:
    IfWinExist 明日方舟 - MuMu模拟器
    {
        WinActivate
        Sleep 300
        startAct(123000,7)
    }
return

Button活动图3:
    IfWinExist 明日方舟 - MuMu模拟器
    {
        WinActivate
        Sleep 300
        startAct(123000,14)
    }
return

; 检测行动结束（未实装）
; 0xff9602:经验橙:250, 150
; 0x0098DC:任务蓝:300, 60 
; ^+i::
;     Color:=getColor(300, 60)
;     MsgBox The color is %Color%.
; return

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
        loop 11
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
        loop 30
        {
            Send {C}
            Sleep 1000
        }
        Send {]}
        loop 10
        {
            Send {C}
            Sleep 1000
        }
    }
}

; 获取颜色
; 0xff9602:经验橙:250, 150
; 0x0098DC:任务蓝:300, 60 
getColor(x, y) {
    PixelGetColor, color, %x%,%y%, RGB
return color
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