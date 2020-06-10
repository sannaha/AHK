; ////////////////////////////////////////////
; /////////////////AHK脚本列表/////////////////
; ////////////////////////////////////////////
; AHK脚本启动管理器（自身）
scriptTitle0:="OneStartUp.ahk - AutoHotkey"
scriptPath0:="D:\Software\links\OneStartUp.ahk"
; 明日方舟护肝助手
scriptTitle1:="Arknights.ahk - AutoHotkey"
scriptPath1:="D:\Software\links\AHK Scripts\Arknights.ahk"
; 音量切换助手
scriptTitle2:="SwitchAudio.ahk - AutoHotkey"
scriptPath2:="D:\Software\links\AHK Scripts\SwitchAudio.ahk"

; ////////////////////////////////////////////
; //////////////////脚本启动器/////////////////
; ////////////////////////////////////////////
; 重新加载
!+r::Reload
; 提权
!+a::runScript(scriptPath0,true)
; 退出
!+q::sendcmd("退出",scriptTitle0)

; ////////////////////////////////////////////
; //////////////明日方舟护肝助手///////////////
; ////////////////////////////////////////////
; 运行
!F1::runScript(scriptPath1,true)
; 重新加载
+F1::sendcmd("重启",scriptTitle1)
; 退出
!+F1::sendcmd("退出",scriptTitle1)

; ////////////////////////////////////////////
; ////////////////音量切换助手/////////////////
; ////////////////////////////////////////////
; 运行
!F2::runScript(scriptPath2, false)
; 重新加载
+F2::sendcmd("重启",scriptTitle2)
; 退出
!+F2::sendcmd("退出",scriptTitle2)

; ////////////////////////////////////////////
; ////////////////脚本状态管理/////////////////
; ////////////////////////////////////////////
sendcmd(cmd,scriptname)
{
    ; 允许控制隐藏窗口
    DetectHiddenWindows, on
    ; 窗口标题的任意位置包含 WinTitle 才能匹配
    SetTitleMatchMode,2
    cmd_no:={重启:65303,编辑:65304,挂起:65305,暂停:65306,退出:65307}
    PostMessage, 0x111,cmd_no[cmd],,,%scriptname%
    return %cmd%
}

; ////////////////////////////////////////////
; ////////////////脚本启动管理/////////////////
; ////////////////////////////////////////////
runScript(scriptPath, isAdmin){
    ; 判断是否以管理员身份运行
    if(isAdmin){
        Run *RunAs %scriptPath%, SANNAHA, ysy, 
    }else{
        Run %scriptPath%
    }
}