; 暂停脚本
^+p::Pause
; 重新加载
^+r::Reload

; 输入密码
^+l::SendInput yourpassword

; 检测行动结束（未实装）
; 0xff9602:经验橙:250, 150
; 0x0098DC:任务蓝:300, 60 
; ^+i::
;     Color:=getColor(300, 60)
;     MsgBox The color is %Color%.
; return

; 访问基建+清理基建和订单
^+b::
    {
        visitBase()
        backHome()
        cleanBase()
    }
return

; 回首页
^+h::backHome()

; 领取任务
^+t::recieveTask()

; 1-7,6san,82000,固源岩,G
^+g::startAct(75500,88)

; 7-15,18san,140000,全新装置,Q
^+q::startAct(140000,6)

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