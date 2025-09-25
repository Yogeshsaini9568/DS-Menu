sub init()
    m.iconBg = m.top.findNode("iconBg")
    m.icon = m.top.findNode("icon")
    m.customBtn=m.top.findNode("customBtn")

    iconBound = m.icon.boundingRect()
    m.icon.translation = [(m.iconBg.width-iconBound.width)/2,(m.iconBg.height-iconBound.height)/2]

    m.keyboard = m.top.findNode("keyboard")
    m.keyboard.setFocus(true)

    m.keyboard.observeField("text", "onTextChanged")
end sub

sub onTextChanged(event as Object)
    query = event.getData()
    ?"---------------------> " query
    
    if len(query) = 6 then
        code = "aaaaaa"
        if code = query then
            showHomeScreen()
        else 
            showInvalidDialog()
        end if
    end if
end sub

sub showHomeScreen()
    m.homePage = CreateObject("roSGNode", "HomeScene")
    m.top.appendChild(m.homePage)
    m.top.focusable = false
    m.homePage.setFocus(true)
end sub

sub showInvalidDialog()
    dialog = CreateObject("roSGNode", "Dialog")
    dialog.message = "Invalid Code"
    dialog.buttons = ["OK"]
    m.top.appendChild(dialog)
    dialog.setFocus(true)
end sub

function onKeyEvent(key as string, press as boolean) as boolean
    if press
        if key = "ok"
            ?"ok click ho gya...."
            return true
        else if key = "down"
            if m.customBtn.visible = true
                m.customBtn.setFocus(true)
                m.customBtn.findNode("btnBg").blendColor="#612fcdff"
                m.customBtn.findNode("btnLabel").color="#612fcdff"            
                return true
            end if
        else if key = "up"
            if m.keyboard.visible = true
                m.keyboard.setFocus(true)
                m.customBtn.findNode("btnBg").blendColor="#f3f3f3ff"
                m.customBtn.findNode("btnLabel").color="#f3f3f3ff"
                return true
            end if
        end if
    end if
    return false
end function

