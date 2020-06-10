; 暂停脚本
^p::Pause
; 重新加载
^r::Reload

; 输入密码
^l::SendInput yourpassword

; 0xff9602:经验橙:250, 150
; 0x0098DC:任务蓝:300, 60 
; ^i::
; Color:=getColor(300, 60)
; MsgBox The color is %Color%.
; return

; 访问基建+清理基建和订单
^b::
    {
        visitBase()
        backHome()
        cleanBase()
    }
return

; 回首页
^h::backHome()

; 领取任务
^t::recieveTask()

; DM8,18san,115000,异铁组,G
^m::startAct(115000,6)

; 1-7,6san,75000,固源岩,G
^g::startAct(75000,20)

; 3-2,15san,10500,轻锰矿,K
^k::startAct(10500,8)

; S4-1,18san,110000,异铁组+异铁块,Y
^y::startAct(110000,6)

; 4-4,18san,140000,扭转醇,N
!n::startAct(140000,7)

; 7-15,18san,139000,全新装置,Q
^q::startAct(139000,7)

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
    Send {B}
    Sleep % lasting
    loop % times-1
    {
        IfWinExist 明日方舟 - MuMu模拟器
        {
            WinActivate
            Sleep 300
            Send {G}
            Sleep 3800
            Send {B}
            Sleep 1800
            Send {B}
            Sleep % lasting
        }
    }
}