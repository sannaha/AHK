; 暂停脚本
^p::Pause

; 访问基建+清理基建和订单
^f::
    {
        visitBase()
        backHome()
        cleanBase()
    }
return

; 清理基建和订单
^b::cleanBase() 

; 回首页
^h::backHome()

; 领取任务
^t::recieveTask()

; 1-7,6san,82000,固源岩,G
^g::startAct(82000,20)

; s4-1,18san,110000,异铁组+异铁块,Y
^y::startAct(110000,6)

; 3-2,15san,10500,轻锰矿,K
^k::startAct(10500,7)

; 4-4,18san,14000,扭转醇,Z
^z::startAct(140000,6)

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
        Send {M}
        Sleep 1500
        Send {M}
        Sleep 1500
        Send {F}
        Sleep 1500
        loop 12
        {
            Send {O}
            Sleep 1200
        }
        Sleep 1200
        Send {M}
        loop 12
        {
            Send {O}
            Sleep 1200
        }
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
        loop 20
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
    loop % times
    {
        IfWinExist 明日方舟 - MuMu模拟器
        {
            WinActivate
            Send {B}
            Sleep 1800
            Send {B}
            Sleep % lasting
            Send {G}
            Sleep 3800
        }
    }
}