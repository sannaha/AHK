#Home::switchAudio()
switchAudio(){
    ; 打开“声音”控制面板
    Run c:\windows\system32\control.exe mmsys.cpl
    ; 等待“声音”控制面板打开，并置顶
    WinWaitActive 声音
    WinSet AlwaysOnTop, On, 声音
    ; 选中播放设备
    Send {DOWN}
    ; 获取“设为默认值”按钮（Button2）的启用状态，控件启用为 1, 控件禁用时为 0
    ControlGet, MyState, Enabled, , Button2
    ; 如果控件启用（即“设为默认值”按钮启用，换句话说：当前播放设备未设为默认）
    If (MyState = 1){
        ; 点击活动窗口（A）的“设为默认值”按钮
        ControlClick, Button2, A
    } Else {
        ; 否则选中下一个播放设备
        Send, {DOWN}
        ControlClick, Button2, A
    } 
    WinClose, 声音 
}